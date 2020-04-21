<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加</title>
</head>
<body>
	<div class="container-fluid" id="user_list_page">
		<div class="row">
			<div class="col-md-12">
				<h3>用户添加</h3>
			</div>
		</div>
		<hr>
		<form class="form-horizontal" id="user_add_form">
			<div class="form-group">
				<label class="col-sm-2 control-label">用户账号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="loginname"
						placeholder="输入用户账号" id="account" required="required">
				</div>
				<span class="col-md-4" style="line-height: 32px; font-size: 16px;"></span>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">用户密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="password"
						placeholder="输入用户密码" id="password" required="required">
				</div>
				<span class="col-md-6" style="line-height: 32px; font-size: 16px;"></span>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" placeholder="确认用户密码"
						id="confirm_password" required="required">
				</div>
				<span class="col-md-4" style="line-height: 32px; font-size: 16px;"></span>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="username"
						placeholder="输入用户名" id="username" required="required">
				</div>
				<span class="col-md-6" style="line-height: 32px; font-size: 16px;"></span>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">备注</label>
				<div class="col-sm-4">
					<textarea class="form-control" rows="3" id="remark" name="remark"></textarea>
				</div>
			</div>

			<div class="form-group col-sm-6" style="text-align: right;">
				<button type="button" class="btn btn-default"
					id="user_add">添加</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-default" id="user_add_reset">重置</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		/* 处理检查输入类样式 */

		function show_validate_msg(ele, status, msg) {
			$(ele).parent().removeClass("has-success has-error");
			$(ele).parent().next().text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).parent().next().text(msg).css("color", "green");
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).parent().next().text(msg).css("color", "red");
			}
		}
		/* 检查用户名是否可用 */
		$("#account").change(function() {
			var name = $(this).val();
			var loginnamePattern = /^[a-zA-Z0-9_-]{4,16}$/;
			if (!loginnamePattern.test(name)) {
				show_validate_msg("#account", "error", "账号必须是4到16位字符");
				$("#account").attr("account-va", "error");
				return;
			}
			$.ajax({
				url : "${path}/user/checkName",
				type : "GET",
				data : "loginname=" + name,
				success : function(result) {
					if (result.code == 100) {
						show_validate_msg("#account", "success", "账号可用");
						$("#user_add").attr("account-va", "success");
					} else {
						show_validate_msg("#account", "error", "账号重复");
						$("#user_add").attr("account-va", "error");
					}
				}
			});
		});

		/* 密码格式 */
		$("#password").change(function() {
			var password = $(this).val();
			var passwordPattern = /^[A-Za-z0-9]{6,16}$/;
			if (passwordPattern.test(password)) {
				show_validate_msg(this, "success", "");
				$("#user_add").attr("password-va", "success");
			} else {
				show_validate_msg(this, "error", "密码最少6位,必须由字母或数字组成");
				$("#user_add").attr("password-va", "error");
			}
		});

		/* 验证密码是否相同 */
		$("#confirm_password").change(function() {
			var password = $("#password").val();
			var confirm = $(this).val();
			if (password == confirm) {
				show_validate_msg(this, "success", "");
				$("#user_add").attr("confirm-va", "success");
			} else {
				show_validate_msg(this, "error", "密码不相同");
				$("#user_add").attr("confirm-va", "error");
			}
		});

		/* 用户名验证 */
		$("#username").change(
						function() {
							var username = $(this).val();
							var usernamePattern = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
							if (!usernamePattern.test(username)) {
								show_validate_msg(this, "error",
										"用户名可以是2-5位中文或者6-16位英文和数字的组合");
								$("#user_add").attr("user-va", "error");
							} else {
								show_validate_msg(this, "success", "");
								$("#user_add").attr("user-va", "success");
							}
						});

		/* 点击添加按钮*/
		$("#user_add").click(
				function() {
					var account = $("#account").val();
					var password = $("#password").val();
					var confirm = $("#confirm_password").val();
					var username = $("#username").val();
				 	if (account == "" || password == "" || confirm == ""
							|| username == "") {
						alert("别乱点了,你提交不了!")
						return;
					} 
					var loginVa = $(this).attr("account-va");
					var passwordVa = $(this).attr("password-va");
					var confirmVa = $(this).attr("confirm-va");
					var userVa = $(this).attr("user-va");
					var va = [ loginVa, passwordVa, confirmVa, userVa ];
					for (var i = 0; i < va.length; i++) {
						if (va[i] == "error") {
							return;
						}
					}  
					$.ajax({
						url : "${path}/user/addUser",
						type : "POST",
						data : $("#user_add_form").serialize(),
						success : function(result) {
							if (result.code == 100) {
								alert("添加成功");
								form_reset("#user_add_form");
							} else {
								 if(undefined!=result.extend.errorInfo.username){
										show_validate_msg("#username","error",result.extend.errorInfo.username)
									}
								 if(undefined!=result.extend.errorInfo.loginname){
										show_validate_msg("#password","error",result.extend.errorInfo.username)
									}
								 if(undefined!=result.extend.errorInfo.password){
										show_validate_msg("#account","error",result.extend.errorInfo.username)
									}
							}
						}
					});
				});
			$("#user_add_reset").click(function(){
				form_reset("#user_add_form");
			});
			function form_reset(ele){
				$(ele)[0].reset();
				$(ele).find("*").removeClass(
						"has-error has-success");
				$(ele).find("span").text("");
			}
	</script>
</body>
</html>