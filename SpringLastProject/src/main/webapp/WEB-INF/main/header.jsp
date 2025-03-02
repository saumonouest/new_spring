<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="top_header_area">
        <div class="container">
            <div class="row">
                <div class="col-5 col-sm-6">
                    <!--  Top Social bar start -->
                    <div class="top_social_bar">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                    </div>
                </div>
                <!--  Login Register Area -->
                <div class="col-7 col-sm-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">
                          <c:if test="${sessionScope.userId==null }">
                            <div class="login">
                                <a href="../member/login.do">로그인</a>
                            </div>
                            <div class="register">
                                <a href="../member/join.do">회원가입</a>
                            </div>
                          </c:if>
                          <c:if test="${sessionScope.userId!=null }">
                            <div class="login">
                                ${sessionScope.userName}(<sec:authorize access="hasRole('ROLE_ADMIN')">관리자</sec:authorize>
                                  <sec:authorize access="hasRole('ROLE_USER')">일반사용자</sec:authorize>
                                )
                                님 로그인되었습니다&nbsp;&nbsp;
                                <a href="../member/logout.do">로그아웃</a>
                            </div>
                            
                          </c:if>
                        </div>
                        
                        <!-- <div class="search_button">
                            <a class="searchBtn" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                        </div>
                       
                        <div class="search-hidden-form">
                            <form action="#" method="get">
                                <input type="text" name="search" placeholder="아이디 입력">
                                <input type="password" name="search" placeholder="비밀번호 입력">
                                <input type="submit" value="" class="d-none">
                                <span class="searchBtn"><i class="fa fa-times" aria-hidden="true"></i></span>
                            </form>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Top Header Area End ****** -->

    <!-- ****** Header Area Start ****** -->
    <header class="header_area">
        <div class="container">
            <div class="row">
                <!-- Logo Area Start -->
                <div class="col-12">
                    <div class="logo_area text-center">
                        <a href="../main/main.do" class="yummy-logo">Food & Recipe & Travel</a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-nav" aria-controls="yummyfood-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i> Menu</button>
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="yummyfood-nav">
                            <ul class="navbar-nav" id="yummy-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="../main/main.do">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">회원</a>
                                    <c:if test="${sessionScope.userId==null }">
	                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
	                                        <a class="dropdown-item" href="index.html">회원가입</a>
	                                        <a class="dropdown-item" href="archive.html">아이디찾기</a>
	                                        <a class="dropdown-item" href="single.html">비밀번호찾기</a>
	                                    </div>
                                    </c:if>
                                    <c:if test="${sessionScope.userId!=null }">
	                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
	                                        <a class="dropdown-item" href="index.html">회원수정</a>
	                                        <a class="dropdown-item" href="archive.html">회원탈퇴</a>
	                                        
	                                    </div>
                                    </c:if>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">맛집</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../food/list.do">맛집목록</a>
                                        <a class="dropdown-item" href="../food/find.do">맛집검색</a>
                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
                                         <a class="dropdown-item" href="../reserve/reserve_main.do">맛집예약</a>
                                         <a class="dropdown-item" href="../recommand/recommand_main.do">맛집추천</a>
                                        </sec:authorize>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">레시피</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../recipe/list.do">레시피목록</a>
                                        <a class="dropdown-item" href="../chef/list.do">쉐프목록</a>
                                       <sec:authorize access="hasRole('ROLE_USER')">
                                        <a class="dropdown-item" href="single.html">레시피만들기</a>
                                       </sec:authorize>                    
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">여행</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../seoul/location.do">명소</a>
                                        <a class="dropdown-item" href="../seoul/nature.do">자연 & 관광</a>
                                        <a class="dropdown-item" href="../seoul/shop.do">쇼핑</a>
                                        <a class="dropdown-item" href="single.html">여행 코스</a>
                                        <a class="dropdown-item" href="single.html">실시간 날씨</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../goods/list.do">스토어</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="../freeboard/list.do">자유게시판</a>
                                        <a class="dropdown-item" href="archive.html">공지사항</a>
                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
                                         <a class="dropdown-item" href="single.html">1:1채팅</a>
                                         <a class="dropdown-item" href="archive.html">묻고답하기</a>
                                         <a class="dropdown-item" href="../chat/chat.do">실시간 채팅</a>
                                        </sec:authorize>
                                              
                                    </div>
                                </li>
                                <sec:authorize access="hasRole('ROLE_USER')">
                                 <li class="nav-item">
                                    <a class="nav-link" href="../reserve/reserve_main.do">빠른예약</a>
                                 </li>
                                </sec:authorize>
                                
                                <sec:authorize access="hasRole('ROLE_USER')">
                                 <li class="nav-item">
                                    <a class="nav-link" href="../mypage/mypage_main.do">마이페이지</a>
                                 </li>
                                </sec:authorize>  
                                 
                                <sec:authorize access="hasRole('ROLE_ADMIN')">        
                                 <li class="nav-item">
                                    <a class="nav-link" href="../admin/admin_main.do">관리자페이지</a>
                                 </li>
                                </sec:authorize>
                                
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
</body>
</html>