<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 修改模态框：start -->
	<div class="modal fade" id="editDocumentModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
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
					<form class="form-horizontal" id="document_edit_form">
						<input type="hidden" name="uid" value="${user.uid }">
						<div class="form-group">
							<label class="col-sm-2 control-label">文件标题</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="title"
									placeholder="输入文件标题" id="title">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">文件描述</label>
							<div class="col-sm-8">
								<textarea class="form-control" rows="3" id="description"
									name="description"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea class="form-control" rows="3" id="remark"
									name="remark"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="document_save_edit">更改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改模态框：end -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>文件管理</h3>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover"
					id="document_info_table">
					<thead>
						<tr>
							<th>序号</th>
							<th>标题</th>
							<th>创建日期</th>
							<th>描述</th>
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
				url : "${path}/document/list/" + pageNum,
				data : "uid=${user.uid}",
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
			$("#document_info_table tbody").empty();
			var documents = result.extend.pageInfo.list;
			$.each(documents, function(index, item) {
				var did = item.did;
				var num = (result.extend.pageInfo.pageNum - 1)
						* result.extend.pageInfo.pageSize + index + 1;
				var numTd = $("<td></td>").append(num);
				var titleTd = $("<td></td>").append(item.title);
				var createDateTd = $("<td></td>").append(item.createDate);
				var descriptTd = $("<td></td>").append(item.description);
				var remarkTd = $("<td></td>").append(item.remark);
				var editBtn = $("<button></button>").addClass(
						"btn btn-primary btn-xs").append("<span></span>")
						.addClass("glyphicon glyphicon-pencil").append("编辑")
						.attr("id", "document_edit_btn").attr("edit-id", did);
				var delBtn = $("<button></button>").addClass(
						"btn btn-danger btn-xs delBtn").append("<span></span>")
						.addClass("glyphicon glyphicon-trash").append("删除")
						.css("margin-left", "10px").attr("del-id", did).attr(
								"id", "document_del_btn");
				var downloadBtn = $("<button></button>").addClass(
						"btn btn-info btn-xs").append("<span></span>")
						.addClass("glyphicon glyphicon-download").append("下载")
						.attr("id", "document_download_btn").attr(
								"download-id", did).css("margin-left", "10px");
				var btnTd = $("<td></td>").append(editBtn).append(delBtn)
						.append(downloadBtn);
				$("<tr></tr>").append(numTd).append(titleTd).append(
						createDateTd).append(descriptTd).append(remarkTd)
						.append(btnTd).appendTo("#document_info_table tbody")
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

		/* 点击编辑按钮 */
		$(document).on(
				"click",
				"#document_edit_btn",
				function() {
					var id = $(this).attr("edit-id");
					$("#editDocumentModal #document_save_edit").attr("edit-id",
							id);
					$("#document_edit_form")[0].reset();
					$("#editDocumentModal").modal("show");
					$.ajax({
						url : "${path}/document/getById/" + id,
						type : 'GET',
						success : function(result) {
							if (result == "unlogin") {
								window.location.href = "${path}/index.jsp";
								return;
							}
							if (result.code == 100) {
								var document = result.extend.document;
								$("#document_edit_form #title").val(
										document.title);
								$("#document_edit_form #description").val(
										document.description);
								$("#document_edit_form #remark").val(
										document.remark);
							}
						}
					})
				});
		/* 点击更改按钮 */
		$("#document_save_edit").click(function() {
			var id = $(this).attr("edit-id");
			$.ajax({
				url : "${path}/document/edit/" + id,
				type : 'PUT',
				data : $("#document_edit_form").serialize(),
				success : function(result) {
					if (result == "unlogin") {
						window.location.href = "${path}/index.jsp";
						return;
					}
					if (result.code == 100) {
						$("#editDocumentModal").modal("hide");
						toPage(currentPage);
					} else {
						alert("处理失败");
					}
				}
			});
		});

		/* 点击删除按钮 */
		$(document).on("click", "#document_del_btn", function() {
			var id = $(this).attr("del-id");
			var name = $(this).parents("tr").find("td:eq(1)").text();
			if (!confirm("确认删除【" + name + "】吗？")) {
				return;
			}
			$.ajax({
				url : "${path}/document/delete/" + id,
				type : 'DELETE',
				success : function(result) {
					if (result == "unlogin") {
						window.location.href = "${path}/index.jsp";
						return;
					}
					if (result.code == 100) {
						alert("处理成功");
						toPage(currentPage);
					} else {
						alert("处理失败");
					}
				}
			});
		});

		/* 点击下载按钮 */
		$(document).on("click", "#document_download_btn", function() {
			var id = $(this).attr("download-id");
			window.location.href = "${path}/document/download/" + id;
		});
	</script>
</body>
</html>