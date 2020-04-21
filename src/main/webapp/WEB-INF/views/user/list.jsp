<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
</head>
<body>
	<!-- 修改 模态框  start-->
	<div class="modal fade" id="editUserModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="user_add_form">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户账号</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="loginname"
									placeholder="输入用户账号" id="account" readonly="readonly">
							</div>
							<span class="col-sm-12"
								style="line-height: 32px; font-size: 16px;"></span>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">用户密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" name="password"
									placeholder="输入用户密码" id="password" required="required">
							</div>
							<span class="col-sm-12"
								style="line-height: 32px; font-size: 16px;"></span>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" placeholder="确认用户密码"
									id="confirm_password" required="required">
							</div>
							<span class="col-sm-12"
								style="line-height: 32px; font-size: 16px;"></span>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="username"
									placeholder="输入用户名" id="username" required="required">
							</div>
							<span class="col-sm-12"
								style="line-height: 32px; font-size: 16px;"></span>
						</div>

						<div class="form-group">
							<div class="radio col-sm-offset-2">
								&nbsp;&nbsp; <label style="font-size: 12px; font-weight: bold">
									<input type="radio" name="status" id="optionsRadios1" value="1"
									checked>可用
								</label> &nbsp;&nbsp;&nbsp;&nbsp; <label
									style="font-size: 12px; font-weight: bold"> <input
									type="radio" name="status" value="0">不可用
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-6">
								<textarea class="form-control" rows="3" id="remark"
									name="remark"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="user_save_edit">更改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改 模态框  end-->

	<div class="container-fluid" id="user_list_page">
		<div class="row">
			<div class="col-md-12">
				<h3>用户列表</h3>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover" id="user_info_table">
					<thead>
						<tr>
							<th>序号</th>
							<th>用户名</th>
							<th>账号</th>
							<th>创建日期</th>
							<th>状态</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12" style="text-align: center;">
				<nav aria-label="Page navigation" id="page_nav"></nav>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="col-md-12" style="text-align: center;">
					共<span id="total_page"></span>页,<span id="total_item"></span>条记录
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		var currentPage;
		$(function() {
			toPage(1);
		});
		function toPage(pageNum) {
			currentPage = pageNum;
			$.ajax({
				url : "${path}/user/list/" + pageNum,
				type : 'GET',
				success : function(result) {
					if (result == "unlogin") {
						window.location.href = "${path}/index.jsp";
						return;
					}
					//显示用户数据	
					show_user_totbody(result);
					//显示总页数及总记录数
					show_page_item(result);
					//分页导航
					show_page_nav(result);
				}
			});
		}
		/* 显示用户数据 */
		function show_user_totbody(result) {
			$("#user_info_table tbody").empty();
			var users = result.extend.pageInfo.list;
			$.each(users, function(index, item) {
				var uid = item.uid;
				var num = (result.extend.pageInfo.pageNum - 1)
						* result.extend.pageInfo.pageSize + index + 1;
				var uidTd = $("<td></td>").append(num);
				var loginTd = $("<td></td>").append(item.loginname);
				var nameTd = $("<td></td>").append(item.username);
				var dateTd = $("<td></td>").append(item.createDate);
				var status = item.status == 1 ? "可用" : "不可用";
				var statusTd = $("<td></td>").append(status);
				var remarkTd = $("<td></td>").append(item.remark);
				var editBtn = $("<button></button>").addClass(
						"btn btn-primary btn-xs").append("<span></span>")
						.addClass("glyphicon glyphicon-pencil").append("编辑")
						.attr("id", "user_edit_btn").attr("edit-id", uid);
				var delBtn = $("<button></button>").addClass(
						"btn btn-danger btn-xs delBtn").append("<span></span>")
						.addClass("glyphicon glyphicon-trash").append("删除")
						.css("margin-left", "10px").attr("del-id", uid).attr(
								"id", "del_user_btn");
				var btnTd = $("<td></td>").append(editBtn).append(delBtn);
				$("<tr></tr>").append(uidTd).append(nameTd).append(loginTd)
						.append(dateTd).append(statusTd).append(remarkTd)
						.append(btnTd).appendTo("#user_info_table tbody")
			});
		}
		/* 显示总页数及总记录数 */
		function show_page_item(result) {
			$("#total_page").empty();
			$("#total_item").empty();
			var pageInfo = result.extend.pageInfo;
			$("#total_page").append(pageInfo.pages).css({
				"color" : "blue",
				"font-size" : "20px",
				"font-weight" : "bold"
			});
			$("#total_item").append(pageInfo.total).css({
				"color" : "blue",
				"font-size" : "20px",
				"font-weight" : "bold"
			});
		}
		/* 分页导航 */
		function show_page_nav(result) {
			$("#page_nav").empty();
			var pageInfo = result.extend.pageInfo;
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPage = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			ul.append(firstPage);
			firstPage.click(function() {
				if (pageInfo.isFirstPage) {
					return;
				}
				toPage(1);
			});
			if (!pageInfo.isFirstPage) {
				var prePage = $("<li></li>").append(
						$("<a></a>").append(
								$("<span></span>").append("&laquo;")).attr(
								"href", "#"));
				ul.append(prePage);
				prePage.click(function() {
					toPage(pageInfo.pageNum - 1);
				});
			}

			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var page = $("<li></li>").append(
						$("<a></a>").append(item).attr("href", "#"));
				ul.append(page);
				page.click(function() {
					toPage(item);
				});
				if (pageInfo.pageNum == item) {
					page.addClass("active");
				}
			});

			if (!pageInfo.isLastPage) {

				var nextPage = $("<li></li>").append(
						$("<a></a>").append(
								$("<span></span>").append("&raquo;")).attr(
								"href", "#"));
				ul.append(nextPage);
				nextPage.click(function() {
					toPage(pageInfo.pageNum + 1);
				});
			}
			var lastPage = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			ul.append(lastPage);
			lastPage.click(function() {
				if (pageInfo.isLastPage) {
					return;
				}
				toPage(pageInfo.pages);
			});
			$("#page_nav").append(ul);
		}

		/* 用户修改 */
		$(document).on(
				"click",
				"#user_edit_btn",
				function() {
					form_reset("#editUserModal form");
					var id = $(this).attr("edit-id");
					$("#user_save_edit").attr("edit-id", id);
					$("#editUserModal").modal("show");
					//加载用户数据
					$.ajax({
						url : "${path}/user/getUserById/" + id,
						type : "GET",
						success : function(result) {
							var user = result.extend.user;
							$("#account").val(user.loginname);
							$("#password").val(user.password);
							$("#confirm_password").val(user.password);
							$("#username").val(user.username);
							$(
									":radio[name='status'][value='"
											+ user.status + "']").prop(
									"checked", "checked");
							$("#remark").val(user.remark);
						}
					});
				});

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

		/* 保存修改 */
		$("#user_save_edit")
				.click(
						function() {
							var id = $(this).attr("edit-id");
							$
									.ajax({
										url : "${path}/user/edit/" + id,
										type : "PUT",
										data : $("#editUserModal form")
												.serialize(),
										success : function(result) {
											if (result == "unlogin") {
												window.location.href = "${path}/index.jsp";
												return;
											}
											if (result.code == 100) {
												$("#editUserModal").modal(
														"hide");
												toPage(currentPage);
											} else {
												if (undefined != result.extend.errorInfo.username) {
													show_validate_msg(
															"#username",
															"error",
															result.extend.errorInfo.username)
												}
												if (undefined != result.extend.errorInfo.loginname) {
													show_validate_msg(
															"#password",
															"error",
															result.extend.errorInfo.username)
												}
												if (undefined != result.extend.errorInfo.password) {
													show_validate_msg(
															"#account",
															"error",
															result.extend.errorInfo.username)
												}
											}
										}
									});

						});

		/* 用户删除 */
		$(document).on("click", "#del_user_btn", function() {
			var uid = $(this).attr("del-id");
			var uname = $(this).parents("tr").find("td:eq(1)").text();
			if (!confirm("确认删除【" + uname + "】吗？")) {
				return;
			}
			$.ajax({
				url : "${path}/user/delUser/" + uid,
				type : "DELETE",
				success : function(result) {
					if (result == "unlogin") {
						window.location.href = "${path}/index.jsp";
						return;
					}
					if (result.code == 100) {
						toPage(currentPage);
						alert("处理成功");
					}
				}
			});
		});

		function form_reset(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find("span").text("");
		}
	</script>
</body>
</html>