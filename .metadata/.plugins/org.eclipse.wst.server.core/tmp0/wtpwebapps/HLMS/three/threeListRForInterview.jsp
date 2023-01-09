<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="threeListRForInterview.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>HakSa</title>

	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>

    <script>

    $(document).ready(function() {
//         $('#dataTables-example').dataTable();
    });

    function fn_updateAppStatus(paramAppCode, paramAppStatus){
    	location.href = "${context}/work/three/updateAppStatus.do?appCode=" + paramAppCode + "&appStatus=" + paramAppStatus;
    }

    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<br><br><br>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-header">
						  <h1 align="center"><span class="glyphicon glyphicon-list-alt" style="vertical-align: middle;"></span>&nbsp;면접대상자</h1>
					</div>
				</div>
				<div class="col-md-12">
				    <div class="panel panel-default">
				        <!-- /.panel-heading -->
				        <div class="panel-body">
				            <div class="table-responsive">
				                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
				                    <thead>
				                        <tr>
				                            <th style="text-align: center; vertical-align: middle; width: 100px;">과목</th>
				                            <th style="text-align: center; vertical-align: middle; width: 50px;">담당교수</th>
				                            <th style="text-align: center; vertical-align: middle; width: 50px;">신청학생</th>
				                            <th style="text-align: center; vertical-align: middle; width: 50px;">지원상태</th>
				                            <th style="text-align: center; vertical-align: middle; width: 50px;">신청</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                    	<c:forEach items="${dsThreeList}" var="dsThreeList" varStatus="courseIdx">
				                         <tr>
				                            <td style="text-align: center; vertical-align: middle;">특강신청</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsThreeList.P_USER_NAME}</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsThreeList.S_USER_NAME}</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsThreeList.APP_STATUS_NAME}</td>
				                            <td style="text-align: center; vertical-align: middle;">
												<button type="button" class="btn btn-danger" onclick="fn_updateAppStatus('${dsThreeList.APP_CODE}', 3)">불합격</button>
												<button type="button" class="btn btn-success" onclick="fn_updateAppStatus('${dsThreeList.APP_CODE}', 4)">합격</button>
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