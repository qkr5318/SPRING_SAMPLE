<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="boardR.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Travel Interact</title>
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

	function fn_save(){
		$("#createReply").submit();
	}

	function fn_createRating(paramBoardNo){
		location.href = "${context}/work/board/updateBoardRating.do?boardNo=" + paramBoardNo;
	}

	//글 삭제
	function fn_delete(){
		var boardNo = '${dsBoard.BOARD_NO}';

		if(confirm("정말 글을 삭제하시겠습니까?")){
			location.href = "${context}/work/board/deleteBoard.do?boardNo=" + boardNo;
		}
	}

	//글 수정
	function fn_update(){
		var boardNo = '${dsBoard.BOARD_NO}';

		location.href = "${context}/work/board/updateBoard.do?boardNo=" + boardNo;
	}

	//목록으로
	function fn_moveToBoard(){
		location.href = "${context}/work/board/retrieveBoardList.do";
	}
</script>
<style type="text/css">
li{
	cursor: default !important;
}
</style>
</head>
<body>
<jsp:include page="../intro/header.jsp"></jsp:include>
	<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
	<h1>Board<button class="btn btn-success" type="button" style="float: right;" onclick="fn_moveToBoard()">목록</button></h1>
	<ul class="list-group">
	  <li class="list-group-item">
	  	<font size="6px" color="lightblack">${dsBoard.USER_ID}</font>
	  	<span style="font-size: 20px; float: right; margin-right: 5px;"><b>${dsBoard.BOARD_HITS}</b></span><span class="glyphicon glyphicon-eye-open fa-2x" style="margin-right: 5px; float: right;"></span>
	  </li>
	  <li class="list-group-item" style="min-height: 100px;">
	  	<font color="lightgray">#${dsBoard.BOARD_NO}</font>
	  	<c:if test="${sessionScope.userCode != dsBoard.USER_CODE}">
	  		<a onclick="fn_checkBoard('${dsBoard.BOARD_NO}')"><span class="glyphicon glyphicon-thumbs-up fa-2x pull-right" style="margin-right: 5px;"></span></a>
	  	</c:if>
	  	<br><br><font size="10px" color="gray">${dsBoard.BOARD_TITLE}</font>
	</li>
	  <li class="list-group-item" style="min-height: 250px;">${dsBoard.BOARD_CONTENTS}</li>
	</ul>

	<c:if test="${sessionScope.userCode == dsBoard.USER_CODE}">
		<div class="row">
		<div class="col-md-1">
			<button class="btn btn-warning" type="button"  onclick="fn_update()">수정</button>
		</div>
		<div class="col-md-offset-9 col-md-1">
			<button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_delete()">삭제</button>
		</div>
	</div>

	</c:if>

	</div>
<jsp:include page="../intro/footer.jsp"></jsp:include>
</body>
</html>