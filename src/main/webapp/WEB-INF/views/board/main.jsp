<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>산학연계 포트폴리오 운영시스템</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link rel="stylesheet" href="${cpath}/resources/css/prev.css">
	
	<%
		String GB = (String) session.getAttribute("USER_GB");
	%>
	
	<style>
	.sidebar-item-btn:hover {
		background-color: #30436b;
		color: white;
	}
	
	.sidebar-color {
		background-color: #172e5a;
		color: white;
	}
	</style>
</head>

<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="sidebar-item sidebar-color" id="sidebar-wrapper">
			<!-- 좌측 배너 -->
			<div id=MENU class="sidebar-heading border-bottom" style="background-color: white">
				<a href="main.jsp"><img src="img/dept-logo.jpg" style="width: 240px; height: 70px;" href="main.jsp" /></a> <br>
			</div>
			<div class="list-group list-group-flush">
				<input id=BTN_MENU1
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('calendar.jsp')" value="학사일정"
					style="display:;"> <input id=BTN_MENU2
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('board_Main.jsp?board_gb=02')"
					value="학과소식" style="display:"> <input id=BTN_MENU3
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('board_Main.jsp?board_gb=03')"
					value="학생 포트폴리오" style="display:"> <input id=BTN_MENU4
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('board_Main.jsp?board_gb=04')"
					value="기업정보" style="display:"> <input id=BTN_MENU5
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('student_State.jsp')" value="학생 현황"
					style="display:"> <input id=BTN_MENU6
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('FRM_SCLDIV.jsp')" value="학부/학과 관리"
					style="display: none"> <input id=BTN_MENU9
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('FRM_USER.jsp')" value="사용자 관리"
					style="display: none"> <input id=BTN_MENU10
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('FRM_STUDENT.jsp')" value="학생 현황관리"
					style="display: none"> <input id=BTN_MENU7
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('FRM_TCHSUBJ.jsp')" value="교수/학과목 관리"
					style="display: none"> <input id=BTN_MENU8
					class="sidebar-item-btn list-group-item  list-group-item-light p-3 sidebar-color"
					type="button" onclick="page('FRM_COMP.jsp')" value="채용기업 관리"
					style="display: none">
			</div>
		</div>
		<!-- 좌측 배너 끝 -->
		<!-- Page content wrapper-->
		<div id="page-content-wrapper" style="background-color: #f6f9ff">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-pink bg-pink border-bottom"
				style="background-color: #ffffff; height: 71px;">
				<div class="container-fluid">
					<!--  
                        <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        -->
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<li class="nav-item"><a class="nav-link" href="#!"><img
									src="./img/main_user_icon.png"
									style="width: 30px; height: 30px;" /></a></li>
							<li class="nav-item active"><a class="nav-link"
								style="color: #172e5a"><%=(String) session.getAttribute("USER_NM")%>
									님</a></li>
							<li class="nav-item active"><a class="nav-link"
								href="logout.jsp"><img src="./img/main_exit_icon.png"
									style="width: 30px; height: 30px;" /></a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!--페이지 내용 부분 -->
			<div id="innerContent" class="container-fluid" style="background-color: #f6f9ff">
				​​
			</div>

		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

