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
	});
</script>
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
						<h2 class="title">百度echarts统计图表示例</h2>
						<p class="title-description">
							这里引用百度echarts图表，根据实际情况http://echarts.baidu.com/查看帮助
						</p>
					</header>
					<hr>
				</section>
				<div class="panel panel-default">
					<div class="panel-hd">统计图表样式一</div>
					<div class="panel-bd">
						<div id="tongji1" style="height:400px"></div>
						 <script type="text/javascript">
							var dom = document.getElementById("tongji1");
							var myChart = echarts.init(dom);
							var app = {};
							option = null;
							app.title = '堆叠条形图';

							option = {
								tooltip : {
									trigger: 'axis',
									axisPointer : {            // 坐标轴指示器，坐标轴触发有效
										type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
									}
								},
								legend: {
									data: ['直接访问', '邮件营销','联盟广告','视频广告','搜索引擎']
								},
								grid: {
									left: '3%',
									right: '4%',
									bottom: '3%',
									containLabel: true
								},
								xAxis:  {
									type: 'value'
								},
								yAxis: {
									type: 'category',
									data: ['周一','周二','周三','周四','周五','周六','周日']
								},
								series: [
									{
										name: '直接访问',
										type: 'bar',
										stack: '总量',
										label: {
											normal: {
												show: true,
												position: 'insideRight'
											}
										},
										data: [320, 302, 301, 334, 390, 330, 320]
									},
									{
										name: '邮件营销',
										type: 'bar',
										stack: '总量',
										label: {
											normal: {
												show: true,
												position: 'insideRight'
											}
										},
										data: [120, 132, 101, 134, 90, 230, 210]
									},
									{
										name: '联盟广告',
										type: 'bar',
										stack: '总量',
										label: {
											normal: {
												show: true,
												position: 'insideRight'
											}
										},
										data: [220, 182, 191, 234, 290, 330, 310]
									},
									{
										name: '视频广告',
										type: 'bar',
										stack: '总量',
										label: {
											normal: {
												show: true,
												position: 'insideRight'
											}
										},
										data: [150, 212, 201, 154, 190, 330, 410]
									},
									{
										name: '搜索引擎',
										type: 'bar',
										stack: '总量',
										label: {
											normal: {
												show: true,
												position: 'insideRight'
											}
										},
										data: [820, 832, 901, 934, 1290, 1330, 1320]
									}
								]
							};;
							if (option && typeof option === "object") {
								myChart.setOption(option, true);
							}
						 </script>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-hd">统计图表样式二</div>
					<div class="panel-bd">
						<div id="tongji2" style="height:400px"></div>
						 <script type="text/javascript">
							var dom = document.getElementById("tongji2");
							var myChart = echarts.init(dom);
							var app = {};
							option = null;
							app.title = '正负条形图';

							option = {
								tooltip : {
									trigger: 'axis',
									axisPointer : {            // 坐标轴指示器，坐标轴触发有效
										type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
									}
								},
								legend: {
									data:['利润', '支出', '收入']
								},
								grid: {
									left: '3%',
									right: '4%',
									bottom: '3%',
									containLabel: true
								},
								xAxis : [
									{
										type : 'value'
									}
								],
								yAxis : [
									{
										type : 'category',
										axisTick : {show: false},
										data : ['周一','周二','周三','周四','周五','周六','周日']
									}
								],
								series : [
									{
										name:'利润',
										type:'bar',
										label: {
											normal: {
												show: true,
												position: 'inside'
											}
										},
										data:[200, 170, 240, 244, 200, 220, 210]
									},
									{
										name:'收入',
										type:'bar',
										stack: '总量',
										label: {
											normal: {
												show: true
											}
										},
										data:[320, 302, 341, 374, 390, 450, 420]
									},
									{
										name:'支出',
										type:'bar',
										stack: '总量',
										label: {
											normal: {
												show: true,
												position: 'left'
											}
										},
										data:[-120, -132, -101, -134, -190, -230, -210]
									}
								]
							};
							;
							if (option && typeof option === "object") {
								myChart.setOption(option, true);
							}
						</script>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-hd">统计图表样式三</div>
					<div class="panel-bd">
						<div id="tongji3" style="height:400px"></div>
						<script type="text/javascript">
							var dom = document.getElementById("tongji3");
							var myChart = echarts.init(dom);
							var app = {};
							option = null;
							option = {
								title : {
									text: '测试',
									subtext: '更多查看echarts',
									x:'center'
								},
								tooltip : {
									trigger: 'item',
									formatter: "{a} <br/>{b} : {c} ({d}%)"
								},
								legend: {
									x : 'center',
									y : 'bottom',
									data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
								},
								toolbox: {
									show : true,
									feature : {
										mark : {show: true},
										dataView : {show: true, readOnly: false},
										magicType : {
											show: true,
											type: ['pie', 'funnel']
										},
										restore : {show: true},
										saveAsImage : {show: true}
									}
								},
								calculable : true,
								series : [
									{
										name:'半径模式',
										type:'pie',
										radius : [20, 110],
										center : ['25%', '50%'],
										roseType : 'radius',
										label: {
											normal: {
												show: false
											},
											emphasis: {
												show: true
											}
										},
										lableLine: {
											normal: {
												show: false
											},
											emphasis: {
												show: true
											}
										},
										data:[
											{value:10, name:'rose1'},
											{value:5, name:'rose2'},
											{value:15, name:'rose3'},
											{value:25, name:'rose4'},
											{value:20, name:'rose5'},
											{value:35, name:'rose6'},
											{value:30, name:'rose7'},
											{value:40, name:'rose8'}
										]
									},
									{
										name:'面积模式',
										type:'pie',
										radius : [30, 110],
										center : ['75%', '50%'],
										roseType : 'area',
										data:[
											{value:10, name:'rose1'},
											{value:5, name:'rose2'},
											{value:15, name:'rose3'},
											{value:25, name:'rose4'},
											{value:20, name:'rose5'},
											{value:35, name:'rose6'},
											{value:30, name:'rose7'},
											{value:40, name:'rose8'}
										]
									}
								]
							};
							;
							if (option && typeof option === "object") {
								myChart.setOption(option, true);
							}
						</script>
					</div>
				</div>
				<!--开始::结束-->
			</div>
		</main>
	</div>
</div>
</body>
</html>
