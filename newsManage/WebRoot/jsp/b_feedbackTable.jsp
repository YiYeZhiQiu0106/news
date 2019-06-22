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
						<h2 class="title">反馈信息管理</h2>
						<p class="title-description">
							详情信息
						</p>
					</header>
					<hr>
				</section>
				
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>反馈信息ID</th>
							<th>反馈正文</th>
							<th>用户姓名</th>
							<th>年龄</th>
							<th>手机号</th>
							<th>反馈时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="tbody_feed">
						
					</tbody>
				</table>
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
		
		$.ajax({
			
			url : "${pageContext.request.contextPath}/b_feed/ajaxShowfeed.action",
			type : "POST",
			dataType : 'json',
			success : function(r) {
				for(var i = 0 ; r.length;i++){
					$("#tbody_feed").append(
							"<tr class='cen'><td>"+r[i].f_id+"</td>"+
							"<td class='lt'>"+r[i].f_text+"</td>"+
							"<th>"+r[i].u_name+"</th>"+
							"<th>"+r[i].u_age+"</th>"+
							"<th>"+r[i].u_phone+"</th>"+
							"<th>"+r[i].f_time+"</th>"+
							"<td><a href='' title='详情' class='mr-5'>详情</a>"+
							"<a href='${pageContext.request.contextPath}/b_feed/deleteFeed.action?f_id="+r[i].f_id+"' title='删除'>删除</a></td></tr>"
					);
				}
			}
		});
		
	});
	

    $(".pagination").createPage({
        pageCount:"${page}",
        current:1,
        backFn:function(p){
            console.log(p);
        }
    });
</script>
</body>
</html>
