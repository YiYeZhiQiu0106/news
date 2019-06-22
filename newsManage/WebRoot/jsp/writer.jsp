<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="News - Clean HTML5 and CSS3 responsive template">
<meta name="author" content="MyPassion">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>511趣闻</title>
<link rel="shortcut icon" href="img/sms-4.ico" />

<!-- STYLES -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css2/style.css" />

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



<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/carouFredSel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/superfish.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/customM.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/flexslider-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/tweetable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/timeago.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jflickrfeed.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/mobilemenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/mypassion.js"></script>

<!--[if lt IE 9]> <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/customM.js"></script> <![endif]-->
<style>
	.form-label{
		color:#4F5F6F;
	}
	span{
		color:#4F5F6F;
	}
</style>

</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/easing.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/editor/ueditor.config.js"></script>
<script src="${pageContext.request.contextPath}/jsp/editor/ueditor.all.js"></script>
<script>
	
	function checkTitle(){
		var title = $("#title_t").val();
		if(title == ""){
			$("#title_t").css("border-color","red");
		}else{
			$("#title_t").css("border-color","#CCCCCC");
		}
	}
	function checkFile(){
		var file = $("#file_t").val();
		if(file == ""){
			$("#sp_file").text("未选择封面图片");
			$("#sp_file").css("color","red");
		}else{
			$("#sp_file").text("");
		}
	}

	function checkform(){
		var title = $("#title_t").val();
		var file = $("#file_t").val();
		var text = $("#container").text();
		var ups = $("#title_t").val();
		debugger;
		if(title == ""){
			alert("请输入标题！");
			checkTitle();
			return false;
		}else if(ups.length > 40){
			alert("摘要长度不能超过10！");
			return false;
		}else if(file == ""){
			alert(ups.length);
			checkFile();
			return false;
		}else if(text == ""){
			alert("请填写正文内容！");
			return false;
		}else{
			return true;
		}
	}
	
	
	
</script>
<body>
<!-- Body Wrapper -->
<div class="body-wrapper">
	<div class="controller">
		<div class="controller2">
			<header id="header">
            <div class="container">
                <div class="column">
                	<div class="logo">
                        <a href="${pageContext.request.contextPath}/news/findAllNews.action"><img src="${pageContext.request.contextPath}/jsp/img/logo.png" alt="MyPassion" /></a>
                    </div>
            	</div>
			</div>
			</header>
			
			<script type="text/javascript">
			$(function(){
				$.ajax({
					url : "${pageContext.request.contextPath}/newsType/types.action",
					type : "POST",
					dataType : 'json',
					success : function(response) {
						for(var i = 0; i<response.length; i++){
							if(i == 0){
								$("#check_type").append("<label class='radio'>"+
								"<input type='radio' checked='checked' name='type_id' value='"+response[i].type_id+"'/>"+
								"<span>"+response[i].type_name+"</span></label>");
								
							}else{
								$("#check_type").append("<label class='radio'>"+
								"<input type='radio' name='type_id' value='"+response[i].type_id+"'/>"+
								"<span>"+response[i].type_name+"</span></label>");
							}
						}
					}
				});
				
			});
			</script>
			
			
			<main class="main-cont content mCustomScrollbar">
			<div class="page-wrap" style="position:absolute;left:153px; top:118px;width:1060px;">
				<!--开始::内容-->
				<section class="page-hd">
					<header>
						<h2 class="title">511趣闻-发布微头条</h2>
					</header>
					<hr>
				</section>
				
				<form action="${pageContext.request.contextPath}/nuserNews/writerNews.action" method="post" enctype="multipart/form-data">
				<div class="form-group-col-2">
					<div class="form-label">标题：</div>
					<div class="form-cont">
						<input id="title_t" type="text" name="n_title" placeholder="输入标题..." onblur="checkTitle()" class="form-control form-boxed">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">类型：</div>
					<div class="form-cont" id="check_type">
	
					</div>
				</div>
				
				<div class="form-group-col-2">
				<div class="form-label">封面：</div>
					<div class="form-cont">
				<input id="file_t" name="file" type="file"><span id="sp_file"></span>
				</div>
				</div>
				
				<div class="form-group-col-2">
					<div class="form-label">摘要：</div>
					<div class="form-cont">
					<input id="title_t" type="text" name="n_roundup" placeholder="摘要信息" class="form-control form-boxed">
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-hd">正文内容</div>
					<div class="panel-bd">
						<script id="container" name="n_text" type="text/plain">在此处编辑你的新闻...</script>
						<script type="text/javascript">
							var ue = UE.getEditor('container');
						</script>
					</div>
				</div>
				
				<!--开始::结束-->
			<button class="btn btn-lg btn-block" onclick="return checkform()">提交</button>
			</form>
			</main>
			</div>
		</div>
	</div>
</body>
</html>


