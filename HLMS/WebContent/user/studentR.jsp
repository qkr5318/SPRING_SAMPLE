<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="studentR.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HakSa</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
		<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/process.css" rel="stylesheet">

	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

	<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		fn_init();

		$( "#birth" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2015"
	    });

		$("#searchBtn").click(function(){
			var param = {};

			var paramName =  $("#paramName").val();

			if(paramName == ''){
				alert('이름을 입력하세요.');
				return;
			}

			param["name"] = paramName;

			$.ajax({
	   			url:"${context}/work/user/retrieveUserByName.do",
				contentType:"application/json",
				dataType:"json",
				data:param,
	   			success:function(result){
	   				if(result.length == 0){
	   					alert(paramName + '에 해당하는 학생이 없습니다');
	   				}
	   				for(var i = 0; i < result.length; i++){
	   					$("#name").text('');
	   					$("#nickName").text('');
	   					$("#usercode").text('');
// // 	   					$("#major").append(result[i].zipcode);
	   					$("#class2").text('');

	   					$("#name").append(result[i].name);
	   					$("#nickName").append(result[i].nickName);
	   					$("#usercode").append(result[i].userCode);
// 	   					$("#major").append(result[i].zipcode);
	   					$("#class2").append(result[i].class2);
	   					$("#userImage").attr("src", '${context}/userImg/' + result[i].userImage);
	   				}

	   			}
	   		});
		});
	});
</script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="jumbotron" class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgreen;">
			<h1><font color="green"><strong>학생Pool</strong>&nbsp;<span class="glyphicon glyphicon glyphicon-pencil"></span></font></h1>
		</div>
	</div>
	<br><br><br><br><br>
	<div class="container">
	    <c:if test="${sessionScope.grade == 'P'}">
			<div class="row">
		        <div class="col-md-offset-7 col-md-3">
		            <div id="custom-search-input">
		                <div class="input-group col-md-12">
		                    <input type="text" id="paramName" class="form-control input-lg" placeholder="이름을 입력하세요" />
		                    <span class="input-group-btn">
		                        <button id="searchBtn" class="btn btn-info btn-lg" type="button" >
		                            <i class="glyphicon glyphicon-search"></i>
		                        </button>
		                    </span>
		                </div>
		            </div>
		        </div>
			</div>
		</c:if>

       <br>
        <div class="col-md-offset-2 col-md-8 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Student Information</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img id="userImage" alt="User Pic" src="${context}/userImg/${dsUser.userImage}" class="img-circle img-responsive"> </div>
                <div class="col-md-9">
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>name :</td>
                        <td id="name">${dsUser.name}</td>
                      </tr>
                      <tr>
                        <td>nickname :</td>
                        <td id="nickName">${dsUser.nickName}</td>
                      </tr>
	                      <tr>
	                             <tr>
	                        <td>Studnet ID :</td>
	                        <td id="usercode">${dsUser.userCode}</td>
	                      </tr>
	                      <tr>
	                        <td>class :</td>
	                        <td id="class2">${dsUser.class2}</td>
	                      </tr>
                      <tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
	          </div>
	        </div>
        </div>
<br><br><br><br>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>