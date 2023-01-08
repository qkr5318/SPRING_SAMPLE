<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="userU.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Travel Interact</title>
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >

	<script src="${context}/intro/js/jquery.js"></script>

	<script type="text/javascript">

	$(document).ready(function(){
		fn_init();

		$( "#birth" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1910:2019"
	    });

		fn_setDetailInfo();
	});

	function fn_setDetailInfo(){
		$("#loginId2").val('${dsUser.loginId}');
		$("#pw2").val('${dsUser.pw}');
		$("#email").val('${dsUser.email}');

		$("#name").val('${dsUser.name}');
		$("#birth").val('${dsUser.birth}');
		$("#sex").val('${dsUser.sex}');

		var phoneArr = '${dsUser.phoneNum}'.split("-");

		$("#phone1").val(phoneArr[0]);
		$("#phone2").val(phoneArr[1]);

		$("#phoneCd").val('${dsUser.phoneCd}');

	}


	function fn_save(){
		if(!fn_validation()) return;

		$("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val());

 		$("#joinFrm").submit();
	}

	function idCheck(){
		var loginId = $("#loginId2").val();
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
	<form id="joinFrm" method="post" action="${context}/work/user/updateUser.do" role="form">
		<div class="form-horizontal">
			<hr/>
			<div class="form-group" style="margin-top: 5%;">
				<label for="id" class="control-label col-md-2"><b>아이디</b></label>
				<div class="col-md-4">
					<input class="form-control" type="text" name="loginId" id="loginId2" required="required" autofocus="autofocus" disabled="disabled" onkeyup="idCheck();"/>
				</div>
				<p id="message"></p>
			</div>

			<div class="form-group">
				<label for="pw" class="control-label col-md-2"><b>비밀번호</b></label>
				<div class="col-md-4">
					<input class="form-control" type="password" name="pw" id="pw2" required="required"/>
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