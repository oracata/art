<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工新增页面</title>
</head>
<body>
	<div class="container-fluid" id="user_list_page">
		<div class="row">
			<div class="col-md-12">
				<h3>员工添加</h3>
			</div>
		</div>
		<hr>
		<form class="form-horizontal" id="emp-add-form">
			<div class="form-group">
				<label class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-3">
					<input type="text" name="ename" class="form-control" placeholder="输入员工姓名">
				</div>
				<label class="col-sm-2 control-label">身份证</label>
				<div class="col-sm-3">
					<input type="text" name="cardId" class="form-control" placeholder="输入员工身份证号码">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">性别</label>
				<div class="radio col-sm-6">
					<label style="font-weight: bold"> <input type="radio"
						name="sex" value="1" checked>男
					</label> <label style="font-weight: bold"> <input type="radio"
						name="sex" value="0">女
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">部门</label>
				<div class="col-sm-3">
					<select class="form-control" id="emp_dept_select" name="did">
					</select>
				</div>
				<label class="col-sm-2 control-label">职位</label>
				<div class="col-sm-3">
					<select class="form-control" id="emp_job_select" name="jid">
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">学历</label>
				<div class="col-sm-3">
					<input type="text" name="education" class="form-control" placeholder="学历">
				</div>
				<label class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-3">
					<input type="text" name="email" class="form-control" placeholder="请输入员工邮箱">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">手机</label>
				<div class="col-sm-3">
					<input type="text" name="tel" class="form-control" placeholder="请输入员工手机号码">
				</div>
				<label class="col-sm-2 control-label">电话</label>
				<div class="col-sm-3">
					<input type="text" name="phone" class="form-control" placeholder="请输入员工电话">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">政治面貌</label>
				<div class="col-sm-3">
					<input type="text" name="party" class="form-control" placeholder="请输入员工政治面貌">
				</div>
				<label class="col-sm-2 control-label">QQ号码</label>
				<div class="col-sm-3">
					<input type="text" name="qqNum" class="form-control" placeholder="请输入员工QQ号码">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">联系地址</label>
				<div class="col-sm-3">
					<input type="text" name="address" class="form-control" placeholder="请输入员工联系地址">
				</div>
				<label class="col-sm-2 control-label">邮政编码</label>
				<div class="col-sm-3">
					<input type="text" name="postCode" class="form-control" placeholder="请输入员工邮政编码">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">出生日期</label>
				<div class="col-sm-3">
					<input type="text" id="birthday" name="birthday" style="height: 34px;border-radius: 4px;overflow: hidden;">
				</div>
				<label class="col-sm-2 control-label">民族</label>
				<div class="col-sm-3">
					<input type="text" name="race" class="form-control" placeholder="请输入员工民族">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">专业</label>
				<div class="col-sm-3">
					<input type="text" name="speciality" class="form-control" placeholder="请输入员工专业">
				</div>
				<label class="col-sm-2 control-label">爱好</label>
				<div class="col-sm-3">
					<input type="text" name="hobby" class="form-control" placeholder="请输入员工爱好">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">备注</label>
				<div class="col-sm-8">
					<textarea class="form-control" name="remark" rows="3" id="remark" name="remark"></textarea>
				</div>
			</div>
			<br>
			<div class="form-group">
					&nbsp;&nbsp;	&nbsp;&nbsp;	&nbsp;&nbsp;
				<button type="button" class="btn btn-default  col-md-offset-1"
					id="emp_add">添加</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-default" id="emp_add_reset">重置</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		$(function(){
			 $( "#birthday").datepicker({
				 showOtherMonths: true,
	              selectOtherMonths: true,
	              showButtonPanel: true,
	              showOn: "both",
	              buttonImageOnly: true,
	              buttonText: "",
	              changeMonth: true,
	              changeYear: true
			 });
			//重置表单
			$("#emp-add-form")[0].reset();
			//加载部门信息
			$.ajax({
				url:"${path}/dept/list",
				type:"GET",
				success:function(result){
					var depts=result.extend.depts;
					$("#emp_dept_select").append("<option value='' disabled selected style='display:none;'>请选择部门</option>");
					$.each(depts,function(index,item){
						$("#emp_dept_select").append($("<option></option>").attr("value",item.did).text(item.dname));
					});
				}
			});
			//加载职位信息
			$.ajax({
				url:"${path}/job/list",
				type:"GET",
				success:function(result){
					var jobs=result.extend.jobs;
					$("#emp_job_select").append("<option value='' disabled selected style='display:none;'>请选择职位</option>");
					$.each(jobs,function(index,item){
						$("#emp_job_select").append($("<option></option>").attr("value",item.jid).text(item.jname));
					});
				}
			});
		});
	
		/* 点击新增按钮 */
		 $("#emp_add").click(function(){
			 $.ajax({
				url:"${path}/emp/add",
				type:"POST",
				data:$("#emp-add-form").serialize(),
				success:function(result){
					 if(result=="unlogin"){
							window.location.href="${path}/index.jsp";
							return;
						}
					if(result.code==100){
						alert("新增成功");
						$("#emp-add-form")[0].reset();
					}else{
						var errors=result.extend.errorInfo;
						var message="";
						$.each(errors,function(index,item){
							message+=item+";"
						});
						message=message.substring(0,message.length-1);
						alert(message);
					}
				}
			});
		}); 
		/* 点击重置按钮 */
		$("#emp_add_reset").click(function(){
			if(result=="unlogin"){
				window.location.href="${path}/index.jsp";
				return;
			}
			$("#emp-add-form")[0].reset();
		}); 
	</script>
</body>
</html>