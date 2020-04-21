<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告管理</title>
</head>
<body>
	<!-- 新增模态框:start -->
			<div class="modal fade" id="addNoticeModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增公告</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="notice_add_form">
					<input type="hidden" name="uid" value="${user.uid }">
						<div class="form-group">
							<label class="col-sm-2 control-label">公告标题</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="title"
									placeholder="输入公告标题" id="title">
							</div>
							<span class="col-sm-12"
								style="line-height: 32px; font-size: 16px;"></span>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">公告内容</label>
							<div class="col-sm-6">
								<textarea id="content" name="content" class="form-control" rows="3" ></textarea>
							</div>
							<span class="col-sm-12"
								style="line-height: 32px; font-size: 16px;"></span>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">是否发布</label>
							<div class="radio">
								&nbsp;&nbsp;
								<label style="font-size: 12px;font-weight: bold"> <input type="radio" name="status"
									id="optionsRadios1" value="1">发布
								</label>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<label style="font-size: 12px;font-weight: bold"> 
									<input type="radio" name="status" value="0" checked>不发布 
								</label>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-6">
								<textarea id="remark" name="remark" class="form-control" rows="3"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="notice_save_edit">保存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 新增模态框:end -->

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>公告管理</h3>
			</div>
		</div>
		<hr>
		<div class="row">
			<form class="form-inline" id="query-notice-form">
				<input type="hidden" name="uid" value="${user.uid }">
				<div class="form-group">
					<label for="exampleInputName2">公告名称</label> <input type="text"
						class="form-control" name="title" id="title" placeholder="请输入公告名称">
				</div>
				<div class="form-group">
					<label>公告内容</label> <input type="text" class="form-control"
						id="content" name="content" placeholder="请输入公告内容">
				</div>
				<button type="button" class="btn btn-default" id="notice-query">查询</button>
				<button type="button" class="btn btn-default" id="notice_add_btn">新增</button>
				<button type="button" class="btn btn-default" id="notice-batch-del">批量删除</button>
			</form>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-12">
				<table class="table table-hover" id="notice_info_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>公告名称</th>
							<th>公告内容</th>
							<th>创建时间</th>
							<th>公告人</th>
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
		var currentPage,pages;
		$(function() {
			toPage(1);
		});

		function toPage(pageNum) {
			currentPage = pageNum;
			$.ajax({
				url : "${path}/notice/list/" + pageNum,
				type : 'GET',
				data : "uid=${user.uid}",
				success : function(result) {
					if (result == "unlogin") {
						window.location.href = "${path}/index.jsp";
						return;
					}
					//显示员工数据	
					show_user_totbody(result);
					//显示总页数及总记录数
					show_page_item(result);
					//分页导航
					show_page_nav(result);
				}
			});
		}
		/* 解析员工数据 */
		function show_user_totbody(result) {
			$("#notice_info_table tbody").empty();
			var notices = result.extend.pageInfo.list;
			$.each(notices, function(index, item) {
				var nid = item.nid;
				var checkBoxTd = $("<td></td>").append(
						$("<input></input>").attr("type", "checkbox").addClass(
								"check_item").attr("checked-id", nid));
				var titleTd = $("<td></td>").append(item.title);
				var contentTd = $("<td></td>").append(item.content);
				var createDateTd = $("<td></td>").append(item.createDate);
				var usernameTd = $("<td></td>").append(item.user.username);
				var editBtn = $("<button></button>").addClass(
						"btn btn-primary btn-xs").append("<span></span>")
						.addClass("glyphicon glyphicon-pencil").append("编辑")
						.attr("id", "notice_edit_btn").attr("edit-id", nid);
				var delBtn = $("<button></button>").addClass(
						"btn btn-danger btn-xs delBtn").append("<span></span>")
						.addClass("glyphicon glyphicon-trash").append("删除")
						.css("margin-left", "10px").attr("del-id", nid).attr(
								"id", "notice_del_btn");
				var status=item.status;
				var text=status==1?"收藏":"发布";
				var publishBtn = $("<button></button>").addClass(
						"btn btn-info btn-xs delBtn").append("<span></span>")
						.addClass("glyphicon glyphicon-star").append(text)
						.css("margin-left", "10px").attr("publish-id", nid).attr(
								"id", "notice_publish_btn").attr("status",status);
				var btnTd = $("<td></td>").append(editBtn).append(delBtn).append(publishBtn);
				$("<tr></tr>").append(checkBoxTd).append(titleTd).append(contentTd).append(createDateTd).append(usernameTd).append(btnTd)
				.appendTo("#notice_info_table tbody");
			});
		}

		/*显示总页数及总记录数  */
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
			pages=pageInfo.pages;
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
		/* 点击查询按钮 */
		$("#notice-query").click(function(){
			$.ajax({
				url:"${path}/notice/getNoticeByCondition",
				type:"GET",
				data:$("#query-notice-form").serialize(),
				success:function(result){
					if (result == "unlogin") {
						window.location.href = "${path}/index.jsp";
						return;
					}
					if(result.code==100){
						$("#query-notice-form")[0].reset();
						//显示员工数据	
						show_user_totbody(result);
						//显示总页数及总记录数
						show_page_item(result);
						//分页导航
						show_page_nav(result);
					}
				}
			});
		});
		
		/* 点击新增按钮 */
		$(document).on("click","#notice_add_btn",function(){
			$("#addNoticeModal #notice_add_form")[0].reset();
			$("#addNoticeModal").modal("show");
			$("#notice_save_edit").attr("_type","add");
		});
		$("#notice_add_btn").click(function(){
			$("#addNoticeModal #notice_add_form")[0].reset();
			$("#addNoticeModal").modal("show");
			$("#notice_save_edit").attr("_type","add");
		});
		/* 点击保存按钮 */
		$("#notice_save_edit").click(function(){
			var _type=$(this).attr("_type");			
			if(_type=="add"){
				$.ajax({
					url:"${path}/notice/add",
					type:"POST",
					data:$("#addNoticeModal #notice_add_form").serialize(),
					success:function(result){
						if(result=="unlogin"){
							window.location.href="${path}/index.jsp";
							return;
						}
						if (result.code == 100) {
							$("#addNoticeModal").modal("hide");
							toPage(pages);
						}
					}
					});
			}else if(_type=="edit"){
				var id=$(this).attr("edit-id");
				$.ajax({
					url:"${path}/notice/edit/"+id,
					type:"PUT",
					data:$("#addNoticeModal #notice_add_form").serialize(),
					success:function(result){
						if(result=="unlogin"){
							window.location.href="${path}/index.jsp";
							return;
						}
						if (result.code == 100) {
							$("#addNoticeModal").modal("hide");
							toPage(currentPage);
						}
					}
					});
			}
			
		});
		
		/* 点击编辑按钮 */
		$(document).on("click","#notice_edit_btn",function(){
			$("#notice_save_edit").attr("_type","edit");
			$("#addNoticeModal #notice_add_form")[0].reset();
			$("#addNoticeModal").modal("show");
			var id=$(this).attr("edit-id");
			$("#notice_save_edit").attr("edit-id",id);
			$.ajax({
				url:"${path}/notice/getById/"+id,
				type:"GET",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					if (result.code == 100) {
						var notice=result.extend.notice;
						$("#title").val(notice.title);
						$(":radio[name='status'][value='" + notice.status + "']").prop("checked", "checked");
						$("#notice_add_form #content").val(notice.content);
						$("#notice_add_form #remark").val(notice.remark);
					}
				}
			});
		});
		
		/* 点击删除按钮 */
		$(document).on("click","#notice_del_btn",function(){
			var id=$(this).attr("del-id");
			var nname=$(this).parents("tr").find("td:eq(1)").text();
			if(!confirm("确认删除公告【"+nname+"】吗？")){
				return;
			}
			$.ajax({
				url:"${path}/notice/delete/"+id,
				type:"DELETE",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					if (result.code == 100) {
						toPage(currentPage);
						alert("处理成功")
					}
				}
				});
		});
		
		/* 点击发布按钮 */
		$(document).on("click","#notice_publish_btn",function(){
			var id=$(this).attr("publish-id");
			var status=$(this).attr("status");
			var statusCode=status==1?0:1;
			var currentText=$(this).text();
			var afterPublicText=currentText=="发布"?"收藏":"发布";
			$.ajax({
				url:"${path}/notice/publish",
				type:"PUT",
				data:"status="+statusCode+"&nid="+id,
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					if (result.code == 100) {
						$("#notice_publish_btn").text(afterPublicText);
						toPage(currentPage);
					}
				}
				});
		});
		
		/*checkbox的单选多选*/
		$("#check_all").click(function() {
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
		/*checkbox的单选多选*/
		$(document).on("click",".check_item",function() {
				$("#check_all").prop("checked",$(".check_item:checked").length == $(".check_item").length);
		});
		/* 点击批量删除按钮 */
		$("#notice-batch-del").click(function() {
			var noticeName="";
			var ids="";
			$.each($(".check_item:checked"),function(index,item){
				ids+=$(this).attr("checked-id")+",";
				noticeName+=$(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			noticeName=noticeName.substring(0,noticeName.length-1);
			ids=ids.substring(0,ids.length-1);
			if(!confirm("确认删除【"+noticeName+"】吗？")){
				return;
			}
			$.ajax({
				url:"${path}/notice/batchDelete/"+ids,
				type:"DELETE",
				dataType: "JSON",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					if(result.code==100){
						toPage(currentPage);
						$("#check_all").attr("checked",false);
						alert("处理成功");
					}
					
				}
				
			})
		});
	</script>
</body>
</html>