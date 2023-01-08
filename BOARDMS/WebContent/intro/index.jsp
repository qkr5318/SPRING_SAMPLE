<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <title>Travel Interact</title>
    <meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
    <meta name="author" content="htmlcoder.me">

    <!-- Mobile Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- Web Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700,300&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css'>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link href="fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Fontello CSS -->
    <link href="fonts/fontello/css/fontello.css" rel="stylesheet">

    <!-- Plugins -->
    <link href="plugins/rs-plugin/css/settings.css" media="screen" rel="stylesheet">
    <link href="plugins/rs-plugin/css/extralayers.css" media="screen" rel="stylesheet">
    <link href="plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="css/animations.css" rel="stylesheet">
    <link href="plugins/owl-carousel/owl.carousel.css" rel="stylesheet">

    <!-- iDea core CSS file -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Color Scheme (In order to change the color scheme, replace the red.css with the color scheme that you prefer)-->
    <link href="css/skins/green.css" rel="stylesheet">

    <!-- Custom css -->
    <link href="css/custom.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <!-- body classes:
      "boxed": boxed layout mode e.g. <body class="boxed">
      "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1">
  -->
  <body class="front no-trans">
    <!-- scrollToTop -->
    <!-- ================ -->
    <div class="scrollToTop"><i class="icon-up-open-big"></i></div>

    <!-- page wrapper start -->
    <!-- ================ -->
    <div class="page-wrapper">

      <!-- header-top start (Add "dark" class to .header-top in order to enable dark header-top e.g <div class="header-top dark">) -->
      <!-- ================ -->
      <!-- header-top end -->

      <!-- header start classes:
        fixed: fixed navigation mode (sticky menu) e.g. <header class="header fixed clearfix">
         dark: dark header version e.g. <header class="header dark clearfix">
      ================ -->
	<%@ include file="header.jsp" %>
      <!-- header end -->

      <!-- banner start -->
      <!-- ================ -->
      <div class="banner">

        <!-- slideshow start -->
        <!-- ================ -->
        <div class="slideshow white-bg">

          <!-- slider revolution start -->
          <!-- ================ -->
          <div class="slider-banner-container">
            <div class="slider-banner-2 bullets-with-bg">
              <ul>
                <!-- slide 1 start -->
                <li data-transition="fade" data-slotamount="7" data-masterspeed="1000" data-saveperformance="on" data-title="Slide 1">

                <!-- main image -->
                <img src="img/slide_01.jpg"  alt="slidebg1" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">

                <!-- Translucent background -->
                <div class="tp-caption dark-translucent-bg"
                  data-x="center"
                  data-y="bottom"
                  data-speed="800"
                  data-start="0"
                  style="background-color:rgba(0,0,0,0.5);">
                </div>

                <!-- LAYER NR. 1 -->
                <div class="tp-caption very_large_text sfl tp-resizeme"
                  data-x="center"
                  data-y="70"
                  data-speed="600"
                  data-start="0"
                  data-end="10000"
                  data-endspeed="600">Planner
                </div>

                <!-- LAYER NR. 2 -->
                <div class="tp-caption small_thin_white sfr text-center tp-resizeme"
                  data-x="center"
                  data-y="170"
                  data-speed="600"
                  data-start="0"
                  data-end="10000"
                  data-endspeed="600">Start your trip
                </div>

                <!-- LAYER NR. 3 -->
                <div class="tp-caption tp-resizeme sfl"
                  data-x="center"
                  data-y="300"
                  data-speed="600"
                  data-start="0"
                  data-end="10000"
                  data-endspeed="600"><a href="page-services.html" class="btn btn-default btn-lg">Planner <i class="fa fa-angle-double-right pl-10"></i></a>
                </div>

                </li>
                <!-- slide 1 end -->

                <!-- slide 2 start -->
                <li data-transition="fade" data-slotamount="7" data-masterspeed="1000" data-saveperformance="on" data-title="Slide 2">

                <!-- main image -->
                <img src="img/slide_02.jpg"  alt="slidebg1" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">

                <!-- Translucent background -->
                <div class="tp-caption dark-translucent-bg"
                  data-x="center"
                  data-y="bottom"
                  data-speed="800"
                  data-start="0"
                  style="background-color:rgba(0,0,0,0.5);">
                </div>

                <!-- LAYER NR. 1 -->
                <div class="tp-caption very_large_text sfl tp-resizeme"
                  data-x="center"
                  data-y="70"
                  data-speed="600"
                  data-start="0"
                  data-end="10000"
                  data-endspeed="600">Share
                </div>

                <!-- LAYER NR. 2 -->
                <div class="tp-caption sfr small_thin_white text-center tp-resizeme"
                  data-x="center"
                  data-y="170"
                  data-speed="600"
                  data-start="0"
                  data-end="10000"
                  data-endspeed="600">Share your trip
                </div>

                <!-- LAYER NR. 3 -->
                <div class="tp-caption sfl tp-resizeme"
                  data-x="center"
                  data-y="300"
                  data-speed="600"
                  data-start="0"
                  data-end="10000"
                  data-endspeed="600"><a href="page-services.html" class="btn btn-default btn-lg">Share <i class="fa fa-angle-double-right pl-10"></i></a>
                </div>

                </li>
                <!-- slide 2 end -->

              </ul>
            </div>
          </div>
          <!-- slider revolution end -->

        </div>
        <!-- slideshow end -->

      </div>
      <!-- banner end -->


      <!-- section start -->
      <!-- ================ -->
      <!-- section end -->


      <!-- footer start (Add "light" class to #footer in order to enable light footer) -->
      <!-- ================ -->
      <footer id="footer">



        <!-- .subfooter start -->
        <!-- ================ -->
        <div class="subfooter">
          <div class="container">
            <div class="row">
              <div class="col-md-6">
                <p>Copyright © 2040 Travel International. All Rights Reserved</p>
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
                    <ul class="nav navbar-nav">
                      <li><a href="index.html">Home</a></li>
                      <li><a href="#">Planner</a></li>
                      <li><a href="#">Share</a></li>
                      <li><a href="#">Notice</a></li>
                      <li><a href="#">MyPage</a></li>
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
    <script type="text/javascript" src="plugins/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

    <!-- Modernizr javascript -->
    <script type="text/javascript" src="plugins/modernizr.js"></script>

    <!-- jQuery REVOLUTION Slider  -->
    <script type="text/javascript" src="plugins/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="plugins/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>



    <!-- Isotope javascript -->
    <script type="text/javascript" src="plugins/isotope/isotope.pkgd.min.js"></script>

    <!-- Owl carousel javascript -->
    <script type="text/javascript" src="plugins/owl-carousel/owl.carousel.js"></script>

    <!-- Magnific Popup javascript -->
    <script type="text/javascript" src="plugins/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Appear javascript -->
    <script type="text/javascript" src="plugins/jquery.appear.js"></script>

    <!-- Count To javascript -->
    <script type="text/javascript" src="plugins/jquery.countTo.js"></script>

    <!-- Parallax javascript -->
    <script src="plugins/jquery.parallax-1.1.3.js"></script>

    <!-- Contact form -->
    <script src="plugins/jquery.validate.js"></script>

    <!-- SmoothScroll javascript -->
    <script type="text/javascript" src="plugins/jquery.browser.js"></script>
    <script type="text/javascript" src="plugins/SmoothScroll.js"></script>

    <!-- Initialization of Plugins -->
    <script type="text/javascript" src="js/template.js"></script>

    <!-- Custom Scripts -->
    <script type="text/javascript" src="js/custom.js"></script>

  </body>
</html>
