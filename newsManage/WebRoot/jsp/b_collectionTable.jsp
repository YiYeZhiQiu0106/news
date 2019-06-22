<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/css2/style.css" />
<script src="${pageContext.request.contextPath}/jsp/javascript/jquery.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/plug-ins/customScrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/plug-ins/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/plug-ins/layerUi/layer.js"></script>
<script src="${pageContext.request.contextPath}/jsp/editor/ueditor.config.js"></script>
<script src="${pageContext.request.contextPath}/jsp/editor/ueditor.all.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/plug-ins/pagination.js"></script>
<script src="${pageContext.request.contextPath}/jsp/javascript/public.js"></script>
</head>
<body>
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
						<h2 class="title">文章收藏详情</h2>
						<p class="title-description">
							详情信息
						</p>
					</header>
					<hr>
				</section>
				<div style="270px">
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>收藏历史ID</th>
							<th>标题</th>
							<th>类型</th>
							<th>作者</th>
							<th>收藏次数</th>
						</tr>
					</thead>
					<tbody id="tbody_info">
					
					</tbody>
				</table>
				</div>
				<!--开始::结束-->
				<!--开始:分页:内容-->
				<div class="panel panel-default">
					<div class="panel-bd">
						<div class="pagination"></div>
					</div>
				</div>
				<!--开始::结束-->
			</div>
		</main>
	</div>
</div>
<script>
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
			
			//加载页面数据
			$.ajax({
				url : "${pageContext.request.contextPath}/b_history/ajaxHistoryView.action",
				type : method,
				dataType : 'json',
				success : function(response) {
					
					for(var i = 0 ; response.length ; i++){
						$("#tbody_info").append(
						"<tr class='cen'><td>"+response[i].h_id+"</td><td>"+response[i].n_title+"+</td>"+
						"<th>"+response[i].type_name+"</th><th>"+response[i].n_author+"</th>"+
						"<th>"+response[i].h_degree+"</th></tr>"
						);
					}
				}
			});
			
			
			
		});
		
		
		$(".pagination").createPage({
		    pageCount:"${page}",
		    current:1,
		    backFn:function(p){
		    	//加载页面数据
		    	$("#tbody_info tr").html("");
				$.ajax({
					url : "${pageContext.request.contextPath}/b_history/ajaxHistoryView.action?begin="+p,
					type : "POST",
					dataType : 'json',
					success : function(data) {
						for(var i = 0 ; data.length ; i++){
							$("#tbody_info").append(
							"<tr class='cen'>"+
							"<tr class='cen'><td>"+data[i].h_id+"</td><td>"+data[i].n_title+"+</td>"+
							"<th>"+data[i].type_name+"</th><th>"+data[i].n_author+"</th>"+
							"<th>"+data[i].h_degree+"</th></tr>"
							);
						}
					}
				});
		    }
		});
</script>
</body>
</html>

</html>
