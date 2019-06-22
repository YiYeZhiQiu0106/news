<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统-HTML5后台管理系统</title>
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
<script src="${pageContext.request.contextPath}/jsp/javascript/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/javascript/bootstrap.min.css" />
<style>
  #bt_select{
   position: absolute;
   left:800px;
  }

	th{
		text-align: center;
	}
</style>

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

<script type="text/javascript">
	 $(function(){
			//自动发送请求    $.get()  $.post()  $.load()
			//debugger;
			var pagination=1;
			$.ajax({
				url:"${pageContext.request.contextPath}/b_type/pageNewsType.action?pagination="+pagination,
				dataType:"json",
				success:function(t){
					//console.log(t); //数据  数组
					for(var i=0;i<t.length;i++){
						//console.log(t[i].type_id);
						var opt = $('<tr class="cen"><td>'+t[i].type_id+'</td><td>'+t[i].type_name+'</td><td class="lt">'+t[i].type_introduce+'</td>'+
						'<td><button class="btn btn-default btn-xs" data-target="#myUpdateModal" data-toggle="modal"  onclick="but_infom(this)" id="a'+t[i].type_id+'" value="'+t[i].type_id+'">编辑</button>'+
						'<button class="btn btn-default btn-xs"  value="'+t[i].type_id+'" onclick="but_delete(this)">删除</button></td></tr>');
						$("#showType").append(opt);
					}
				}
			});
		});
	 
	 	function but_infom(data){
	 		var id = data.value;
	 		$("#type_id").val(id);
	 	
	 	}
	 	function but_delete(data){
	 		//debugger;
	 		var id = data.value;
	 		var uri="${pageContext.request.contextPath}/b_type/deleteNewsType.action";
	 		//Window.location.href=uri;
	 		console.log(id);
	 		$.get(uri,{type_id:id},function(){
	 			//刷新url
	 			var url="${pageContext.request.contextPath}/b_type/findAllNewsType.action";
		 		location.href=url;
	 		});
	 	}
	</script>
	

		
		
		
		
		
		
		
		<main class="main-cont content mCustomScrollbar">
			<div class="page-wrap">
				<!--开始::内容-->
				<section class="page-hd">
					<header>
						<h2 class="title">文章类型管理</h2>
					</header>
					<hr>
				</section>
				
				
				
				  <!-- 按钮触发模态框 --><button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">添加类型</button>
				 
	
	<!--添加的 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">请添加类型</h4>
            </div>
            <form action="${pageContext.request.contextPath}/b_type/insertNewsType.action" method="get">
            <div class="modal-body">
                 <table>
                 <tr>
                 <td>类型名称：</td><td><input type="text" id="typename" name="type_name"></td>
                 </tr>
                 <tr>
                 <td>类型介绍：</td><td><input type="text" name="type_introduce"></td>
                 </tr>
                 </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <input type="submit" class="btn btn-primary" value="确认添加">
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!--修改的 模态框（Modal） -->
<div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改类型信息</h4>
            </div>
            <form action="${pageContext.request.contextPath}/b_type/updateNewsType.action" method="get">
            	<input id="type_id" type="hidden" name="type_id" value=""/>
             <div class="modal-body">
                 <table>
                 <tr>
                 <td>类型名称：</td><td><input type="text" id="typename" name="type_name"></td>
                 </tr>
                 <tr>
                 <td>类型介绍：</td><td><input type="tel" name="type_introduce"></td>
                 </tr>
                 </table>
            
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <input type="submit" class="btn btn-primary" value="确认修改">
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
				<div style="height:300px;">
				<table  class="table table-bordered table-striped table-hover" id="typeManage">
					<thead>
						<tr>
							<th>类型ID</th>
							<th>类型名称</th>
							<th>类型介绍</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="showType">
						<%-- 数据--%>
					</tbody>
				</table>
				</div>
				<!--:结束-->
				
				
				
				<!--开始:分页-->
				<div class="panel panel-default">
					<div class="panel-bd">
						<div class="pagination"></div>
					</div>
				</div>
				<!--:结束-->
			</div>
		</main>
	</div>
</div>
<script>
    $(".pagination").createPage({
        pageCount:"${page}",
        current:1,
        backFn:function(pagination){
        	console.log(pagination);
        	$.ajax({
				url:"${pageContext.request.contextPath}/b_type/pageNewsType.action?pagination="+pagination,
				
				dataType:"json",
				success:function(t){

					$("#showType tr").html("");
					
					for(var i=0;i<t.length;i++){
						var opt = $('<tr class="cen"><td>'+t[i].type_id+'</td><td>'+t[i].type_name+'</td><td class="lt">'+t[i].type_introduce+'</td>'+
						'<td><button class="btn btn-default btn-xs" data-target="#myUpdateModal" data-toggle="modal"  onclick="but_infom(this)" id="a'+t[i].type_id+'" value="'+t[i].type_id+'">编辑</button>'+
						'<button class="btn btn-default btn-xs"  value="'+t[i].type_id+'" onclick="but_delete(this)">删除</button></td></tr>');
						$("#showType").append(opt);
					}
				}
			});
        }
    });
</script>
</body>
</html>
