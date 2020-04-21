<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>登陆</title>
<script src="${path }/static/js/jquery-1.12.4.min.js"></script>
<link href="${path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${path }/static/css/resource.css"
	rel="stylesheet">
<script src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	position: absolute;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	background-color:#00FF00;
	background-attachment:fixed;
	background-image:url(${path }/static/images/loginbgm.jpg);
	background-repeat:no-repeat;
	background-size:100% 100%;
	/* background: #00FF00 url(${path }/static/images/loginbgm.jpg) no-repeat 100% 100% ; */
}

.t-box {
	width: 100%;
	height: 100%;
}

.l-box {
	width: 440px;
	margin: 200px auto;
	background: #DBDBDB;
	padding: 20px;
}

.t-title {
	text-align: center;
}
</style>
</head>

<body>
	<div class="t-box">
		<div class="l-box">
			<h3 class="t-title">Artesyn管理系统</h3>
			<hr>
			<c:if test="${msg!=null}">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="color: red">${msg}</span>
				<br>
			</c:if>
			<form class="form-horizontal" action="${path }/user/login"
				method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">账号</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="loginname"
							id="account" placeholder="请输入账号" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">密码</label>
					<div class="col-sm-8">
						<input type="password" name="password" class="form-control"
							id="password" placeholder="请输入密码" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox" id="remember_password"
								name="flag" checked>记住密码
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">登录</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			var loginname=getck("loginname");//""
			var password=getck("password");//""
			if(loginname!==('""')&&password!==('""')){
				$("#account").val(loginname);
				$("#password").val(password);	
			}else{
				$("#account").text("");
				$("#password").text(""); 
			}
			
		});
		
		//获取单个cookies
		var acookie = document.cookie.split("; ");
		function getck(sname) {
			for (var i = 0; i < acookie.length; i++) {
				var arr = acookie[i].split("=");
				if (sname == arr[0]) {
					if (arr.length > 1)
						return unescape(arr[1]);
					else
						return "";
				}
			}
			return "";
		}
	</script>
</body>
</html>