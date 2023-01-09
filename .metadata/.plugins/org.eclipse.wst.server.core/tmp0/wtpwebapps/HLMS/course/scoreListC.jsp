<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="scoreListC.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>HakSa</title>
    <script>

	function fn_updateScore(self, paramStudentRegCode){
		var paramScore = self.parent().parent().find("#score").val();
		$.ajax({
   			url:"${context}/work/studentreg/updateScore.do?studentRegCode=" + paramStudentRegCode + "&score=" + paramScore,
   			success:function(result){
   				if(result == 'true') alert("성적입력이 완료되었습니다.");
   				else alert("성적입력 오류");
   			}
   		});
	}
    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<br><br><br>
		<div>
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="page-header">
						  <h1 align="center"><span class="glyphicon glyphicon-list-alt" style="vertical-align: middle;"></span>&nbsp;성적입력</h1>
					</div>
				</div>
				<div class="col-md-6 col-md-offset-3">
				    <div class="panel panel-default">
				        <!-- /.panel-heading -->
				        <div class="panel-body">
				            <div class="table-responsive">
				                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
				                    <thead>
				                        <tr>
				                        	<th style="text-align: center; vertical-align: middle; width: 30px;">과목코드</th>
				                            <th style="text-align: center; vertical-align: middle; width: 80px;">과목명</th>
				                            <th style="text-align: center; vertical-align: middle; width: 50px;">담당교수</th>
				                            <th style="text-align: center; vertical-align: middle; width: 50px;">학생이름</th>
				                            <th style="text-align: center; vertical-align: middle; width: 30px;">학점</th>
				                            <th style="text-align: center; vertical-align: middle; width: 50px;">성적(단위/점)</th>
				                            <th style="text-align: center; vertical-align: middle; width: 30px;">확인</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                    	<c:forEach items="${dsCourseForScoreList}" var="dsCourseForScoreList" varStatus="courseIdx">
				                         <tr>
				                         	<td style="text-align: center; vertical-align: middle;">${dsCourseForScoreList.COURSE_CODE}</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsCourseForScoreList.COURSE_NAME}</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsCourseForScoreList.PROFESSOR_NAME}</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsCourseForScoreList.STUDENT_NAME}</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsCourseForScoreList.COURSE_SCORE}학점</td>
				                            <td style="text-align: center; vertical-align: middle;">
				                            	<input style="width: 50px; text-align: center;" type="text" id="score" value = '${dsCourseForScoreList.SCORE}' maxlength="3" />
				                            </td>
				                            <td style="text-align: center; vertical-align: middle;">
				                            	<button type="button" name="registerBtn" class="btn btn-primary" onclick="fn_updateScore($(this),'${dsCourseForScoreList.STUDENT_REG_CODE}')">입력</button>
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
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>