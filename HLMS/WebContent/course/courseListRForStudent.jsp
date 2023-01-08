<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="courseListRForStudent.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>HakSa</title>

<%-- 	<link href="${context}/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- 	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet"> --%>
<%-- 	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet"> --%>
<%-- 	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet"> --%>

<%--     <link href="${context}/css/sb-admin-2.css" rel="stylesheet"> --%>

    <!-- Custom Fonts -->
<%--     <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> --%>
	<script src="${context}/js/jquery-1.9.1.js"></script>
<%-- 	<script src="${context}/js/bootstrap.min.js"></script> --%>

<%--     <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script> --%>

<%--     <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script> --%>
<%--     <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script> --%>

<%--     <script src="${context}/js/sb-admin-2.js"></script> --%>

    <script>

//     $(document).ready(function() {
//         $('#dataTables-example').dataTable();
//     });

	function fn_createCourse(paramCourseCode, paramCourseName, paramCourseDay, paramCoursePeriod){
		$.ajax({
   			url:"${context}/work/studentreg/retrieveStudentregInfo.do?courseDay=" + paramCourseDay + "&coursePeriod=" + paramCoursePeriod,
   			success:function(result){
   				if(result == "noexist"){
   					if(confirm(paramCourseName + " 과목을 수강과목 하시겠습니까?")){
   						location.href = "${context}/work/studentreg/createStudentreg.do?courseCode=" + paramCourseCode;
   					}
   				}else{
   					alert(paramCourseDay + "요일 " + paramCoursePeriod + "교시에 이미 다른 과목을 신청하셨습니다.");
   				}
   			}
   		});
	}

	function fn_deleteCourse(paramCourseName, paramCourseCode, paramStudentRegCode){
		if(confirm(paramCourseName + " 과목을 취소신청 하시겠습니까?")){
			location.href = "${context}/work/studentreg/deleteStudentreg.do?studentRegCode=" + paramStudentRegCode + "&courseCode=" + paramCourseCode;
		}
	}

    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<br><br><br>
		<div class="jumbotron">
		<div>
			<div class="row">
				<div class="col-md-6">
					<div class="page-header">
						  <h1><span class="glyphicon glyphicon-list-alt" style="vertical-align: middle; margin-left: 5px;"></span>&nbsp;수강과목 리스트</h1>
					</div>
						<div class="col-md-12">
						    <div class="panel panel-default">
						        <!-- /.panel-heading -->
						        <div class="panel-body">
						            <div class="table-responsive">
						                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
						                    <thead>
						                        <tr>
						                            <th style="text-align: center; vertical-align: middle; width: 80px;">과목명</th>
						                            <th style="text-align: center; vertical-align: middle; width: 30px;">학점</th>
						                            <th style="text-align: center; vertical-align: middle; width: 30px;">교실</th>
						                            <th style="text-align: center; vertical-align: middle; width: 50px;">요일</th>
						                            <th style="text-align: center; vertical-align: middle; width: 50px;">교시</th>
						                            <th style="text-align: center; vertical-align: middle; width: 50px;">수강과목</th>
						                        </tr>
						                    </thead>
						                    <tbody>

		  				                    	<c:forEach items="${dsCourseList}" var="dsCourseList" varStatus="courseIdx">
						                         <tr>
						                            <td style="text-align: center; vertical-align: middle;">${dsCourseList.COURSE_NAME}</td>
						                            <td style="text-align: center; vertical-align: middle;">${dsCourseList.COURSE_SCORE}학점</td>
						                            <td style="text-align: center; vertical-align: middle;">${dsCourseList.COURSE_CLASSROOM}</td>
						                            <td style="text-align: center; vertical-align: middle;">${dsCourseList.COURSE_DAY}요일</td>
						                            <td style="text-align: center; vertical-align: middle;">${dsCourseList.COURSE_PERIOD}교시</td>
						                            <td style="text-align: center; vertical-align: middle;">
						                            	<button type="button" name="registerBtn" class="btn btn-primary" onclick="fn_createCourse('${dsCourseList.COURSE_CODE}','${dsCourseList.COURSE_NAME}','${dsCourseList.COURSE_DAY}','${dsCourseList.COURSE_PERIOD}')">수강신청</button>
							                             <script type="text/javascript">
							                            	if('${dsCourseList.REGISTER_YN}' == 'N'){
							                            		$("button[name='registerBtn']").eq('${courseIdx.index}').parent().parent().find("td").addClass("importantYellow");
							                            		$("button[name='registerBtn']").eq('${courseIdx.index}').prop("disabled", true);
							                            	}
						                            	</script>
						                            </td>
						                         </tr>
							                    </c:forEach>

						                    </tbody>
						                </table>
						            </div>
						            <!-- /.table-responsive -->
						        </div>
						        <!-- /.panel-body -->
						    </div>
					    <!-- /.panel -->
					</div>
				</div>
				<div class="col-md-6">
					<div class="page-header">
						  <h1><span class="glyphicon glyphicon-list-alt" style="vertical-align: middle; margin-left: 5px;"></span>&nbsp;<font color="blue">${sessionScope.id}</font>님의 신청과목</h1>
					</div>
					<div class="col-md-12">
					    <div class="panel panel-default">
					        <!-- /.panel-heading -->
					        <div class="panel-body">
					            <div class="table-responsive">
					                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
					                    <thead>
					                        <tr>
					                            <th style="text-align: center; vertical-align: middle; width: 80px;">과목명</th>
					                            <th style="text-align: center; vertical-align: middle; width: 80px;">학점</th>
					                            <th style="text-align: center; vertical-align: middle; width: 30px;">교실</th>
					                            <th style="text-align: center; vertical-align: middle; width: 50px;">요일</th>
					                            <th style="text-align: center; vertical-align: middle; width: 50px;">교시</th>
					                            <th style="text-align: center; vertical-align: middle; width: 50px;">수강과목</th>
					                            <th style="text-align: center; vertical-align: middle; width: 50px;">취소</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                    <c:forEach items="${dsStudentregList}" var="dsStudentregList" varStatus="studentregIdx">
				                         <tr>
				                            <td style="text-align: center; vertical-align: middle;">${dsStudentregList.COURSE_NAME}</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsStudentregList.COURSE_SCORE}학점</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsStudentregList.COURSE_CLASSROOM}</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsStudentregList.COURSE_DAY}요일</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsStudentregList.COURSE_PERIOD}교시</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsStudentregList.COURSE_CATEGORY_CD_NM}</td>
				                            <td style="text-align: center; vertical-align: middle;">
				                            	<button type="button" class="btn btn-danger" onclick="fn_deleteCourse('${dsStudentregList.COURSE_NAME}','${dsStudentregList.COURSE_CODE}','${dsStudentregList.STUDENT_REG_CODE}')">취소하기</button>
				                            </td>
				                         </tr>
				                        </c:forEach>
					                    </tbody>
					                </table>
					            </div>
					            <!-- /.table-responsive -->
					        </div>
					        <!-- /.panel-body -->
					    </div>
					    <!-- /.panel -->
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../common/foot.jsp"></jsp:include>

</body>
</html>