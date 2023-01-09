<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="threeResultRD.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HakSa</title>
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >

	<script src="${context}/js/jquery-1.9.1.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript">

	function fn_moveInfo(){
		location.href = '${context}/work/three/retrieveThree.do';
	}
	function fn_home(){
		location.href = '${context}/work/board/goMain.do';
	}

</script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="jumbotron" class="container">
		<div class="row" style="margin-bottom: 10%;">
			<div class="col-md-12">
				<div class="offer offer-success">
					<div class="shape">
						<div class="shape-text">
							Thanks
						</div>
					</div>
					<div class="offer-content">
					<br><br><br>
						<h2 align="center" style="font-family: cursive;">
							특강신청
						</h2>
						<br><br><br>
						<h1 align="center" style="font-family: inherit;">
							결과 : ${dsThree.APP_STATUS_NAME }
						</h1>
						<br><br><br>
						<c:if test="${dsThree.APP_STATUS == '6'}">
						<h2 align="center" style="font-family: cursive;">
							축하드립니다
						</h2>
						</c:if>
					</div>
					<br><br><br><br>
					<div class="col-md-2 col-md-offset-5">
						<button type="button" class="btn btn-info btn-lg"  style="float:right;" onclick="fn_home()"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;홈으로</button>
					</div>
					<c:if test="${dsThree.APP_STATUS == '6'}">
						<div class="col-md-2 col-md-offset-3">
							<button type="button" class="btn btn-danger btn-lg"  style="float:right;" onclick="fn_moveInfo()"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;상세내역 보러가기</button>
						</div>
					</c:if>
					<br><br><br><br><br>
				</div>

			</div>
			<!-- /.col-lg-12 -->

		</div>
	</div>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>