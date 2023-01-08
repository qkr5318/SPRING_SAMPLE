<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="scheRegisterU.jsp">
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
		$( "#scheStartDate" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2016"
	    });

		$( "#scheEndDate" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2016"
	    });

		fn_init();

		//U페이지 해당
		fn_setDetailInfo();
	});

	function fn_setDetailInfo(){
		$("#scheTitle").val('${dsSche.SCHE_TITLE}');
		$("#scheNo").val('${dsSche.SCHE_NO}');
		$("#scheStartDate").val('${dsSche.SCHE_START_DATE}');
		$("#scheEndDate").val('${dsSche.SCHE_END_DATE}');

		var scheContents = '${dsSche.SCHE_CONTENTS}';

		scheContents = scheContents.replace(/<br ?\/?>/gi, "\n");

		$("#scheContents").val(scheContents);
	}

	function fn_save(){
		if(!fn_validation()){
			return;
		}else{
			var scheContents = String($("#scheContents").val());

			scheContents = scheContents.replace(/\n/gi, "<br/>");

			$("#scheContents").val(scheContents);

	 		$("#updateSche").submit();
		}
	}

	function fn_checkSche(paramValue){
		var $scheStartDate = $("#scheStartDate");
		var $scheEndDate   = $("#scheEndDate");

		if($scheStartDate.val() != '' && $scheEndDate.val() != ''){
			if($scheStartDate.val() > $scheEndDate.val()){
				if(paramValue == 1){
					alert("시작날짜가 종료날짜보다 이후가 될 수 없습니다.");
					$scheStartDate.val('');
				}else if(paramValue == 2){
					alert("종료날짜가 시작날짜보다 이전이 될 수 없습니다.");
					$scheEndDate.val('');
				}
			}
		}
	}

</script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
	<div class="page-header">
		<h1>새 글 쓰기</h1>
	</div>
	<form id="updateSche" method="post" action="${context}/work/sche/updateSche.do" role="form">
		<div class="form-horizontal">
			<div class="form-group">
				<label for="scheTitle" class="control-label col-md-1"><b>제목</b></label>
				<div class="col-md-11">
					<input class="form-control" type="text" name="scheTitle" id="scheTitle" required="required" maxlength="50" autofocus="autofocus" placeholder="제목을 입력해주세요"/>
				</div>
			</div>
			<div class="form-group">
				<label for="scheStartDate" class="control-label col-md-1"><b>기한</b></label>
				<div class="col-md-3">
					<input class="form-control" type="text" name="scheStartDate" id="scheStartDate" required="required" maxlength="10" onchange="fn_checkSche(1)" />
				</div>
				<div class="col-md-3">
					<input class="form-control" type="text" name="scheEndDate" id="scheEndDate" required="required" maxlength="10" onchange="fn_checkSche(2)" />
				</div>
			</div>
			<div class="form-group">
				<label for="scheContents" class="control-label col-md-1"><b>본문</b></label>
				<div class="col-md-11">
					<textarea class="form-control" name="scheContents" id="scheContents" cols="10" rows="15" required="required" placeholder="본문을 입력해주세요"></textarea>
					<input type="hidden" id="scheNo" name="scheNo">
				</div>
			</div>
		</div>
		<div class="col-md-offset-1 col-md-2">
			<button type="button" class="btn btn-default" onclick="fn_back()">취소</button>
		</div>
		<div class="col-md-offset-8 col-md-1">
			<button class="btn btn-warning" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">수정하기</button>
		</div>
	</form>
	</div>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>