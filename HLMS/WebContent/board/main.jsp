<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="main.jsp">
<title>HakSa</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
</head>

<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<script type="text/javascript"></script>

<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="jumbotron" class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgreen;">
			<h1><font color="green"><strong>HakSa</strong>&nbsp;<span class="glyphicon glyphicon-blackboard"></span></font></h1>
			<p><font color="green">Welcome To HS HakSa</font></p>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Editor's Choice</h3>
					</div>
				  <c:forEach items="${dsBoardListByRating}" var="dsBoardListByRating">
				  <div class="panel-body">
					  <div class="col-md-7"><a onclick ="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/board/retrieveBoard.do?boardNo=${dsBoardListByRating.BOARD_NO}')">${dsBoardListByRating.BOARD_TITLE}</a></div>
					  <div class="col-md-3"><img alt="User Pic" id="userImage" src="${context}/userImg/${dsBoardListByRating.USER_IMAGE}" height="21px" width="15px" class="img-circle">${dsBoardListByRating.USER_ID}</div>
					  <div class="col-md-2" style="color: gray;"><small>${dsBoardListByRating.BOARD_TIMEAGO}</small></div>
				  </div>
				  <hr style="margin: 0;">
				  </c:forEach>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Editor's Hits</h3>
					</div>
				  <c:forEach items="${dsBoardListByHits}" var="dsBoardListByHits">
				  <div class="panel-body">
					  <div class="col-md-7"><a onclick ="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/board/retrieveBoard.do?boardNo=${dsBoardListByHits.BOARD_NO}')">${dsBoardListByHits.BOARD_TITLE}</a></div>
					  <div class="col-md-3"><img alt="User Pic" id="userImage" src="${context}/userImg/${dsBoardListByHits.USER_IMAGE}" height="21px" width="15px" class="img-circle">${dsBoardListByHits.USER_ID}</div>
					  <div class="col-md-2" style="color: gray;"><small>${dsBoardListByHits.BOARD_TIMEAGO}</small></div>
				  </div>
				  <hr style="margin: 0;">
				  </c:forEach>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Recent Board<a onclick ="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/board/retrieveBoardList.do')"><font color="lightblack"><span class="glyphicon glyphicon-plus pull-right"></span></font></a></h3>
					</div>
				  <c:forEach items="${dsBoardListByTime}" var="dsBoardListByTime">
				  <div class="panel-body">
					  <div class="col-md-8"><a onclick ="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/board/retrieveBoard.do?boardNo=${dsBoardListByTime.BOARD_NO}')">${dsBoardListByTime.BOARD_TITLE}</a></div>
					  <div class="col-md-2"><img alt="User Pic" id="userImage" src="${context}/userImg/${dsBoardListByTime.USER_IMAGE}" height="21px" width="15px" class="img-circle">${dsBoardListByTime.USER_ID}</div>
					  <div class="col-md-2" style="color: gray;"><small>${dsBoardListByTime.BOARD_TIMEAGO}</small></div>
				  </div>
				  <hr style="margin: 0;">
				  </c:forEach>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">Recent Connected UserList</h3>
					</div>
				  <c:forEach items="${dsUserListByRecent}" var="dsUserListByRecent">
				  <div class="panel-body">
					  <div class="col-md-2"><img alt="User Pic" id="userImage" src="${context}/userImg/${dsUserListByRecent.USER_IMAGE}" height="21px" width="15px" class="img-circle"></div>
					  <div class="col-md-3" style="color: gray;"><small>${dsUserListByRecent.ID}</small></div>
					  <div class="col-md-5 col-md-offset-2" style="color: gray;"><small>${dsUserListByRecent.CONNECT_DATE}</small></div>
				  </div>
				  <hr style="margin: 0;">
				  </c:forEach>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>