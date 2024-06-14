<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="root" value="${pageContext.request.contextPath }"/>
<%--<c:set var="userVo" value="${SPRING_SECURITY_CONTEXT.authentication.principal }"/> --%>
<%--<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities }" />--%>
<%--이제 필요없는 코드 --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All's</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${root}/resources/css/common.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="${root}/resources/js/common.js" charset="UTF-8" defer></script>
</head>
<body>
    <jsp:include page="include/header.jsp" />
    <!-- 중앙 컨테이너 -->
    <div id="container">
        <section>
            <!-- 메뉴 영역 -->
            <nav>
                <jsp:include page="include/navbar.jsp" />
            </nav>
            <!-- 본문 영역 -->
            <main>
                <!--모바일 메뉴 영역-->
                <div class="m-menu-area" style="display: none;">
                    <jsp:include page="include/navbar.jsp" />
                </div>
                <!--각 페이지의 콘텐츠-->
                <div id="content">
                    <h1>대시보드</h1>
                    <%-- 로그인하지 않은 사용자에게만 표시 --%>
                    <sec:authorize access="isAnonymous()">
                        <div class="non-login-section">
                            <div class="service-info bg-green">
                                <div class="service-info-left">
                                    <h3>서비스</h3>
                                    <h2>혼자 공부하기 힘든 분들을 위한 스터디 서비스!</h2>
                                    <p>다양한 학습 관리, 정보 제공, 취업 지원 기능을 통합하여 학습자가 효율적으로 자기계발과 목표 달성에 집중할 수 있도록 돕는 포괄적인 스터디 플랫폼을 제공합니다</p>
                                </div>
                                <div class="service-info-right flex-colum">
                                    <button class="secondary-default">공부노트<i class="bi bi-arrow-right"></i></button>
                                    <button class="secondary-default">캘린더<i class="bi bi-arrow-right"></i></button>
                                    <button class="secondary-default">스터디 그룹<i class="bi bi-arrow-right"></i></button>
                                    <button class="secondary-default">공부 자료<i class="bi bi-arrow-right"></i></button>
                                    <button class="secondary-default">이력서 작성<i class="bi bi-arrow-right"></i></button>
                                </div>
                            </div>
                            <div class="iogin-info flex-colum bg-green">
                                <h3>지금부터<br> 함께 공부해봐요!</h3>
                                <button class="primary-default" onclick="location.href='${root}/Users/UserLoginForm'">로그인</button>
                                <button class="secondary-default" onclick="location.href='${root}/Users/Join'">회원가입</button>
                            </div>
                        </div>
                    </sec:authorize>
                    <%-- 로그인한 사용자에게만 표시 --%>
                    <!--슬라이드 배너-->
                    <div class="study-promotion">
                        <h2>Study Group</h2>
                        <div class="slide-banner">
                            <div class="slide-button-group">
                                <button class="slide-button" aria-label="이전">
                                    <i class="bi bi-caret-left-fill"></i>
                                </button>
                                <button class="slide-button" aria-label="다음">
                                    <i class="bi bi-caret-right-fill"></i>
                                </button>
                            </div>
                            <div class="banner-list flex-between">
                                <dlv class="banner-item bgwhite" tabindex="0" onclick="">
                                    <div class="banner-item-top">
                                        <div class="banner-img">
                                            <img src="${root}/resources/images/logo.png" alt="스터디 그룹 로고"/>
                                        </div>
                                        <div class="banner-title">
                                            <p class="banner-main-title">강남인근 면접 스터디 모집</p>
                                            <p class="banner-id">Jihyeon</p>
                                        </div>
                                    </div>
                                    <p>강남역 근처에서 스터디 모집해요~</p>
                                    <div class="banner-bottom flex-between">
                                        <div>
                                            <span class="banner-tag">면접</span>
                                            <span class="banner-tag">강남</span>
                                        </div>
                                        <button class="banner-like" aria-label="좋아요">
                                            <i class="bi bi-heart"></i>
                                        </button>
                                    </div>
                                </dlv>
                                <dlv class="banner-item bgwhite" tabindex="0" onclick="">
                                    <div class="banner-item-top">
                                        <div class="banner-img">
                                            <img src="../img/manggom.png" alt="스터디 그룹 로고"/>
                                        </div>
                                        <div class="banner-title">
                                            <p class="banner-main-title">강남인근 면접 스터디 모집</p>
                                            <p class="banner-id">Jihyeon</p>
                                        </div>
                                    </div>
                                    <p>강남역 근처에서 스터디 모집해요~</p>
                                    <div class="banner-bottom flex-between">
                                        <div>
                                            <span class="banner-tag">면접</span>
                                            <span class="banner-tag">강남</span>
                                        </div>
                                        <button class="banner-like" aria-label="좋아요">
                                            <i class="bi bi-heart"></i>
                                        </button>
                                    </div>
                                </dlv>
                                <dlv class="banner-item bgwhite" tabindex="0" onclick="">
                                    <div class="banner-item-top">
                                        <div class="banner-img">
                                            <img src="../img/manggom.png" alt="스터디 그룹 로고"/>
                                        </div>
                                        <div class="banner-title">
                                            <p class="banner-main-title">강남인근 면접 스터디 모집</p>
                                            <p class="banner-id">Jihyeon</p>
                                        </div>
                                    </div>
                                    <p>강남역 근처에서 스터디 모집해요~</p>
                                    <div class="banner-bottom flex-between">
                                        <div>
                                            <span class="banner-tag">면접</span>
                                            <span class="banner-tag">강남</span>
                                        </div>
                                        <button class="banner-like" aria-label="좋아요">
                                            <i class="bi bi-heart"></i>
                                        </button>
                                    </div>
                                </dlv>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </section>
      <sec:authorize access="isAuthenticated()"> <%-- 로그인한 사용자에게만 정보 표시 --%>
    <div>
        <c:if test="${not empty userVo.profileImage}">
            <img src="${root }/resources/images/${userVo.profileImage}" alt="프로필 이미지" class="profile-image">
            <img src="${root}${userVo.profileImage}" alt="">
        </c:if>
        <p>환영합니다, ${userVo.name} 님!</p>
        <p>아이디: ${userVo.username}</p>
        <p>이메일: ${userVo.email}</p>
    </div>
    <div>
        <a href="${root}/Users/UsersUpdateForm">회원 정보 수정</a>
        <a href="${root}/Users/UsersImageForm">프로필 이미지 변경</a>
        <form method="POST" action="${root}/Users/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit">로그아웃</button>
        </form>
    </div>
</sec:authorize>

<sec:authorize access="isAnonymous()"> <%-- 로그인하지 않은 사용자에게만 표시 --%>
    <p>로그인 후 이용 가능합니다.</p>
    <a href="${root}/Users/UsersLoginForm">로그인</a>
    <a href="${root}/Users/Join">회원가입</a>
</sec:authorize>
      
        <!--푸터-->
        <jsp:include page="include/footer.jsp" />
    </div>
    <jsp:include page="include/timer.jsp" />
</body>
</html>
