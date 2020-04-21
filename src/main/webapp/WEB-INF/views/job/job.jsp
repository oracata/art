<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门管理</title>
</head>
<body>
	
	<!-- 修改 模态框  start-->
	<div class="modal fade" id="editJobModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改职位</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="job_add_form">
						<div class="form-group">
							<label class="col-sm-2 control-label">职位名称</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="jname"
									placeholder="输入职位名称" id="jname">
							</div>
							<span class="col-sm-12"
								style="line-height: 32px; font-size: 16px;"></span>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-6">
								<textarea class="form-control" rows="3" id="jremark" name="jremark"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="job_save_edit">更改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改 模态框  end-->

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>职位管理</h3>
			</div>
		</div>
		<hr>
		<ul id="jobTab" class="nav nav-tabs">
			<li class="active" id="nav_job_info"><a href="#job_info" data-toggle="tab">
					职位信息 </a></li>
			<li id="nav_job_add"><a href="#job_add" data-toggle="tab">职位添加</a></li>
		</ul>
		<br>
		<div id="jobtTab" class="tab-content">
			<!-- 职位信息:start -->
			<div class="tab-pane fade in active" id="job_info">
				<div class="col-md-12">
					<table class="table table-hover" id="job_info_table">
						<thead>
							<tr>
								<th>序号</th>
								<th>职位名称</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
			<!-- 职位信息:end -->
			<!-- 增加职位：start -->
			<div class="tab-pane fade" id="job_add">
				<form class="form-horizontal" id="job_add_form">
					<div class="form-group">
						<label class="col-sm-1 control-label">职位名称</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="jname"
								placeholder="输入职位名称" id="jname" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label">备注</label>
						<div class="col-sm-4">
							<textarea class="form-control" rows="3" id="jremark" name="jremark"></textarea>
						</div>
					</div>

					<div class="form-group col-sm-5" style="text-align: right;">
						<button type="button" class="btn btn-default  col-sm-offset-3"
							id="job_add_btn">添加</button>
						&nbsp;&nbsp;
						<button type="reset" class="btn btn-default">重置</button>
					</div>
				</form>
			</div>
			<!-- 增加职位：end -->
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
			getAllJobs();
		});
		/* 部门显示 */
		function getAllJobs(){
			$.ajax({
				url:"${path }/job/list",
				type:"GET",
				success:function(result){
					show_jobs_tobody(result);
				}
			});
		}
		/* 解析数据 */
		function show_jobs_tobody(result){
			$("#job_info_table  tbody").empty();
			var jobs=result.extend.jobs;
			$.each(jobs,function(index,item){
				var jid=item.jid;
				var num=$("<td></td>").append(index);
				var nameTd=$("<td></td>").append(item.jname);
				var remarkTd=$("<td></td>").append(item.jremark);
				var editBtn = $("<button></button>").addClass(
				"btn btn-primary btn-xs").append("<span></span>")
				.addClass("glyphicon glyphicon-pencil").append("编辑")
				.attr("id", "job_edit_btn").attr("edit-id", jid);
				var delBtn = $("<button></button>").addClass(
				"btn btn-danger btn-xs delBtn").append("<span></span>")
				.addClass("glyphicon glyphicon-trash").append("删除")
				.css("margin-left", "10px").attr("del-id", jid).attr(
						"id", "del_job_btn");
				var editTD=$("<td></td>").append(editBtn).append(delBtn);
				$("<tr></tr>").append(num).append(nameTd).append(remarkTd).append(editTD)
				.appendTo("#job_info_table  tbody");
			});
		}
		/* 点击添加按钮 */
		$("#job_add_btn").click(function(){
			if($("#job_add #jname").val()==""){
				alert("请输入部门名称");
				return;
			}
			$.ajax({
				url:"${path }/job/add",
				data:$("#job_add #job_add_form").serialize(),
				type:"POST",
				success:function(result){
					if(result.code==100){
						$("#job_add_form")[0].reset();
						getAllJobs();
						$("#nav_job_info").addClass("active");
						$("#job_info").addClass("active in");
						$("#nav_job_add").removeClass("active");
						$("#job_add").removeClass("active in");
					}
				}
			});
		});
		/* 点击删除按钮 */
		$(document).on("click","#del_job_btn",function(){
			var id=$(this).attr("del-id");
			var name=$(this).parents("tr").find("td:eq(1)").text();
			if(!confirm("确认删除【"+name+"】吗?")){
				return;
			}
			$.ajax({
				url:"${path }/job/delete/"+id,
				type:"DELETE",
				success:function(result){
					if(result.code==100){
						getAllJobs();
						alert("处理成功");
					}
				}
			});
		});
		/* 点击编辑按钮 */
		$(document).on("click","#job_edit_btn",function(){	
			$("#editJobModal form")[0].reset();
			$("#editJobModal").modal("show");
			var id=$(this).attr("edit-id");
			$("#job_save_edit").attr("jid",id);
			//加载编辑信息
			$.ajax({
					url:"${path }/job/getById/"+id,
					type:"GET",
					success:function(result){
						if(result.code==100){
							var job=result.extend.job;
							$("#editJobModal #jname").val(job.jname);
							$("#editJobModal #jremark").val(job.jremark);
						}
					}
			});
		});
		
		/* 保存新增 */
		$("#job_save_edit").click(function(){
			var id=$(this).attr("jid");
			$.ajax({
				url:"${path }/job/edit/"+id,
				data:$("#editJobModal form").serialize(),
				type:"PUT",
				success:function(result){
					if(result.code==100){
						$("#editJobModal").modal("hide");
						getAllJobs();
					}
				}
			});
		})
	</script>
</body>
</html>