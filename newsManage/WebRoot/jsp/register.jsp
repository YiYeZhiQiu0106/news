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
<title>请注册，了解世界</title>
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
	
	#register{
		width:580px;
		height: 620px;
		background-color: white;	
		position: absolute;
		left: 180px;
		top: 140px;
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
		width: 600px;
	}
	table td{
		border: 1px;
		border-color: red;
	}
	table{
		position: absolute;
		top: 30px;
		left: 10px;
	}
	
	
			#y01{
				position: absolute;
				top: 388px;
				left: 382px;
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
    	if("${register}"!=null && "${register}"!=""){
    		alert("${register}");
    	}
    });
   
    



/*表单验证*/
	function onblur_Tel(){/*手机号验证*/
				var tel = $("#phone");
				var sp = $("#phone_sp");
				var role = /^1[3-5|7-9]\d{9}$/;
				console.log(tel.val());
				if(tel.val() == ""){
					sp.text("*手机号码不能为空！")  ;
					sp.css("color","red");
					return 1;
				}else{
					if(role.test(tel.val())){
						sp.html("<b>✔</b> ");
						sp.css("color","lawngreen");
						return 0;
					}else{
						sp.text("*手机号码错误！")  ;
						sp.css("color","red");
						return 1;
					}
				}
			}
	
	function onblur_name(){/*姓名验证*/
				var name = $("#name");
				var sp = $("#name_sp");
				var role =   /^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,10}$/;//验证姓名正则 
				if(name.val() == ""){
					sp.text("*姓名不能为空！")  ;
					sp.css("color","red");
					return 1;
				}else{
					if(role.test(name.val())){
						sp.html("<b>✔</b> ");
						sp.css("color","lawngreen");
						return 0;
					}else{
						sp.text("*姓名不合法！")  ;
						sp.css("color","red");
						return 1;
					}
				}
			}
	
	function onblur_age(){/*年龄验证*/
				var age = $("#age");
				var sp = $("#age_sp");
				var role =   /^[0-9]{1,3}$/;//验证姓名正则 
				if(age.val() == ""){
					sp.text("*年龄不能为空！")  ;
					sp.css("color","red");
					return 1;
				}else{
					if(role.test(age.val())){
						sp.html("<b>✔</b> ");
						sp.css("color","lawngreen");
						return 0;
					}else{
						sp.text("*年龄不合法！")  ;
						sp.css("color","red");
						return 1;
					}
				}
			}
	
	function onblur_pwd(){/*密码验证*/
				var pwd = $("#pwd");
				var sp = $("#pwd_sp");
				var role =   /^[\dA-Za-z_]{6,}$/;//验证姓名正则 
				if(pwd.val() == ""){
					sp.text("*密码不能为空！")  ;
					sp.css("color","red");
					return 1;
				}else{
					if(role.test(pwd.val())){
						sp.html("<b>✔</b> ");
						sp.css("color","lawngreen");
						return 0;
					}else{
						sp.text("*密码不合法！")  ;
						sp.css("color","red");
						return 1;
					}
				}
			}
	
		function onblur_pwd1(){/*确认密码*/
				var pwd = $("#pwd");
				var pwd1 = $("#pwd1");
				var sp = $("#pwd1_sp");
				
				 if(pwd.val() == pwd1.val() && pwd.val()!="" ){
						sp.html("<b>✔</b> ");
						sp.css("color","lawngreen");
						return 0;
					}
					else{
						sp.text("*两次输入的密码不相同！");
						sp.css("color","red");
						return 1;
					}	
		   }
		
			function isfChecbox(){
		     	var checbox = $("#chec");
		     	var sp=$("#che_sp");
		     	if(checbox.attr("checked") == "checked"){
					sp.text("");
					sp.css("color","lawngreen");
					return 0;
				}else{
					sp.text("*注册必需同意");
					sp.css("color","red");
					return 1;
				}
				
					
		   }
			//生成验证码
			function onclick_yzm(){
				//处理手段：
				
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
			
			//验证验证码
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
		   
			function last_submit(){
				var ins01 = onblur_name();
				var ins02 = onblur_pwd();
				var ins03 = onblur_pwd1();
				var ins04 = onblur_Tel();
				var ins05 = onblur_age();
			    var ins06 = isfChecbox();
				
				var result = ins01+ins02+ins03+ins04+ins05+ins06;
				
				var pwd1 = $("#pwd1");
				
				if(pwd1.val() == "" ){
					var sp = $("#pwd1_sp");
					sp.text("*密码不能为空！");
					sp.css("color","red");
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
                    
                	<div id="register">
                		<form action="${pageContext.request.contextPath}/user/register.action" method="post">
                		<table  id="tab_login" >
                		<tr><td width="100px"><font class="font_t">姓名</font></td><td width="260px"><input id="name" type="text" class="tc" name="u_name" onblur="onblur_name()"/></td><td colspan="2" width="200px"><span id="name_sp" style="color: #000000; line-height: 43px;">*姓名</span></td></tr>
                			<tr><td><font class="font_t">性别</font></td><td colspan="3"><input id="sex" type="radio" name="u_sex" checked="checked" value="男"/><font class="font_t" color="#000000">男</font>   <input  type="radio" name="u_sex" value="女"/><font class="font_t" color="#000000">女</font></td></tr>
                			<tr><td><font class="font_t">年龄</font></td><td><input id="age" type="text" name="u_age" class="tc" onblur="onblur_age()"/></td><td colspan="2"><span id="age_sp" style="color: #000000; line-height: 43px;">*</span></td></tr>
                			<tr><td><font class="font_t">密码</font></td><td><input id="pwd" type="password" name="u_pwd" class="tc" onblur="onblur_pwd()"/></td><td colspan="2"><span id="pwd_sp" style="color: #000000; line-height: 43px;">*至少6位有效密码</span></td></tr>
                			<tr><td><font class="font_t">确认密码</font></td><td><input id="pwd1" type="password" name="u_pwd1" class="tc" onblur="onblur_pwd1()"/></td><td colspan="2"><span id="pwd1_sp" style="color: #000000; line-height: 43px;">*</span></td></tr>
                			<tr><td><font class="font_t">手机号</font></td><td><input id="phone" type="text" name="u_phone" class="tc" placeholder="请输入有效11位手机号" onblur="onblur_Tel()"/></td><td colspan="2"><span id="phone_sp" style="color: #000000; line-height: 43px;">*有效手机号</span></td></tr>
                			<tr><td>
                			
                			<font class="font_t">验证码</font></td><td><input id="tex6" type="text"  onblur="onblur_yzm()" class="tc"/></td><td width="100px">
                			
                			<div id="y01">
							<img style="height: 35px;width: 70px;" src="${pageContext.request.contextPath}/jsp/img/yzm.GIF"/>
							</div>
							<div id="y02" onclick="onclick_yzm()">
								<span id="sp_yzm"></span>
							</div>
                			</td>
                			<td width="200px">
                			<span id="tex6_sp" style="color: #000000; line-height: 43px;"></span></td>
                			</tr>
                			
                			
                			<tr><td colspan="3" align="center"><input id="chec" type="checkbox" /><font style="font-size: 12px; color: #3C3C3C;">我已阅读并同意用户协议和隐私条款</font></td><td><span id="che_sp"></span></td></tr>
                			<tr><td colspan="4" align="center"><input type="submit" id="sub"  style="background-color: lightcoral; width: 390px; height: 40px;" value="注册" onclick="return last_submit()"/></td></tr>
                			
                		
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

</body>
</html>

