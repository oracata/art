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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>文件上传</h3>
			</div>
		</div>
		<hr>

		<form class="form-horizontal" id="document_add_form">
			<input type="hidden" name="uid" value="${user.uid }">
			<div class="form-group">
				<label class="col-sm-2 control-label">文件标题</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="title"
						placeholder="输入文件标题" id="title">
				</div>
				<span class="col-md-4" style="line-height: 32px; font-size: 16px;"></span>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">文件描述</label>
				<div class="col-sm-4">
					<textarea class="form-control" rows="3" id="description"
						name="description"></textarea>
				</div>
				<span class="col-md-4" style="line-height: 32px; font-size: 16px;"></span>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">选择文件</label>
				<div class="col-sm-4" style="overflow: hidden;">
					<input type="file" name="file" id="file">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">备注</label>
				<div class="col-sm-4">
					<textarea class="form-control" rows="3" id="remark" name="remark"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6" style="text-align: right;">
					<button type="button" class="btn btn-default  col-sm-offset-4"
						id="document_add">添加</button>
					<button type="button" class="btn btn-default"
						id="document_add_reset">重置</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		/* 点击添加按钮 */
		$("#document_add").click(function() {
			$("#document_add_form").ajaxSubmit({
				type: "POST",
				url:"${path}/document/add",
				dataType: "json",
			    success: function(result){
			    	if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
			    	if(result.code==100){
			    		$("#document_add_form")[0].reset();
			    		alert("上传成功");
			    	}
				}
			});
		}); 
		/* 点击重置按钮 */
		$("#document_add_reset").click(function() {
			alert(1);
		});
	</script>
</body>
</html>