<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="userC.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Travel Interact</title>
	<link href="${context}/intro/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/intro/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/intro/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/intro/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/intro/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
	<link href="${context}/intro/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/intro/css/process.css" rel="stylesheet">

	<script src="${context}/intro/js/jquery.js"></script>
    <script src="${context}/intro/js/plugins/metisMenu/metisMenu.min.js"></script>

	<script src="${context}/intro/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/intro/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		fn_init();

		$( "#birth" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2019"
	    });

		$("#dong").keydown(function (key){
			if(key.keyCode == 13){
				fn_postCheck();
			}

		});
	});


	function fn_save(){
		if(!fn_validation()) return;
		if($("#flag").val() == "false"){
			alert("이미 사용중인 ID입니다");
			$("#id").focus();
			return;
		}

		$("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val());

 		$("#joinFrm").submit();
	}

	function idCheck(){
		var loginId = $("#loginId").val();
		var access = $("#message");
		$.ajax({
			url:"${context}/work/user/idCheck.do?loginId=" + loginId,
			success:function(result){
				result2 = result.replace(/"/gi, "");
				var splResult = result2.split("@");
				access.html(splResult[0]);
				$("#flag").val(splResult[1]);
			}
		});
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<form id="joinFrm" method="post" action="${context}/work/user/createUser.do" role="form">
		<div class="form-horizontal">
			<hr/>
			<div class="form-group" style="margin-top: 5%;">
				<label for="id" class="control-label col-md-2"><b>아이디</b></label>
				<div class="col-md-4">
					<input class="form-control" type="text" name="loginId" id="loginId" required="required" autofocus="autofocus" onkeyup="idCheck();"/>
				</div>
				<p id="message"></p>
			</div>

			<div class="form-group">
				<label for="pw" class="control-label col-md-2"><b>비밀번호</b></label>
				<div class="col-md-4">
					<input class="form-control" type="password" name="pw" id="pw" required="required"/>
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="control-label col-md-2"><b>이메일</b></label>
				<div class="col-md-4">
					<input class="form-control" type="email" name="email" id="email" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="control-label col-md-2"><b>성명</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="name" name="name" autofocus="autofocus" required="required"/>
				</div>
			</div>

			<div class="form-group">
				<label for="birth" class="control-label col-md-2"><b>생년월일</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="birth" name="birth" required="required" maxlength="10"/>
				</div>
			</div>

			<div class="form-group">
				<label for="phoneCd" class="control-label col-md-2"><b>연락처</b></label>
				<div class="col-md-2">
		        	<select class="form-control" id="phoneCd" name="phoneCd" required="required">
						<c:forEach items="${dsCode1}" var="code1">
							<option value="${code1.commCd}">${code1.commCdNm}</option>
						</c:forEach>
		     		</select>
	     		</div>
				<div class="col-md-2">
					<input class="form-control" type="text" id="phone1" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
				<div class="col-md-2">
					<input class="form-control" type="text" id="phone2" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
				<input type="hidden" id="phoneNum" name="phoneNum">
			</div>

			<div class="form-group">
				<label for="phoneCd" class="control-label col-md-2"><b>성별</b></label>
				<div class="col-md-2">
		        	<select class="form-control" id="sex" name="sex" required="required">
						<c:forEach items="${dsCode2}" var="code2">
							<option value="${code2.commCd}">${code2.commCdNm}</option>
						</c:forEach>
		     		</select>
	     		</div>
			</div>
		<br><br><br>
		<div class="form-group">
			<div class="col-md-offset-4 col-md-2">
				<button type="button" class="btn btn-success" onclick="fn_back()">뒤로가기</button>
			</div>
			<div class="col-md-2">
				<button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">등록하기</button>
			</div>
		</div>
			<input type="hidden" id="flag" name="flag" value="false">
		</div>
	</form>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>