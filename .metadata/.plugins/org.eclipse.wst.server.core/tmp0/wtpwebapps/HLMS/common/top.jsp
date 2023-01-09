<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HLMS 게시판 프로그램</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
<link href="${context}/css/common.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="${context}/js/jquery.form.js"></script>
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script src="${context}/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#navbar").find("*").css({
			"color" :"black"
			});
	    $(".navbar-brand").css({
	    	"color" :"black"
	    })
	});

	function fn_checkThree(){
		$.ajax({
   			url:"${context}/work/three/checkThree.do",
   			success:function(result){
   				if(result == "noexist"){
					location.href = "${context}/work/three/retrieveThreeList.do";
   				}else{
   					alert("이미 특강신청서를 제출하셨습니다");
   				}
   			}
   		});
	}

	function fn_checkPass(){
		$.ajax({
   			url:"${context}/work/three/checkThree.do",
   			success:function(result){
   				if(result == "noexist"){
   					alert("특강신청 정보가 존재하지 않습니다.");
   				}else{
   					location.href = "${context}/work/three/retrieveResult.do";
   				}
   			}
   		});
	}
</script>


<style type="text/css">
li{
	cursor: pointer;
}
a{
	text-decoration:none !important;
}

</style>
</head>


<c:set var="homeUrl">${context}/work/board/goMain.do</c:set>
<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<body>
<div class="navbar-wrapper">
      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <c:if test="${sessionScope.id != null}">
            <a class="navbar-brand" href="${homeUrl}">HakSa</a>
            </c:if>
          </div>


                <div id="navbar" class="navbar-collapse collapse">

                    <ul class="nav navbar-nav">
                    <c:if test="${sessionScope.id != null}">
                        <li class="dropdown">
                            <a class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">특강신청 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                            <c:if test="${sessionScope.grade == 'S'}">
                                <li class="dropdown">
                                    <a onclick="fn_checkThree()"
                                     class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">특강신청서 작성</a>
                                </li>
								<li class="dropdown">
                                    <a onclick="fn_checkPass()"
                                     class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">합격조회</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.grade == 'P'}">
                            	<c:if test="${sessionScope.threeYn == 'N'}">
                            		<li><a href="${context}/work/three/updateThreeYn.do?threeYn=Y">특강개설하기</a></li>
                            	</c:if>
                            	<c:if test="${sessionScope.threeYn == 'Y'}">
                            		<li><a href="${context}/work/three/updateThreeYn.do?threeYn=N">특강개설취소</a></li>
                            	</c:if>
                            </c:if>
                            <c:if test="${sessionScope.grade == 'P'}">
                            	<li><a href="${context}/work/three/retrieveThreeListForApp.do?flag=1">신청학생명단</a></li>
                            </c:if>
                            <c:if test="${sessionScope.grade == 'P'}">
                            	<li><a href="${context}/work/three/retrieveThreeListForApp.do?flag=2">면접대상자</a></li>
                            </c:if>
                            <c:if test="${sessionScope.grade == 'P'}">
                            	<li><a href="${context}/work/three/retrieveThreeListForApp.do?flag=3">최종합격자</a></li>
                            </c:if>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">수강신청<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                            	<c:if test="${sessionScope.grade == 'P'}">
                            		<li><a href="${context}/work/course/createCourse.do">과목개설</a></li>
                            	</c:if>
                            	<c:if test="${sessionScope.grade == 'P'}">
                            		<li><a href="${context}/work/course/retrieveCourseListForAdmin.do">과목수정</a></li>
                            	</c:if>
                                <li><a href="${context}/work/course/goMain.do">과목신청</a></li>
                                <c:if test="${sessionScope.grade == 'S'}">
                                	<li><a href="${context}/work/studentreg/retrieveStudentreg.do">시간표조회</a></li>
                                </c:if>
                                <c:if test="${sessionScope.grade == 'P'}">
                               		 <li><a href="${context}/work/professorreg/retrieveProfessorreg.do">시간표조회</a></li>
                                </c:if>
                                <c:if test="${sessionScope.grade == 'P'}">
                               		 <li><a href="${context}/work/professorreg/retrieveCourseForScore.do">성적입력</a></li>
                                </c:if>
                                <c:if test="${sessionScope.grade == 'S'}">
                               		 <li><a href="${context}/work/professorreg/retrieveCourseForScore.do">성적조회</a></li>
                                </c:if>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">학생정보서비스<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/user/retrieveUser.do')">학생Pool</a></li>
                            </ul>
                        </li>
                        <c:if test="${sessionScope.grade == 'P'}">
	                        <li class="dropdown"><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/sche/retrieveScheList.do')" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">일정관리</a>
	                        </li>
                        </c:if>
                        <c:if test="${sessionScope.grade == 'S'}">
	                        <li class="dropdown"><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/sche/retrieveScheList.do')" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">일정조회</a>
	                        </li>
                        </c:if>
                        <li class="down"><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/board/retrieveBoardList.do')" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">게시판</a>
                        </li>
                    </c:if>
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                    	<c:if test="${sessionScope.id == null}">
                    	<li class="dropdown">
							<a href="${context}/work/user/createUser.do"><strong>회원가입</strong></a>
						</li>
						</c:if>
 						<c:if test="${sessionScope.id != null}">
						<li class="dropdown">
							<a href="${context}/work/user/updateUser.do"><strong>나의 정보 수정</strong></a>
                       	</li>
                        </c:if>
                    <li>
						<c:if test="${sessionScope.id == null}">
							<a href="${context}/user/login.jsp"><strong>LOGIN</strong></a>
						</c:if>
						<c:if test="${sessionScope.id != null}">
							<a href="${context}/work/user/logout.do"><strong>LOGOUT</strong></a>
						</c:if>
						</li>
                    </ul>
                </div>


        </nav>
    </div>

</div>
</body>
</html>