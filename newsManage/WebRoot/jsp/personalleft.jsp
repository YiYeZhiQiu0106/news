<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>主页</title>
<link rel="shortcut icon" href="img/sms-4.ico" />

<!-- STYLES -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/superfish.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/fontello/fontello.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/flexslider.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/base.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/960.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/devices/1000.css" media="only screen and (min-width: 768px) and (max-width: 1000px)" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/devices/767.css" media="only screen and (min-width: 480px) and (max-width: 767px)" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css/devices/479.css" media="only screen and (min-width: 200px) and (max-width: 479px)" />

<!--[if lt IE 9]> <script type="text/javascript" src="js/customM.js"></script> <![endif]-->
<style>
.font_u{
		color:#5A5A5A;
		font-size:16px;
		
	}
</style>
	
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/easing.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/1.8.2.min.js"></script>



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
                        <a href="${pageContext.request.contextPath}/news/findAllNews.action"><img src="${pageContext.request.contextPath}/jsp/img/logo.png" alt="MyPassion" /></a>
                    </div>
                    
					<div style="padding:5px; width:320px; height:190px;position:absolute; left:650px;top:50px;background-color:white;">
					<img style="width:100px; " src="${pageContext.request.contextPath}/jsp/img/nuser.jpg"/>
					<font class="font_u"><b>用户：${nuser.u_phone }</b></font>
					<br/><br/><br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="window.location.href='${pageContext.request.contextPath}/jsp/writer.jsp'">发布微头条</button>
					
					</div>
					
                    <!-- Nav -->
                    
                    <!-- /Nav -->
                </div>
            </div>
        </header>
        <!-- /Header -->
        
        
        <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
        
        <!-- Content -->
        <section style="height:463px;" id="content">
            <div class="container">
            	<!-- Main Content -->
                
                
                <!-- Left Sidebar -->
                <div class="column-one-third">
                	
                    <div class="sidebar">
                    	<h5 class="line"><span><a style="text-decoration:none" href="${pageContext.request.contextPath}/nuserNews/showNuserNews.action?u_id=${nuser.u_id}">我的文章</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span><a style="text-decoration:none" href="${pageContext.request.contextPath}/nuserNews/showNuserNewsLeft.action?u_id=${nuser.u_id}">我的收藏</a></span></h5>
						
                    </div>
					<div style="height:285px;" class="outerwide">
							<span><b>------ 我的收藏</b></span></h5>
                        	<ul class="block2">
                        		<c:forEach items="${list }" var="news">
	                        		<li>
	                        			<div style="height:70px;">
	                        			<a href="${pageContext.request.contextPath}/news/findOneNewsByID.action?n_id=${news.n_id }"><img width="140px" height="82px" src="${pageContext.request.contextPath}/jsp/img/news/${news.n_img }" alt="MyPassion" class="alignleft" /></a>
	                                    <span>${news.n_time }</span>
	                        			<p>
	                                    <a href="${pageContext.request.contextPath}/news/findOneNewsByID.action?n_id=${news.n_id }">${news.n_title }</a>
	                                    </p>
	                                    </div>
	                                    <div>
	                                    <a href="${pageContext.request.contextPath}/nuserNews/deleteCollect.action?n_id=${news.n_id }"><font color="#8B7E5D">取消收藏</font></a>
	                                    </div>
	                                </li>
                        		</c:forEach>
                            </ul>
                        </div>
				</div>    
				
				<div class="pager">
                            <ul>
                                <c:forEach begin="1" end="${pagenum }" varStatus="st">
                            		<li><a href="${pageContext.request.contextPath}/nuserNews/showNuserNewsLeftPage.action?pagenum=${st.index }&u_id=${nuser.u_id}">${st.index }</a></li>
                            	</c:forEach>
                            </ul>
                        </div>
        </section>
        <!-- / Content -->
        
        
    </div>
	</div>
</div>
<!-- / Body Wrapper -->


<!-- SCRIPTS -->

<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/carouFredSel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/superfish.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/customM.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/flexslider-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/tweetable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/timeago.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jflickrfeed.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/mobilemenu.js"></script>

<!--[if lt IE 9]> <script type="text/javascript" src="js/html5.js"></script> <![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/mypassion.js"></script>


</body>
</html>

