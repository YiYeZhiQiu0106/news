<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>登录-511后台管理系统</title>
<meta name="keywords"  content="设置关键词..." />
<meta name="description" content="设置描述..." />
<meta name="author" content="DeathGhost" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name='apple-touch-fullscreen' content='yes'>
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<link rel="icon" href="${pageContext.request.contextPath}/jsp/images2/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css2/style.css" />
<script src="${pageContext.request.contextPath}/jsp/javascript/jquery.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/public.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/plug-ins/customScrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/pages/login.js"></script>
</head>
<script>
	$(function(){
		if("${info}" == "error"){
			alert("账号或密码错误！");
		}
	});
	
	function checkform(){
		debugger;
		var tex = $("#adminName").val();
		var pwd = $("#adminPwd").val();
		if(tex == ""){
			alert("账号不能为空！");
			return false;
		}else if(pwd == ""){
			alert("密码不能为空！");
			return false;
		}else{
			return true;
		}
	}
	
</script>
<body class="login-page">
	<section class="login-contain">
		<header>
			<h1>511趣闻后台管理系统</h1>
			<p>management system</p>
		</header>
		<div class="form-content">
		<form action="${pageContext.request.contextPath}/b_adm/login.action" method="get">
			<ul>
				
				<li>
					<div class="form-group">
						<label class="control-label">管理员账号：</label>
						<input type="text" name="m_tel" placeholder="管理员账号..." class="form-control form-underlined" id="adminName"/>
					</div>
				</li>
				<li>
					<div class="form-group">
						<label class="control-label">管理员密码：</label>
						<input type="password" name="m_pwd" placeholder="管理员密码..." class="form-control form-underlined" id="adminPwd"/>
					</div>
				</li>
				<li>
					<label class="check-box">
						<input type="checkbox" name="remember"/>
						<span>记住账号密码</span>
					</label>
				</li>
				<li>
					<button class="btn btn-lg btn-block" onclick="return checkform()">立即登录</button>
				</li>
				<li>
				
				</li>
			</ul>
			</form>
		</div>
	</section>
<div class="mask"></div>
<div class="dialog">
	<div class="dialog-hd">
		<strong class="lt-title">标题</strong>
		<a class="rt-operate icon-remove JclosePanel" title="关闭"></a>
	</div>
	<div class="dialog-bd">
		<!--start::-->
		<p>这里是基础弹窗,可以定义文本信息，HTML信息这里是基础弹窗,可以定义文本信息，HTML信息。</p>
		<!--end::-->
	</div>
	<div class="dialog-ft">
		<button class="btn btn-info JyesBtn">确认</button>
		<button class="btn btn-secondary JnoBtn">关闭</button>
	</div>
</div>
</body>
</html>

