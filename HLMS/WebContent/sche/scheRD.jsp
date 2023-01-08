<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="scheRD.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HakSa</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
    <link href="${context}/css/process.css" rel="stylesheet">

	<script src="${context}/js/jquery-1.9.1.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){

	});

	//목록으로
	function fn_moveToSche(){
		location.href = "${context}/work/sche/retrieveScheList.do";
	}
</script>
<style type="text/css">
li{
	cursor: default !important;
}
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
	<h1>Sche<button class="btn btn-success" type="button" style="float: right;" onclick="fn_moveToSche()">목록</button></h1>
	<ul class="list-group">
	  <li class="list-group-item">
	  	<img id="userImage" src="${context}/userImg/${dsSche.USER_IMAGE}" height="50px" width="30px" class="img-circle">&nbsp;&nbsp;
	  	<font size="6px" color="lightblack">${dsSche.USER_ID}</font>
	  	<span style="font-size: 20px; float: right; margin-right: 5px;"><b>${dsSche.SCHE_HITS}</b></span><span class="glyphicon glyphicon-eye-open fa-2x" style="margin-right: 5px; float: right;"></span>
	  </li>
	  <li class="list-group-item" style="min-height: 100px;">
	  	<font color="lightgray">#${dsSche.SCHE_NO}</font>
	  	<br><br><font size="10px" color="gray">${dsSche.SCHE_TITLE}</font>
	</li>
	  <li class="list-group-item" style="min-height: 30px;">기한 : (${dsSche.SCHE_START_DATE} ~ ${dsSche.SCHE_END_DATE})</li>
	  <li class="list-group-item" style="min-height: 400px;">${dsSche.SCHE_CONTENTS}</li>
	</ul>
	</div>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>