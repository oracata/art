<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录信息</title>
<style type="text/css">
body {
	position: absolute;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	background-size: 100% 100%;
	background-image: url(${path }/static/images/bgm07.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

#login_info_page {
	width: 96%;
	height: 90%;
	margin: 10px auto;
}

.t-notice {
	width: 100%;
	box-shadow: 10px 10px 5px #888;
	background: -ms-linear-gradient(top, #fff, #0000ff); /* IE 10 */
	background: -moz-linear-gradient(top, #b8c4cb, #f6f6f8); /*火狐*/
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#b8c4cb),
		to(#f6f6f8)); /* 谷歌 */
}

.t-file {
	margin-top: 50px;
	width: 100%;
	box-shadow: 10px 10px 5px #888;
	background: -ms-linear-gradient(top, #fff, #0000ff); /* IE 10 */
	background: -moz-linear-gradient(top, #b8c4cb, #f6f6f8); /*火狐*/
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#b8c4cb),
		to(#f6f6f8)); /* 谷歌 */
}
</style>
</head>
<body>
	<div id="login_info_page">
		<div class="t-notice">
			<table class="table" id="notice_info_table">
				<caption>公告</caption>
				<thead>
					<tr>
						<th>标题</th>
						<th>内容</th>
						<th>发布时间</th>
						<th>公告人</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div class="row">
				<div class="col-sm-12" style="text-align: center;">
					<nav aria-label="Page navigation" id="page_nav"></nav>
				</div>
			</div>
		</div>

		<div class="t-file">
			<table class="table" id="t-doc">
				<caption>文件</caption>
				<thead>
					<tr>
						<th>标题</th>
						<th>描述</th>
						<th>上传时间</th>
						<th>上传人</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<div class="row">
				<div class="col-sm-12" style="text-align: center;">
					<nav aria-label="Page navigation" id="page_nav"></nav>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : "${path}/notice/list/1",
				type : 'GET',
				data : "status=1",
				success : function(result) {
					//显示公告数据	
					show_user_totbody(result);
					//显示总页数及总记录数
					show_page_item(result);
				}
			});
			
			$.ajax({
				url : "${path}/document/list/1",
				type : 'GET',
				success : function(result) {
					if (result == "unlogin") {
						window.location.href = "${path}/index.jsp";
						return;
					}
					//显示文件数据	
					show_doc_totbody(result);
					//分页导航
					show_doc_nav(result);
				}
			});
		});
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
				var createDateTd = $("<td></td>").append(item.publishDate);
				var usernameTd = $("<td></td>").append(item.user.username);
				$("<tr></tr>").append(titleTd).append(contentTd).append(
						createDateTd).append(usernameTd).appendTo(
						"#notice_info_table tbody");
			});
		}
		
		function show_page_item(result){
			$(".t-file #page_nav").empty();
			var pageInfo = result.extend.pageInfo;
			pages=pageInfo.pages;
			var ul = $("<ul></ul>").addClass("pagination");
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var page = $("<li></li>").append(
						$("<a></a>").append(item).attr("href", "#"));
				ul.append(page);
				if (pageInfo.pageNum == item) {
					page.addClass("active");
				}
			});
			$(".t-file #page_nav").append(ul);
		}
		
		/* 文件显示*/
		function show_doc_totbody(result){
			$("#t-doc tbody").empty();
			var documents = result.extend.pageInfo.list;
			$.each(documents, function(index, item) {
				var did = item.did;
				var titleTd = $("<td></td>").append(item.title);
				var createDateTd = $("<td></td>").append(item.createDate);
				var descriptTd = $("<td></td>").append(item.description);
				var usernameTd = $("<td></td>").append(item.user.username);
				var downloadBtn = $("<button></button>").addClass(
						"btn btn-info btn-xs").append("<span></span>")
						.addClass("glyphicon glyphicon-download").append("下载")
						.attr("id", "document_download_btn").attr(
								"download-id", did).css("margin-left", "10px");
				var btnTd = $("<td></td>")
						.append(downloadBtn);
				$("<tr></tr>").append(titleTd).append(descriptTd).append(
						createDateTd).append(usernameTd)
						.append(btnTd).appendTo("#t-doc tbody")
			});
		}
		/* 文件分页 */
		function show_doc_nav(result){
			$(".t-notice #page_nav").empty();
			var pageInfo = result.extend.pageInfo;
			pages=pageInfo.pages;
			var ul = $("<ul></ul>").addClass("pagination");
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var page = $("<li></li>").append(
						$("<a></a>").append(item).attr("href", "#"));
				ul.append(page);
				if (pageInfo.pageNum == item) {
					page.addClass("active");
				}
			});
			$(".t-notice #page_nav").append(ul);
		}
		
		/* 点击下载按钮 */
		$(document).on("click", "#document_download_btn", function() {
			var id = $(this).attr("download-id");
			window.location.href = "${path}/document/download/" + id;
		});
	</script>
</body>
</html>