<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
    if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>

<c:set var="userVo" value="${sessionScope.userVo}"/> <%-- 세션에서 userVo 가져오기 --%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 공부노트 > 공부 > All's</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${root}/resources/css/common.css?after">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="${root}/resources/js/common.js" charset="UTF-8" defer></script>

    <script>
        //좋아요 버튼
        function toggleLike(element, idx) {
            const icon = element.querySelector('i');
            const isLiked = !element.classList.contains('liked');

            if (isLiked) {
                element.classList.add('liked');
                icon.className = 'bi bi-heart-fill';
                $.ajax({
                    method: 'POST',
                    url: '/studyNote/insertLike',
                    data: { referenceIdx: idx, userIdx: ${userVo.userIdx} },
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
                    },
                });
            } else {
                element.classList.remove('liked');
                icon.className = 'bi bi-heart';
                $.ajax({
                    method: 'POST',
                    url: '/studyNote/deleteLike',
                    data: { referenceIdx: idx, userIdx: ${userVo.userIdx} },
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
                    },
                });
            }
        }

        //검색 버튼
        function searchPosts() {
            let searchKeyword = document.getElementById('searchInput').value;
            let searchOption = document.getElementById('searchOption').value;

            location.href="${root}/studyNote/noteList?searchKeyword="+searchKeyword + "&searchOption=" + searchOption;
        }

        function loadMore() {
            let searchKeyword = document.getElementById('searchInput').value;
            let searchOption = document.getElementById('searchOption').value;
            let limits = Number(document.getElementById('limits').value);
            let userIdx = '${userVo.userIdx}';

            let totalCount = '${studyReferencesEntity[0].TOTALCOUNT}'
            if(limits >= Number(totalCount)){
                alert('더이상 조회할 게시물이 없습니다.');

            }else{
                limits += 5;
                location.href="${root}/studyNote/noteList?searchKeyword="+searchKeyword + "&searchOption=" + searchOption + "&limits="+limits + "&userIdx=" + userIdx;
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            var searchInput = document.getElementById("searchInput");
            searchInput.addEventListener("keypress", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    searchPosts();
                }
            });
        });
    </script>

    <style>
        .link-button p{
            max-height: 10vw;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align: left;
        }
        .link-button img {
            display: none;
        }

        /* 첫 번째 이미지 보이기 */
        .link-button img:first-of-type:not(p img), .link-button p:first-of-type img{
            display: block;
            max-width: 100%; /* 부모 요소의 너비를 넘지 않도록 */
            height: auto; /* 원본 비율 유지 */
            max-height: 10vw; /* 최대 높이를 15vw로 제한 */
            width: auto; /* 원본 비율 유지 */
        }
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<!-- 중앙 컨테이너 -->
<div id="container">
    <section class="mainContainer">
        <!-- 메뉴 영역 -->
        <nav>
            <jsp:include page="../include/navbar.jsp" />
        </nav>
        <!-- 본문 영역 -->
        <main>
            <!--모바일 메뉴 영역-->
            <div class="m-menu-area" style="display: none;">
                <jsp:include page="../include/navbar.jsp" />
            </div>
            <!--각 페이지의 콘텐츠-->
            <div id="content">
                <h1>내 공부노트</h1>

                <!--본문 콘텐츠-->
                <div class="maxcontent">
                    <div class="list-title flex-between">
                        <h3>전체 글(${studyReferencesEntity[0].TOTALCOUNT})</h3>
                        <fieldset class="search-box flex-row">
                            <select id="searchOption" name="searchCnd" title="검색 조건 선택">
                                <option value="all-post">전체</option>
                                <option value="title-post">제목</option>
                                <option value="title-content">제목+내용</option>
                                <option value="writer-post">작성자</option>
                            </select>
                            <p class="search-field">
                                <input id="searchInput" type="text" name="searchWrd" placeholder="검색어를 입력해주세요">
                                <input type="hidden" id="limits" class="search-bar" value="${limits}">
                                <button onclick="searchPosts()">
                                    <span class="hide">검색</span>
                                    <i class="bi bi-search"></i>
                                </button>
                            </p>
                            <button type="button" class="primary-default" onclick="location.href='${root}/studyNote/noteWrite'">글쓰기</button>
                        </fieldset>
                    </div>

                    <div class="boardContent flex-colum">
                        <c:forEach var="data" items="${studyReferencesEntity}">


                            <%--게시글 상세 item--%>
                            <div class="board-listline flex-columleft">
                                <div class="studygroup-item flex-between">
                                    <!--스터디 목록-->
                                    <div class="imgtitle flex-row" onclick="location.href='${root}/studyNote/noteRead?referenceIdx=${data.referenceIdx}'" tabindex="0">
                                        <div class="board-item flex-columleft">
                                            <h3 class="board-title">${data.title}
                                                <c:if test="${data.isPrivate == 'true'}">
                                                    <i class="bi bi-lock-fill"></i>
                                                </c:if>
                                                <c:if test="${data.isPrivate == 'false'}">
                                                    <i class="bi bi-lock-fill" style="display: none"></i>
                                                </c:if>
                                            </h3>
                                            <p class="board-content">작성자: ${data.name}  |   작성일: ${data.createdAt}  |  조회수: ${data.viewsCount}</p>
                                        </div>
                                    </div>

                                    <!-- 페이지 새로고침해도 좋아요된것은 유지되도록 -->
                                    <c:choose>
                                        <c:when test="${data.isLike != 0}">
                                            <button class="flex-row liked" onclick="toggleLike(this, ${data.referenceIdx})">
                                                <i class="bi bi-heart-fill"></i>
                                                <p class="info-post">좋아요</p>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="flex-row" onclick="toggleLike(this, ${data.referenceIdx})">
                                                <i class="bi bi-heart"></i>
                                                <p class="info-post">좋아요</p>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <button class="editor-content link-button" onclick="location.href='${root}/studyNote/noteRead?referenceIdx=${data.referenceIdx}'">
                                        ${data.content}
                                    <img/>
                                </button>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="flex-row">
                        <button class="secondary-default" onclick="loadMore()">목록 더보기</button>
                    </div>
                </div>
                <%--본문 콘텐츠--%>
            </div>
            <%--콘텐츠 끝--%>
        </main>
    </section>
</div>
<!--푸터-->
<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/timer.jsp" />
</body>
</html>
