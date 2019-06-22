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

<title>搜索</title>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/jsp/img/sms-4.ico" />

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
<!--[if lt IE 9]> <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/customM.js"></script> <![endif]-->


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
                    
                    <c:if test="${nuser == null }">
                    	<div style="position:absolute;left:836px;top:95px;">未登录
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a></div>
                    </c:if>
                    <c:if test="${nuser != null }">
                    	<div style="position:absolute;left:836px;top:95px;">用户:<a href="${pageContext.request.contextPath}/nuserNews/showNuserNews.action?u_id=${nuser.u_id}">${nuser.u_phone }</a></div>
                    </c:if>
                    
                    <div class="search">
                        <form action="${pageContext.request.contextPath}/news/findNewsByTitle.action" method="post">
                            <input type="text" value="${n_title }" onblur="if(this.value=='') this.value='Search.';" onfocus="if(this.value=='Search.') this.value='';" class="ft" name="n_title"/>
                            <input type="submit" value="" class="fs">
                        </form>
                    </div>
                    
                    <!-- Nav -->
                  	<nav id="nav">
                        <ul class="sf-menu" id="lis">    
                        </ul>
                    </nav>
                    <!-- /Nav -->
                </div>
            </div>
            
            <script type="text/javascript">
                           $(function(){
                           		
                            	var url = "${pageContext.request.contextPath}/newsType/types.action";
                            	var data = {type:1};
                            	$.ajax({
                            		url:url,
                            		data:data,
    								type:"POST",
    								dataType:'json',
    								success:function(list){
    									$("#lis").empty();
    									$("#lis").append("<li class='current'><a href='${pageContext.request.contextPath}/news/findAllNews.action'>主页.</a></li>");
    									for(var i = 0;i < list.length;i++ ){
    										$("#lis").append("<li><a href='${pageContext.request.contextPath}/news/findNewsByType.action?id="+list[i].type_id+"'>"+list[i].type_name+"</a></li>");
    									} 
    								}
                            	});
                            })
             </script>
            
        </header>
        <!-- /Header -->
        
        
        
        <!-- Content -->
        <section id="content">
            <div class="container">
            	<!-- Main Content -->
                
                <div class="breadcrumbs column">
                	<p><a href="${pageContext.request.contextPath}/news/findAllNews.action">Home.</a>   \\ <font color="white"> Search.</font></p>
                </div>
                
                <div class="main-content">
                	
                    <!-- Popular News -->
                	<div class="column-two-third">
                		<c:forEach items="${list }" var="news" varStatus="st">
                			<c:if test="${st.index%2 == 0 && news.n_state < 5}">
		                    	<div class="outertight m-t-no">
		                            <div class="flexslider">
		                                <ul class="slides">
		                                    <li>
		                                    	<a href="${pageContext.request.contextPath}/news/findOneNewsByID.action?n_id=${news.n_id }">
		                                        <img width="300px" height="168px" src="${pageContext.request.contextPath}/jsp/img/news/${news.n_img}" alt="MyPassion" />
		                                    	</a>
		                                    </li>  
		                                </ul>
		                            </div>
		                            
		                            <h6 class="regular"><a href="${pageContext.request.contextPath}/news/findOneNewsByID.action?n_id=${news.n_id}">${news.n_title}</a></h6>
		                            <span class="meta">${news.n_time}</span>
		                            <p>${news.n_roundup }</p>
		                        </div>
		                    </c:if>
		                    
		                    <c:if test="${st.index%2 == 1 && news.n_state < 5}">    
		                        <div class="outertight m-r-no m-t-no">  
		                            <div class="flexslider">
		                                <ul class="slides">
		                                    <li>
		                                    	<a href="${pageContext.request.contextPath}/news/findOneNewsByID.action?n_id=${news.n_id }">
		                                        <img width="300px" height="168px" src="${pageContext.request.contextPath}/jsp/img/news/${news.n_img}" alt="MyPassion" />
		                                    	</a>
		                                    </li>  
		                                </ul>
		                            </div>
		                            
		                            <h6 class="regular"><a href="${pageContext.request.contextPath}/news/findOneNewsByID.action?n_id=${news.n_id}">${news.n_title}</a></h6>
		                            <span class="meta">${news.n_time}</span>
		                            <p>${news.n_roundup }</p>
		                        </div>
		                    </c:if>
                        </c:forEach>
                         
                        
                        <div class="pager">
                            <ul>
                                <c:forEach begin="1" end="${pagenum }" varStatus="st">
                            		<li><a href="${pageContext.request.contextPath}/news/findNewsByTitlePage.action?pagenum=${st.index }&n_title=${n_title}">${st.index }</a></li>
                            	</c:forEach>
                            </ul>
                        </div>
                    	
                    </div>
                    <!-- /Popular News -->
                    
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
                        	<li><a href="#"><img src="${pageContext.request.contextPath}/jsp/img/banner/3.png" alt="MyPassion" /></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/jsp/img/banner/1.png" alt="MyPassion" /></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/jsp/img/banner/2.png" alt="MyPassion" /></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/jsp/img/banner/4.png" alt="MyPassion" /></a></li>
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
                <p class="copyright">Copyright &copy; 2015.为了511 All rights reserved.More Templates <a href="#" target="_blank" title="为了511">为了511</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
            </div>
        </footer>
        <!-- / Footer -->
    
    </div>
	</div>
</div>
<!-- / Body Wrapper -->


<!-- SCRIPTS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/easing.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/carouFredSel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/superfish.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/customM.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/flexslider-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/tweetable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/timeago.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jflickrfeed.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/mobilemenu.js"></script>

<!--[if lt IE 9]> <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/html5.js"></script> <![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/mypassion.js"></script>


</body>
</html>

