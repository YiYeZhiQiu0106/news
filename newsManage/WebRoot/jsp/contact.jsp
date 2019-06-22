<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="News - Clean HTML5 and CSS3 responsive template">
<meta name="author" content="MyPassion">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<title>联系</title>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/reception/img/sms-4.ico" />

<!-- STYLES -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/superfish.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/fontello/fontello.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/flexslider.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/base.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/960.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/devices/1000.css" media="only screen and (min-width: 768px) and (max-width: 1000px)" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/devices/767.css" media="only screen and (min-width: 480px) and (max-width: 767px)" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/reception/css/devices/479.css" media="only screen and (min-width: 200px) and (max-width: 479px)" />
<!--[if lt IE 9]> <script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/customM.js"></script> <![endif]-->


</head>

<body>

<!-- Body Wrapper -->
<div class="body-wrapper">
	<div class="controller">
    <div class="controller2">

        <!-- Header -->
        <header id="header">
            <div class="container">
                <div class="column">
                    <div class="logo">
                        <a href="index.jsp"><img src="${pageContext.request.contextPath}/reception/img/logo.png" alt="MyPassion" /></a>
                    </div>
                    
                    <div class="search">
                        <form action="search.jsp">
                            <input type="text" value="Search." onblur="if(this.value=='') this.value='Search.';" onfocus="if(this.value=='Search.') this.value='';" class="ft"/>
                            <input type="submit" value="" class="fs">
                        </form>
                    </div>
                    
                    <!-- Nav -->
                    <nav id="nav">
                        <ul class="sf-menu">
                            <li class="current"><a href="index.jsp">主页.</a></li>
                            <li>
                            	<a href="#">页面.</a>
                                <ul>
                                    <li><i class="icon-right-open"></i><a href="reviews.jsp">新闻类别列表.</a></li>
                                    <li><i class="icon-right-open"></i><a href="single.jsp">具体新闻详情.</a></li>                      
                                    <li><i class="icon-right-open"></i><a href="contact.jsp">联系.</a></li>
                                </ul>
                            </li>
                            <li><a href="reviews.jsp">世界.</a></li>
                            <li><a href="reviews.jsp">商业.</a></li>
                            <li><a href="reviews.jsp">政治.</a></li>
                            <li>
                                <a href="reviews.jsp">运动.</a>
                                <ul>
                                    <li><i class="icon-right-open"></i><a href="#">足球.</a></li>
                                    <li><i class="icon-right-open"></i><a href="#">跑步.</a></li>
                                    <li><i class="icon-right-open"></i><a href="#">羽毛球.</a></li>
                                    <li><i class="icon-right-open"></i><a href="#">健身.</a></li>
                                    <li><i class="icon-right-open"></i><a href="#">高尔夫.</a></li>
                                    <li><i class="icon-right-open"></i><a href="#">越野.</a></li>
                                </ul>
                            </li>
                            <li><a href="reviews.jsp">健康.</a></li>
                            <li><a href="reviews.jsp">科学.</a></li>
                            <li><a href="reviews.jsp">音乐.</a></li>
                            <li><a href="reviews.jsp">教育.</a></li>
                        </ul>
                    </nav>
                    <!-- /Nav -->
                </div>
            </div>
        </header>
        <!-- /Header -->
        
        <!-- Content -->
        <section id="content">
            <div class="container">
            	
                <div class="breadcrumbs column">
                	<p><a href="#">Home.</a>   \\   <a href="#">World News.</a>   \\   Single.</p>
                </div>
            
            	<!-- Main Content -->
                <div class="main-content">
                    
                    <!-- Single -->
                    <div class="column-two-third single">
                    	<div id="map"><img src="${pageContext.request.contextPath}/reception/images/ryuta.jpg" height="330px"/></div>
                        <div class="outerwide">
                        	<h5 class="line"><span>位置.</span></h5>
                            <p>Mauris dapibus quam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Aliquam erat volutpat. In nec enim dui, in hendrerit enim. Vestibulum ante ipsum primis in faucibus adipcising elit. Lorem ipsum Dolor sit amet adipcising elit mauris dapibus dignisim. </p>
                            
                            <div class="contact-info">
                            	<p class="man"><i class="icon-location"></i>Creative Laboratory <br />77 New York Avenue, New York city, <br />USA 10000.</p>
                                <p class="phone"><i class="icon-phone"></i> Phone:  73 443 11 23. <br />Fax:  73 443 11 23.</p>
                                <p class="envelop"><i class="icon-mail"></i>Email: <a href="#">mail@page.com</a> <br /> Web: <a href="#">www.page.com</a></p> 
                            </div>
                        </div>
                    </div>
                    <!-- /Single -->
                    
                </div>
                <!-- /Main Content -->
                
                <!-- Left Sidebar -->
                <div class="column-one-third">
                	<div class="sidebar">
                    	<h5 class="line"><span>关于联系.</span></h5>
                        <ul class="social">
                        	<li>
                            	<a href="#" class="facebook"><i class="icon-facebook"></i></a>
                                <span>6,800 <br/> <i>fans</i></span>
                            </li>
                            <li>
                            	<a href="#" class="twitter"><i class="icon-twitter"></i></a>
                                <span>12,475 <br/> <i>followers</i></span>
                            </li>
                            <li>
                            	<a href="#" class="rss"><i class="icon-rss"></i></a>
                                <span><i>Subscribe via rss</i></span>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="sidebar">
                    	<h5 class="line"><span>视频.</span></h5>
                   		<img src="${pageContext.request.contextPath}/jsp/img/zwsps.jpg" width="300px" height="170px"/>
                   </div>
                    
                    <div class="sidebar">
                    	<h5 class="line"><span>广告.</span></h5>
                        <ul class="ads125">
                        	<li><a href="#"><img src="${pageContext.request.contextPath}/reception/img/banner/3.png" alt="MyPassion" /></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/reception/img/banner/1.png" alt="MyPassion" /></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/reception/img/banner/2.png" alt="MyPassion" /></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/reception/img/banner/4.png" alt="MyPassion" /></a></li>
                        </ul>
                    </div>
    
                </div>
                <!-- /Left Sidebar -->
                
            </div>    
        </section>
        <!-- / Content -->
        
        <!-- Footer -->
        <footer id="footer">
            <div class="container">     
                <p class="copyright">Copyright &copy; 2014.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
            </div>
        </footer>
        <!-- / Footer -->
    
    </div>
	</div>
</div>
<!-- / Body Wrapper -->


<!-- SCRIPTS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/easing.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/carouFredSel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/superfish.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/customM.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/flexslider-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/tweetable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/timeago.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/jflickrfeed.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/mobilemenu.js"></script>

<!--[if lt IE 9]> <script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/html5.js"></script> <![endif]-->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/mypassion.js"></script>


</body>
</html>

