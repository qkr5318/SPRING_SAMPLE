<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="threeRegisterC.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HakSa</title>
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >

	<script src="${context}/js/jquery-1.9.1.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		fn_init();

		//U페이지 해당
		fn_setDetailInfo();
	});

	function fn_setDetailInfo(){
		$("#name").val('${dsUser.name}');
		$("#userCode").val('${dsUser.userCode}');
		$("#class2").val('${dsUser.class2}');
		$("#phone").val('${dsUser.phoneCdNm}');
		$("#pUserCode").val('${pUserCode}');
	}

	function fn_save(){
		if(!fn_validation()){
			return;
		}

		var motive = String($("#motive").val());
		motive = motive.replace(/\n/gi, "<br/>");
		$("#motive").val(motive);

		alert("특강신청서가 제출되었습니다.");

 		$("#createThree2").submit();
	}

</script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="col-md-8">
		    <div class="form-area">
		        <form id="createThree2" method="post" action="${context}/work/three/createThree.do" role="form">
			        <div class="form-horizontal">
			        <br style="clear:both">
	                    <h3 style="margin-bottom: 25px; text-align: center;">특강신청서</h3>
	    				<div class="form-group">
	    				<label for="name" class="control-label col-md-2"><b>이름</b></label>
		    				<div class="col-md-8">
								<input type="text" class="form-control" id="name" name="name" disabled="disabled" required="required" >
							</div>
						</div>
						<div class="form-group">
	    				<label for="userCode" class="control-label col-md-2"><b>Student ID</b></label>
		    				<div class="col-md-8">
								<input type="text" class="form-control" id="userCode" name="userCode" disabled="disabled" required="required" >
							</div>
						</div>
						<div class="form-group">
	    				<label for="class2" class="control-label col-md-2"><b>CLASS</b></label>
		    				<div class="col-md-8">
								<input type="text" class="form-control" id="class2" name="class2"  disabled="disabled" required="required" >
							</div>
						</div>
						<div class="form-group">
	    				<label for="phone" class="control-label col-md-2"><b>PHONE</b></label>
		    				<div class="col-md-8">
								<input type="text" class="form-control" id="phone" name="phone" disabled="disabled" required="required" >
							</div>
						</div>
	                    <div class="form-group">
	                    <label for="motive" class="control-label col-md-2"><b>MOTIVE</b></label>
		                    <div class="col-md-8">
		                   	    <textarea class="form-control" name="motive" id="motive" maxlength="140" rows="7" required="required"></textarea>
		                    </div>
	                    </div>
	                    <input type="hidden" id="pUserCode" name="pUserCode">
	                <button type="button" id="btnSubmit" name="btnSubmit" class="btn btn-success pull-right" onclick="fn_back()">취소</button>
			        <button type="button" id="btnSubmit" name="btnSubmit" class="btn btn-primary pull-right" onclick="fn_save()">지원서 제출</button>
			        </div>
		        </form>
		    </div>
		</div>
		</div>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>