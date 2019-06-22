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

	function checkform(){
		var mid = $("#m_").val();
		var pwd = $("#file_t").val();
		var pwd2 = $("#file_t").val();
		if(mid == ""){
			alert("身份证号不能为空！");
			return false;
		}else if(pwd == ""){
			alert("原密码不能为空！");
			return false;
		}else if(pwd2 == ""){
			alert("请填写新密码！");
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
		});
		if("${error}" == "error"){
			alert("修改失败！");
		}
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
						<h2 class="title">511趣闻-修改密码</h2>
					</header>
					<hr>
				</section>
				
				<form action="${pageContext.request.contextPath}/b_adm/updateManage.action" method="post" enctype="multipart/form-data">
				<div class="form-group-col-2">
					<div class="form-label">手机号：</div>
					<div class="form-cont">
						<input id="title_t" type="text" readonly="readonly" name="m_tel" value="${m_tel }" onblur="checkTitle()" class="form-control form-boxed">
					</div>
				</div>
				<div class="form-group-col-2">
					<div class="form-label">身份证：</div>
					<div class="form-cont">
						<input id="m_idNumber" type="text" name="m_idNumber" placeholder="18位身份证号码" class="form-control form-boxed">
					</div>		
				</div>
				<div class="form-group-col-2">
					<div class="form-label">原密码：</div>
					<div class="form-cont">
						<input id="n_pwd" type="password" name="n_pwd" class="form-control form-boxed">
					</div>		
				</div>
				
				<div class="form-group-col-2">
					<div class="form-label">新密码：</div>
					<div class="form-cont">
						<input id="n_pwd2" type="password" name="n_pwd2" class="form-control form-boxed">
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

