<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko" class=" js touch csstransitions"><!--<![endif]--><head>
    <meta charset="utf-8">
    <title>Travel Interact</title>
    <meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
    <meta name="author" content="htmlcoder.me">

    <!-- Mobile Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- Web Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet" type="text/css">

    <!-- Bootstrap core CSS -->
    <link href="${context}/intro/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link href="${context}/intro/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Fontello CSS -->
    <link href="${context}/intro/fonts/fontello/css/fontello.css" rel="stylesheet">

    <!-- Plugins -->
    <link href="${context}/intro/plugins/rs-plugin/css/settings.css" media="screen" rel="stylesheet">
    <link href="${context}/intro/plugins/rs-plugin/css/extralayers.css" media="screen" rel="stylesheet">
    <link href="${context}/intro/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="${context}/intro/css/animations.css" rel="stylesheet">
    <link href="${context}/intro/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">

    <!-- iDea core CSS file -->
    <link href="${context}/intro/css/style.css" rel="stylesheet">

    <!-- Color Scheme (In order to change the color scheme, replace the red.css with the color scheme that you prefer)-->
    <link href="${context}/intro/css/skins/green.css" rel="stylesheet">

    <!-- Custom css -->
    <link href="${context}/intro/css/custom.css" rel="stylesheet">

	<script src="${context}/intro/js/jquery.js"></script>
    <script src="${context}/intro/js/common.js"></script>
	<style type="text/css">
	li{
		cursor: pointer;
	}
	a{
		text-decoration:none !important;
	}
	</style>

    <script type="text/javascript">
		$(document).ready(function(){
			$("#pw").keydown(function (key){
				if(key.keyCode == 13){
					ajaxLoginCheck();
				}

			});
		});

		function ajaxLoginCheck(){
			var loginId = $("#loginId").val();
			var pw = $("#pw").val();


			if(loginId == null || loginId == ''){
				alert('아이디를 입력하세요');
				return;
			}

			if(pw == null || pw == ''){
				alert('Password를 입력하세요');
				return;
			}

			var param = {};

			param["loginId"] = loginId;
			param["pw"] = pw;

			$.ajax({
				url:"${context}/work/user/ajaxLoginCheck.do",
				contentType:"application/json",
				dataType:"json",
				data:param,
				success:function(result){
					if(result['loginYn'] == 'success'){
						alert("로그인에 성공하였습니다.");
						$("#loginFrm").submit();
					}else{
						alert('로그인에 실패하셨습니다.');
						$("#loginId").val('');
						$("#pw").val('');
					}
				}
			});
		}

		function fnlogout(){
			location.href = "${context}/work/user/logout.do";
		}

		function fnDeleteUser(){
			if(confirm("정말 탈퇴 하시겠습니까?")){
				location.href = "${context}/work/user/deleteUser.do";
			}
		}

	</script>
  </head>

	<c:set var="loginUrl">${context}/intro/index.jsp</c:set>
  <!-- body classes:
      "boxed": boxed layout mode e.g. <body class="boxed">
      "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1">
  -->
  <body class="front">
    <!-- scrollToTop -->
    <!-- ================ -->
    <div class="scrollToTop" style="display: none;"><i class="icon-up-open-big"></i></div>

    <!-- page wrapper start -->
    <!-- ================ -->
    <div class="page-wrapper">

      <!-- header-top start (Add "dark" class to .header-top in order to enable dark header-top e.g <div class="header-top dark">) -->
      <!-- ================ -->
      <div class="header-top">
        <div class="container">
          <div class="row">
            <div class="col-xs-2  col-sm-6">

            </div>
            <div class="col-xs-10 col-sm-6">

              <!-- header-top-second start -->
              <!-- ================ -->
              <div id="header-top-second" class="clearfix">

                <!-- header top dropdowns start -->
                <!-- ================ -->
                <div class="header-top-dropdown">
                  <div class="btn-group dropdown">
                  	<c:if test="${sessionScope.id == null}">
                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Login</button>
                    </c:if>
                    <c:if test="${sessionScope.id != null}">
                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" onclick="javascript:fnlogout();"><i class="fa fa-user"></i> Logout</button>
                    </c:if>
                    <ul class="dropdown-menu dropdown-menu-right dropdown-animation">
                      <li>
                        <form action="${context}/work/user/login.do" method="post" role="form" id="loginFrm">
                          <div class="form-group has-feedback">
                            <label class="control-label">Id</label>
                            <input type="text" id="loginId" name="loginId" class="form-control" placeholder="">
                            <i class="fa fa-user form-control-feedback"></i>
                          </div>
                          <div class="form-group has-feedback">
                            <label class="control-label">Password</label>
                            <input type="password" id="pw" name="pw" class="form-control" placeholder="">
                            <i class="fa fa-lock form-control-feedback"></i>
                          </div>
                          <button type="button" class="btn btn-group btn-dark btn-sm" onclick="ajaxLoginCheck();" >Log In</button>
                          <span>or</span>
                          <button type="button" class="btn btn-group btn-default btn-sm" onclick="javascript:location.href='${context}/work/user/createUser.do'">Sign Up</button>

                        </form>
                      </li>
                    </ul>
                  </div>

                </div>
                <!--  header top dropdowns end -->

              </div>
              <!-- header-top-second end -->

            </div>
          </div>
        </div>
      </div>
      <!-- header-top end -->

      <!-- header start classes:
        fixed: fixed navigation mode (sticky menu) e.g. <header class="header fixed clearfix">
         dark: dark header version e.g. <header class="header dark clearfix">
      ================ -->
      <header class="header fixed clearfix">
        <div class="container">
          <div class="row">
            <div class="col-md-3">

              <!-- header-left start -->
              <!-- ================ -->
              <div class="header-left clearfix">

                <!-- logo -->
                <div class="logo">
                  <a href="${context}/work/board/goMain.do"><img id="logo" src="${context}/intro/img/logo.png" alt="iDea"></a>
                </div>

                <!-- name-and-slogan -->
                <div class="site-slogan">
                  Make Your Imagination a Reality!
                </div>

              </div>
              <!-- header-left end -->

            </div>
            <div class="col-md-9">

              <!-- header-right start -->
              <!-- ================ -->
              <div class="header-right clearfix">

                <!-- main-navigation start -->
                <!-- ================ -->
                <div class="main-navigation animated">

                  <!-- navbar start -->
                  <!-- ================ -->
                  <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">

                      <!-- Toggle get grouped for better mobile display -->
                      <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                          <span class="sr-only">Toggle navigation</span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                        </button>
                      </div>

                      <!-- Collect the nav links, forms, and other content for toggling -->
                      <div class="collapse navbar-collapse" id="navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                          <li><a href="${context}/work/board/goMain.do">Home</a></li>
                          <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/board/retrieveBoardList.do')">공지사항</a></li>
                          <c:if test="${sessionScope.id != null}">
                          	<li><a href="${context}/work/user/updateUser.do">정보수정</a></li>
                          	<li><a onclick="javascript:fnDeleteUser()">회원탈퇴</a></li>
                          </c:if>
                        </ul>
                      </div>

                    </div>
                  </nav>
                  <!-- navbar end -->

                </div>
                <!-- main-navigation end -->

              </div>
              <!-- header-right end -->

            </div>
          </div>
        </div>
      </header>
      <!-- header end -->

      <!-- banner start -->
      <!-- ================ -->




      <!-- section start -->
      <!-- ================ -->
      <div class="section clearfix object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="300">

        <div class="container">
          <div class="row">
            <div class="col-md-12">
