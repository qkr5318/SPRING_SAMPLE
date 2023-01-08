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
      <!-- footer start (Add "light" class to #footer in order to enable light footer) -->
      <!-- ================ -->
      <footer id="footer">
        <!-- .subfooter start -->
        <!-- ================ -->
        <div class="subfooter">
          <div class="container">
            <div class="row">
              <div class="col-md-6">
                <p>Copyright © 2016 Travel Interact. All Rights Reserved</p>
              </div>
              <div class="col-md-6">
                <nav class="navbar navbar-default" role="navigation">
                  <!-- Toggle get grouped for better mobile display -->
                  <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-2">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                  </div>
                  <div class="collapse navbar-collapse" id="navbar-collapse-2">
                    <ul class="nav navbar-nav navbar-right">
                      <li><a href="${context}/work/board/goMain.do">Home</a></li>
                      <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/board/retrieveBoardList.do')">공지사항</a></li>
                      <c:if test="${sessionScope.id != null}">
                      	<li><a href="${context}/work/user/updateUser.do">정보수정</a></li>
                      	<li><a onclick="javascript:fnDeleteUser()">회원탈퇴</a></li>
                      </c:if>
                    </ul>
                  </div>
                </nav>
              </div>
            </div>
          </div>
        </div>
        <!-- .subfooter end -->

      </footer>
      <!-- footer end -->

    </div>
    <!-- page-wrapper end -->

    <!-- JavaScript files placed at the end of the document so the pages load faster
    ================================================== -->
    <!-- Jquery and Bootstap core js files -->
    <script type="text/javascript" src="${context}/intro/plugins/jquery.min.js"></script>
    <script type="text/javascript" src="${context}/intro/bootstrap/js/bootstrap.min.js"></script>

    <!-- Modernizr javascript -->
    <script type="text/javascript" src="${context}/intro/plugins/modernizr.js"></script>

    <!-- jQuery REVOLUTION Slider  -->
    <script type="text/javascript" src="${context}/intro/plugins/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="${context}/intro/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

	<!-- planner1 footer, planner1Form must both import 3-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Isotope javascript -->
    <script type="text/javascript" src="${context}/intro/plugins/isotope/isotope.pkgd.min.js"></script>

    <!-- Owl carousel javascript -->
    <script type="text/javascript" src="${context}/intro/plugins/owl-carousel/owl.carousel.js"></script>

    <!-- Magnific Popup javascript -->
    <script type="text/javascript" src="${context}/intro/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Appear javascript -->
    <script type="text/javascript" src="${context}/intro/plugins/jquery.appear.js"></script>

    <!-- Count To javascript -->
    <script type="text/javascript" src="${context}/intro/plugins/jquery.countTo.js"></script>

    <!-- Parallax javascript -->
    <script src="${context}/intro/plugins/jquery.parallax-1.1.3.js"></script>

    <!-- Contact form -->
    <script src="${context}/intro/plugins/jquery.validate.js"></script>

    <!-- SmoothScroll javascript -->
    <script type="text/javascript" src="${context}/intro/plugins/jquery.browser.js"></script>
    <script type="text/javascript" src="${context}/intro/plugins/SmoothScroll.js"></script>

    <!-- Initialization of Plugins -->
    <script type="text/javascript" src="${context}/intro/js/template.js"></script>

    <!-- Custom Scripts -->
    <script type="text/javascript" src="${context}/intro/js/custom.js"></script>



</body></html>