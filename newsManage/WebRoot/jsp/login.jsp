<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>LOGIN</title>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/1.8.2.min.js"></script>
<style>
	
	#login{
		width:570px;
		height: 410px;
		background-color: white;	
		position: absolute;
		left: 180px;
		top: 200px;
	}

	.tc{
		border:1px #B0B0B0 solid;
		height: 38px;
		width: 252px;
		font-size: 13px;
		font-family: "宋体";
		color: #485B5B;
	}*
	.tc:focus{
		border:1px dodgerblue solid;
	}
	.font_t{
		line-height: 43px;
		font-size: 18px;
		color: #485B5B;
	}
	#tab_login{
		border:red;
	}
	table td{
		border: 1px;
		border-color: red;
	}
	table{
		
		border: 1px;
		border-color: red;
		position: absolute;
		top: 30px;
		left: 10px;
	}
	
			#yzm{
				height: 35px;
			}
			#y01{
				position: absolute;
				top: 136px;
				left: 344px;
				width: 70px;
				height: 35px;
			}
			#y02{
				position: absolute;
				top: 468px
				left: 590px;
				width: 70px;
				height: 35px;
				font-size: 23px;
			}
			
			#y02:hover{
				cursor: pointer;
			}
			#y03{
				position: absolute;
				top: 478px;
				left: 680px;
				width: 130px;
				height: 25px;
			}
			#sp_yzm{
				color:black;
			}
		
</style>
<script>
$(function(){
	if("${lose}" =="lose"){
		alert("账号或密码错误，请重新输入");
		
	}
	  
});


/*表单验证*/
	function onblur_Tel(){/*手机号验证*/
				var tel = $("#phone");
				var sp = $("#phone_sp");
				var role = /^1[3-5|7-9]\d{9}$/;
				console.log(tel.val());
				if(tel.val() == ""){
					sp.text("手机号码不能为空！")  ;
					sp.css("color","red");
					return 1;
				}else{
					if(role.test(tel.val())){
						sp.html("<b>✔</b>");
						sp.css("color","lawngreen");
						return 0;
					}else{
						sp.text("手机号码错误！")  ;
						sp.css("color","red");
						return 1;
					}
				}
			}
			
	 function onclick_yzm(){
			//数字混合大写字母
			var arra1="1A2B3C4D5E6F7G8H9I0J1K2L3M4N5O6P7Q8R9S0T1U2V3W4X5Y6Z";
			//数字混合小写字母
			var arra2="7a8b9c0d1e2f3g4h5i6j7k8l9m0n1o2p3q4r5s6t7u8v9w0xyz";
			//字符串  字母和数字的 集合，大致模拟字母和数字混合的字符组合，且数字出现的概率约等于字母出现的概率
			//总长度：(24+24)*2 - 2 = 94;
			var array = arra1+arra2;
			var code01;
			var code02;
			var code03;
			var code04;
			var len;
			
			len =parseInt(Math.random()*array.length);
			code01=array[len];
			len =parseInt(Math.random()*array.length);
			code02=array[len];
			len =parseInt(Math.random()*array.length);
			code03=array[len];
			len =parseInt(Math.random()*array.length);
			code04=array[len];
			var result = ""+code01+code02+code03+code04;
			var spy = document.getElementById("sp_yzm");
			spy.innerText = result;
		}
	 
	 function onblur_yzm(){
			var yzm = document.getElementById("tex6");
			var sp = document.getElementById("tex6_sp");
			if(yzm.value == ""){
				sp.innerText = "请输入验证码！";
				sp.style.color = "red";
				return 1;
			}else{
				if(yzm.value.length == 4){
					var sp02 = document.getElementById("sp_yzm");
					var temp1 = sp02.innerText;
					var temp2 = yzm.value;
					if(temp1.toLowerCase() == temp2.toLowerCase()){
						sp.innerText = "验证码通过！";
						sp.style.color = "#008000";
						return 0;
					}else{
						sp.innerText = "验证码输入错误";
						sp.style.color = "red";
						onclick_yzm();
						return 1;
					}
				}else{
					sp.innerText = "验证码输入错误";
					sp.style.color = "red";
					onclick_yzm();
					return 1;
				}
			}
		}
	 
	 function onblur_pwd(){
		 var pwd = $("#pwd");
		 var sp  = $("#pwd_sp");
		 if(pwd.val() ==""){
			 sp.text("密码不能为空！");
			 sp.css("color","red");
			 return 1;
		 }else{
			 sp.html("");
			 sp.css("color","lawngreen");
			 return 0;
		 }
	 }
	 
	 
	 function olik_sumit(){
		 var ins01= onblur_Tel();
		 var ins02= onblur_yzm();
		 var ins03= onblur_pwd();
		 var result = ins01+ins02+ins03;
		 
		 if($("#pwd").val() ==""){
			 $("#pwd_sp").text("");
			 $("#pwd_sp").css("color","red");
		 }
			if(result > 0){
				return false;
			}else{
				return true;
			}
	 }
	
</script>
</head>

<body onload="onclick_yzm()">

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
                    
                	<div id="login">
                		<form action="${pageContext.request.contextPath}/user/login.action" method="post">
                		<table id="tab_login" border="1px">
                			<tr><td width="80px"><font class="font_t">手机号</font></td><td width="260px"><input id="phone" type="text" name="u_phone" class="tc" onblur="onblur_Tel()" placeholder="请输入您的手机号"/></td><td colspan="2" width="200px"><span id="phone_sp" style="color: #000000; line-height: 43px;">*手机号</span></td></tr>
                			<tr><td ><font class="font_t">密码</font></td><td><input id="pwd" type="password" name="u_pwd" class="tc" placeholder="请输入密码" onblur="onblur_pwd()"/></td><td colspan="2" width="300px"><span id="pwd_sp" style="color: #000000; line-height: 43px;">*密码</span></td></tr>
                			<tr><td><font class="font_t">验证码</font></td><td><input id="tex6" type="text"  onblur="onblur_yzm()" class="tc"/></td><td width="80px">
                			
                			<div id="y01">
							<img style="height: 43px;width: 80px;" src="${pageContext.request.contextPath}/jsp/img/yzm.jpg"/>
							</div>
							<div id="y02" onclick="onclick_yzm()">
								<span id="sp_yzm"></span>
							</div>
                			</td>
                			<td width="200px">
                			<span id="tex6_sp" style="color: #000000; line-height: 43px;"></span></td></tr>
                			
                			<tr><td colspan="4" align="center"><input type="submit" style="background-color: lightcoral; width: 500px; height: 40px;" value="登录" onclick="return olik_sumit()"/></td></tr>
                			<tr><td colspan="4" align="center"><a href="${pageContext.request.contextPath}/jsp/register.jsp"><input type="button" style="width: 500px; height: 40px;" value="注册"/></td></tr>	
                		</table>
                		</form>
                	</div>
            	</div>
			</div>
			</header>
		</div>
	</div>
</div>
<!-- / Body Wrapper -->


<!-- SCRIPTS -->

<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/easing.min.js"></script>

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

<script type="text/javascript">

</script>

</body>
</html>
