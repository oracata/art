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
<title>人力资源管理系统</title>
<meta name="keywords" content="侧边导航菜单(可分组折叠)">
<meta name="description" content="侧边导航菜单(可分组折叠)" />
<meta name="HandheldFriendly" content="True" />
<!-- Bootstrap3.3.7 CSS -->
<script src="${path }/static/js/jquery-1.12.4.min.js"></script>
<script src="${path }/static/js/jquery.form.js"></script>
<link href="${path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${path }/static/css/resource.css"
	rel="stylesheet">
<script src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="${path }/static/jq-ui/jquery-ui.min.js"></script>
<script src="${path }/static/jq-ui/jquery-zh.js"></script>
<link href="${path }/static/jq-ui/jquery-ui.min.css"
	rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
            <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
 <![endif]-->
</head>

<body>
	<!--Top Start  -->
	<div class="top-header">
		<div class="nav-header">
			<a href="#" style="float: left;" id="loginInfo-main"> <img alt="logo"
				src="${path }/static/images/logo.png" width="97" height="44"
				style="margin: 3px 5px 0px 0px;">
			</a> &nbsp;&nbsp;&nbsp;&nbsp;
			<h3 style="color: #FFF; float: left; font-family: 宋体; line-height: 8px">人力资源管理系统</h3>
			<p style="float: right;color: #FFF;line-height: 50px;">欢迎您,${user.username }|<a href="${path }/user/exit" style="color: #FFF">注销</a></p>
		</div>
	</div>
	<!--Top End  -->
	<div class="row" style="height: 100%;">
		<div class="col-md-2" id="mav-right">
			<div class="panel-group table-responsive" role="tablist">
				<div class="panel panel-primary leftMenu">
					<!-- 利用data-target指定要折叠的分组列表 -->
					<div class="panel-heading" id="collapseListGroupHeading1"
						data-toggle="collapse" data-target="#collapseListGroup1"
						role="tab">
						<h4 class="panel-title">
							用户管理 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
					<div id="collapseListGroup1" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading1">
						<ul class="list-group">
							<li class="list-group-item" id="user_list">
								<!-- 利用data-target指定URL -->
								<button class="menu-item-left">
									<span class="glyphicon glyphicon-search"></span>&nbsp;用户查询
								</button>
							</li>
							<li class="list-group-item" id="main_user_add">
								<button class="menu-item-left">
									<span class="glyphicon glyphicon-plus"></span> &nbsp;用户添加
								</button>
							</li>
						</ul>
					</div>
				</div>
				<!--panel end-->
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading2"
						data-toggle="collapse" data-target="#collapseListGroup2"
						role="tab">
						<h4 class="panel-title">
							部门管理 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<div id="collapseListGroup2" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading2">
						<ul class="list-group">
							<li class="list-group-item" id="dept-manager">
								<button class="menu-item-left">
									<span class="glyphicon glyphicon-th"></span>&nbsp;部门管理
								</button>
							</li>
						</ul>
					</div>
				</div>
				<!--panel end-->
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading3"
						data-toggle="collapse" data-target="#collapseListGroup3"
						role="tab">
						<h4 class="panel-title">
							职位管理 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<div id="collapseListGroup3" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading3">
						<ul class="list-group">
							<li class="list-group-item" id="job-manager">
								<button class="menu-item-left">
									<span class="glyphicon glyphicon-globe"></span>&nbsp;职位管理
								</button>
							</li>
						</ul>
					</div>
				</div>
				<!--panel end-->
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading4"
						data-toggle="collapse" data-target="#collapseListGroup4"
						role="tab">
						<h4 class="panel-title">
							员工管理 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<div id="collapseListGroup4" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading4">
						<ul class="list-group">
							<li class="list-group-item" id="emp-manager">
								<button class="menu-item-left">
									<span class="glyphicon glyphicon-user"></span>&nbsp;员工管理
								</button>
							</li>
							<li class="list-group-item" id="emp-add">
								<button class="menu-item-left">
									<span class="glyphicon glyphicon-plus"></span>&nbsp;员工新增
								</button>
							</li>
						</ul>
					</div>
				</div>
				<!--panel end-->
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading5"
						data-toggle="collapse" data-target="#collapseListGroup5"
						role="tab">
						<h4 class="panel-title">
							公告管理 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<div id="collapseListGroup5" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading5">
						<ul class="list-group" id="notice-manager">
							<li class="list-group-item">
								<button class="menu-item-left">
									<span class="glyphicon glyphicon-book"></span> &nbsp;公告管理
								</button>
							</li>
						</ul>
					</div>
				</div>
				<!--panel end-->
				<div class="panel panel-primary leftMenu">
					<div class="panel-heading" id="collapseListGroupHeading6"
						data-toggle="collapse" data-target="#collapseListGroup6"
						role="tab">
						<h4 class="panel-title">
							下载中心 <span class="glyphicon glyphicon-chevron-down right"></span>
						</h4>
					</div>
					<div id="collapseListGroup6" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="collapseListGroupHeading6">
						<ul class="list-group">
							<li class="list-group-item" id="file-manager">
								<button class="menu-item-left">
									<span class="glyphicon glyphicon-triangle-right"></span>文件管理
								</button>
							</li>
							<li class="list-group-item" id="file-upload">
								<button class="menu-item-left">
									<span class="glyphicon glyphicon-triangle-right"></span>文件上传
								</button>
							</li>
						</ul>
					</div>
				</div>
				<!--panel end-->
			</div>
		</div>

		<div class="col-md-10" id="content">
		
		</div>
	</div>
	<script>
		$(function() {
			$(".panel-heading").click(function(e) {
				/*切换折叠指示图标*/
				$(this).find("span").toggleClass("glyphicon-chevron-down");
				$(this).find("span").toggleClass("glyphicon-chevron-up");
			});
			$.ajax({
				url:"${path}/user/loginInfo",
				type:"GET",
				dataType:"html",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
		});
		/* 用户查询操作 */
		$("#user_list").click(function() {
			  $.ajax({
				url:"${path}/user/list",
				type:"GET",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
			 //$("#content").load("${path}/user/list #user_list_page>*");
		});
		/* 用户增加页面 */
		$("#main_user_add").click(function(){
			 $.ajax({
					url:"${path}/user/toadd",
					type:"GET",
					dataType:"html",
					success:function(result){
						if(result=="unlogin"){
							window.location.href="${path}/index.jsp";
							return;
						}
						$("#content").html(result);
					}
				 }); 
		});
		
		/* 部门页面 */
		$("#dept-manager").click(function(){
			$.ajax({
				url:"${path}/dept/todept",
				type:"GET",
				dataType:"html",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
		});
		
		
		/* 职位页面 */
		$("#job-manager").click(function(){
			$.ajax({
				url:"${path}/job/tojob",
				type:"GET",
				dataType:"html",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
		});
		
		/* 员工查询 */
		$("#emp-manager").click(function(){
			$.ajax({
				url:"${path}/emp/tolist",
				type:"GET",
				dataType:"html",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
		});
		
		/* 员工新增 */
		$("#emp-add").click(function(){
			$.ajax({
				url:"${path}/emp/toadd",
				type:"GET",
				dataType:"html",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
		});
		
		/* 公告管理 */
		$("#notice-manager").click(function(){
			$.ajax({
				url:"${path}/notice/tonotice",
				type:"GET",
				dataType:"html",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
		});
		/* 文件管理 */
		$("#file-manager").click(function(){
			$.ajax({
				url:"${path}/document/tolist",
				type:"GET",
				dataType:"html",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
		});
		/* 文件上传 */
			$("#file-upload").click(function(){
			$.ajax({
				url:"${path}/document/toadd",
				type:"GET",
				dataType:"html",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
		});
		
		/* 跳转到个人主页 */
		$("#loginInfo-main").click(function(){
			$.ajax({
				url:"${path}/user/loginInfo",
				type:"GET",
				dataType:"html",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					$("#content").html(result);
				}
			 }); 
		});
	</script>
</body>
</html>