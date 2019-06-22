<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 新闻编辑Jsp -->

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统-511趣闻</title>
<meta name="keywords"  content="设置关键词..." />
<meta name="description" content="设置描述..." />
<meta name="author" content="DeathGhost" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<link rel="icon" href="${pageContext.request.contextPath}/jsp/images2/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css2/style.css" >
<script src="${pageContext.request.contextPath}/jsp/javascript/jquery.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/plug-ins/customScrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/plug-ins/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/plug-ins/layerUi/layer.js"></script>
<script src="${pageContext.request.contextPath}/jsp/editor/ueditor.config.js"></script>
<script src="${pageContext.request.contextPath}/jsp/editor/ueditor.all.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/plug-ins/pagination.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/public.js"></script>
</head>
<style>
	#sp_file{
		color:red;
	}
</style>
<body>

<script type="text/javascript">
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
		}else{
			$("#sp_file").text("");
		}
	}

	function checkform(){
		var title = $("#title_t").val();
		var file = $("#file_t").val();
		debugger;
		if(title == ""){
			alert("请输入标题！");
			checkTitle();
			return false;
		}else if(file == ""){
			alert("请选择封面图片");
			checkFile();
			return false;
		}else{
			return true;
		}
	}
	
	
	$(function(){
		$(function(){
			//加载管理员姓名的公用ajax
			var url = "${pageContext.request.contextPath}/b_adm/getAdmName.action";
			var method = "POST";
			$.ajax({
				url : url,
				type : method,
				dataType : 'json',
				success : function(response) {
					$("#admName").text(response.adm.m_name);
				}
			});
			
			//从数据库填充新闻类型
			$.ajax({
				url : "${pageContext.request.contextPath}/b_newsManage/typeAjax.action",
				type : method,
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
	});
	
</script>

<div class="main-wrap">
	<div class="side-nav">
		<div class="side-logo">
			<div class="logo">
				<span class="logo-ico">
					<i class="i-l-1"></i>
					<i class="i-l-2"></i>
					<i class="i-l-3"></i>
				</span>
				<strong>511趣闻后台管理系统</strong>
			</div>
		</div>
		
		<nav class="side-menu content mCustomScrollbar" data-mcs-theme="minimal-dark">
			<h2>
				<a href="${pageContext.request.contextPath}/jsp/b_ueditor.jsp" class="InitialPage"><i class="icon-font"></i>新闻编辑</a>
			</h2>
			<ul>
				<li>
					<dl>
						<dt>
							<i class="icon-columns"></i>发布新闻<i class="icon-angle-right"></i>
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/b_newsManage/showRelease.action">待发布的新闻</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							<i class="icon-columns"></i>新闻管理<i class="icon-angle-right"></i>
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/b_type/findAllNewsType.action">新闻类型管理</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/b_newsManage/showNewsInfom.action">文章信息管理</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							<i class="icon-columns"></i>用户管理<i class="icon-angle-right"></i>
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/b_users/showNuser.action">用户资料</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							<i class="icon-columns"></i>收藏管理<i class="icon-angle-right"></i>
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/b_history/showHistoryView.action">文章收藏详情</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							<i class="icon-columns"></i>反馈信息<i class="icon-angle-right"></i>
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/b_feed/showfeed.action">反馈信息列表</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							<i class="icon-bar-chart"></i>统计图表<i class="icon-angle-right"></i>
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/jsp/b_echarts.jsp">统计图</a>
						</dd>
					</dl>
				</li>
			</ul>
		</nav>
		<footer class="side-footer">© 511 版权所有</footer>
	</div>
	<div class="content-wrap">
		<header class="top-hd">
			<div class="hd-lt">
				<a class="icon-reorder"></a>
			</div>
			<div class="hd-rt">
				<ul>
					<li>
						<a href="${pageContext.request.contextPath}/news/findAllNews.action" target="_blank"><i class="icon-home"></i>前台访问</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/jsp/b_index.jsp"><i class="icon-user"></i><em id="admName"></em></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/jsp/b_login.jsp" id="JsSignOut"><i class="icon-signout"></i>安全退出</a>
					</li>
				</ul>
			</div>
		</header>
		
		
		
		
		
		
		
		<main class="main-cont content mCustomScrollbar">
			<div class="page-wrap">
				<!--开始::内容-->
				<section class="page-hd">
					<header>
						<h2 class="title">511趣闻-新闻编辑</h2>
					</header>
					<hr>
				</section>
				
				<form action="${pageContext.request.contextPath}/b_newsManage/insertNews.action" method="post" enctype="multipart/form-data">
				<div class="form-group-col-2">
					<div class="form-label">标题：</div>
					<div class="form-cont">
						<input id="title_t" type="text" name="n_title" placeholder="输入标题..." onblur="checkTitle()" class="form-control form-boxed">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">作者：</div>
					<div class="form-cont">
						<input type="text" name="n_author" placeholder="作者名字..." class="form-control form-boxed">
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
						<textarea name="n_roundup" class="form-control form-boxed">摘要信息</textarea>
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
		</div>
		</main>
	</div>
</div>
</body>
</html>

