<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/common.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<style type="text/css">
li{
	cursor: pointer;
}
a{
	text-decoration:none !important;
}
</style>
</head>


<c:set var="homeUrl">${context}/work/board/goMain.do</c:set>
<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="officeUrl">${context}/work/board/retrieveboardList.do?category=O</c:set>
<c:set var="penUrl">${context}/work/board/retrieveboardList.do?category=P</c:set>
<c:set var="binderUrl">${context}/work/board/retrieveboardList.do?category=B</c:set>
<c:set var="designUrl">${context}/work/board/retrieveboardList.do?category=D</c:set>
<c:set var="storageUrl">${context}/work/board/retrieveboardList.do?category=S</c:set>
<body>
	<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
		<div class="container" style="background-color: black;">
			<ul class="nav navbar-nav">
				<li><a href="${homeUrl}"><font color="white"><strong>Travel Interact</strong></font></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<c:if test="${sessionScope.id != null}">
						<a href="${context}/work/board/retrieveBoardList.do"><font color="white"><strong>게시판</strong></font></a>
					</c:if>
				</li>
				<li>
					<c:if test="${sessionScope.id == null}">
						<a href="${context}/work/user/createUser.do"><font color="white"><strong>회원가입</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a href="${context}/work/user/updateUser.do"><font color="white"><strong>정보수정</strong></font></a>
					</c:if>
				</li>
				<li>
					<c:if test="${sessionScope.id == null}">
						<a href="${context}/user/login.jsp"><font color="white"><strong>LOGIN</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null}">
						<a href="${context}/work/user/logout.do"><font color="white"><strong>LOGOUT</strong></font></a>
					</c:if>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>