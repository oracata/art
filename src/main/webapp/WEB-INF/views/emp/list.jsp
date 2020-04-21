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

	<!-- 查询条件模态框:start -->
	<div class="modal fade" id="queryEmpModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工查询</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="emp_query_condition">
						<div class="form-group">
							<label class="col-sm-3 control-label">姓名</label>
							<div class="col-sm-6">
								<input type="text" name="ename" class="form-control" placeholder="输入姓名">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">身份证号码</label>
							<div class="col-sm-6">
								<input type="text" name="cardId" class="form-control" placeholder="输入身份证号码">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">性别</label>
							<div class="radio col-sm-6">
								<label style="font-weight: bold"> <input type="radio"
									name="sex"  value="1">男
								</label> <label style="font-weight: bold"> <input type="radio"
									name="sex" value="0">女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">部门</label>
							<div class="col-sm-6">
								<select class="form-control" id="dept_query_select" name="did">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">职位</label>
							<div class="col-sm-6">
								<select class="form-control" id="job_query_select" name="jid">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_query_byCondition">查询</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 查询条件模态框:end -->

	<!-- 修改模态框:start -->
		<div class="modal fade bs-example-modal-lg" id="empEditModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		     <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工信息修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="emp-edit-form">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-3">
								<input type="text" name="ename" id="ename" class="form-control" placeholder="输入员工姓名">
							</div>
							<label class="col-sm-2 control-label">身份证</label>
							<div class="col-sm-3">
								<input type="text" name="cardId" id="cardId" class="form-control" placeholder="输入员工身份证号码">
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
								<select class="form-control" id="dept_edit_select" name="did">
								</select>
							</div>
							<label class="col-sm-2 control-label">职位</label>
							<div class="col-sm-3">
								<select class="form-control" id="job_edit_select" name="jid">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">学历</label>
							<div class="col-sm-3">
								<input type="text" name="education" id="education" class="form-control" placeholder="学历">
							</div>
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-3">
								<input type="text" name="email" id="email" class="form-control" placeholder="请输入员工邮箱">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机</label>
							<div class="col-sm-3">
								<input type="text" name="tel" id="tel" class="form-control" placeholder="请输入员工手机号码">
							</div>
							<label class="col-sm-2 control-label">电话</label>
							<div class="col-sm-3">
								<input type="text" name="phone" id="phone" class="form-control" placeholder="请输入员工电话">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">政治面貌</label>
							<div class="col-sm-3">
								<input type="text" name="party" id="party" class="form-control" placeholder="请输入员工政治面貌">
							</div>
							<label class="col-sm-2 control-label">QQ号码</label>
							<div class="col-sm-3">
								<input type="text" name="qqNum" id="qqNum" class="form-control" placeholder="请输入员工QQ号码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-3">
								<input type="text" name="address" id="address" class="form-control" placeholder="请输入员工联系地址">
							</div>
							<label class="col-sm-2 control-label">邮政编码</label>
							<div class="col-sm-3">
								<input type="text" name="postCode" id="postCode" class="form-control" placeholder="请输入员工邮政编码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">出生日期</label>
							<div class="col-sm-3">
								<input type="text" id="birthday" name="birthday" style="height: 34px;border-radius: 4px;overflow: hidden;">
							</div>
							<label class="col-sm-2 control-label">民族</label>
							<div class="col-sm-3">
								<input type="text" name="race" id="race" class="form-control" placeholder="请输入员工民族">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">专业</label>
							<div class="col-sm-3">
								<input type="text" name="speciality" id="speciality" class="form-control" placeholder="请输入员工专业">
							</div>
							<label class="col-sm-2 control-label">爱好</label>
							<div class="col-sm-3">
								<input type="text" name="hobby" id="hobby" class="form-control" placeholder="请输入员工爱好">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea class="form-control" name="remark" id="remark" rows="3" id="remark" name="remark"></textarea>
							</div>
						</div>
						<br>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_save_edit">修改</button>
				</div>
		    </div>
		  </div>
		</div>
	<!-- 修改模态框:end -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>员工查询管理</h3>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-12">
				<button type="button" class="btn btn-primary" id="emp-query">
					<span class="glyphicon glyphicon-search"></span>查询条件
				</button>
				<button type="button" class="btn btn-danger" id="emp-batch-del">
					<span class="glyphicon glyphicon-trash"></span>批量删除
				</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-12">
				<table class="table table-hover" id="emp_info_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>姓名</th>
							<th>性别</th>
							<th>手机号码</th>
							<th>邮箱</th>
							<th>职位</th>
							<th>学历</th>
							<th>身份证号码</th>
							<th>部门</th>
							<th>联系地址</th>
							<th>建档日期</th>
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
			 $( "#birthday").datepicker({
				 showOtherMonths: true,
	              selectOtherMonths: true,
	              showButtonPanel: true,
	              showOn: "both",
	              buttonImageOnly: true,
	              buttonText: "",
	              changeMonth: true,
	              changeYear: true
			 })
			toPage(1);
		});
		/* 处理分页 */
		function toPage(pageNum) {
			currentPage = pageNum;
			$.ajax({
				url : "${path}/emp/list/" + pageNum,
				type : 'GET',
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
			$("#emp_info_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps, function(index, item) {
				var eid = item.eid;
				var checkBoxTd = $("<td></td>").append(
						$("<input></input>").attr("type", "checkbox").addClass(
								"check_item").attr("checked-id",eid));
				var enameTd = $("<td></td>").append(item.ename);
				var gender = item.sex == 1 ? "男" : "女";
				var sexTd = $("<td></td>").append(gender);
				var phoneTd = $("<td></td>").append(item.tel);
				var emailTd = $("<td></td>").append(item.email);
				var jobTd = $("<td></td>").append(item.job.jname);
				var educationTd = $("<td></td>").append(item.education);
				var cardIdTd = $("<td></td>").append(item.cardId);
				var deptTd = $("<td></td>").append(item.dept.dname);
				var addressTd = $("<td></td>").append(item.address);
				var createDateTd = $("<td></td>").append(item.createDate);
				var editBtn = $("<button></button>").addClass(
						"btn btn-primary btn-xs").append("<span></span>")
						.addClass("glyphicon glyphicon-pencil").append("编辑")
						.attr("id", "emp_edit_btn").attr("edit-id", eid);
				var delBtn = $("<button></button>").addClass(
						"btn btn-danger btn-xs delBtn").append("<span></span>")
						.addClass("glyphicon glyphicon-trash").append("删除")
						.css("margin-left", "10px").attr("del-id", eid).attr(
								"id", "emp_del_btn");
				var btnTd = $("<td></td>").append(editBtn).append(delBtn);
				$("<tr></tr>").append(checkBoxTd).append(enameTd).append(sexTd)
						.append(phoneTd).append(emailTd).append(jobTd).append(
								educationTd).append(cardIdTd).append(deptTd)
						.append(addressTd).append(createDateTd).append(btnTd)
						.appendTo("#emp_info_table tbody");
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
		
		/* 单个删除 */
		$(document).on("click","#emp_del_btn",function(){
			var eid=$(this).attr("del-id");
			var empname=$(this).parents("tr").find("td:eq(1)").text();
			if(!confirm("确认删除【"+empname+"】吗？")){
				return;
			}
			$.ajax({
				url:"${path}/emp/delete/"+eid,
				type:"DELETE",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					if(result.code==100){
						toPage(currentPage);
						alert("处理成功");
					}
				}
			});
		});
		/* 点击查询按钮 */
		$("#emp-query").click(function() {
			$("#queryEmpModal").modal("show");
			$("#emp_query_condition")[0].reset();
			load_dept_job("#queryEmpModal #dept_query_select","#queryEmpModal #job_query_select");
		});
		/* 加载部门信息 */
		function load_dept_job(deptId,jobId){
			 $(deptId).empty();
			 $(jobId).empty(); 
			//加载部门信息
			$.ajax({
				url:"${path}/dept/list",
				type:"GET",
				success:function(result){
					var depts=result.extend.depts;
					$(deptId).append("<option value='' disabled selected style='display:none;'>请选择部门</option>");
					$.each(depts,function(index,item){
						$(deptId).append($("<option></option>").attr("value",item.did).text(item.dname));
					});
				}
			});
			
			//加载职位信息
			$.ajax({
				url:"${path}/job/list",
				type:"GET",
				success:function(result){
					var jobs=result.extend.jobs;
					$(jobId).append("<option value='' disabled selected style='display:none;'>请选择职位</option>");
					$.each(jobs,function(index,item){
						$(jobId).append($("<option></option>").attr("value",item.jid).text(item.jname));
					}); 
				}
			});
		}
		
		/* 点击查询按钮 */
		$("#emp_query_byCondition").click(function(){
			$.ajax({
				url:"${path}/emp/getByCondition",
				type:"GET",
				data:$("#queryEmpModal form").serialize(),
				success:function(result){
					if (result == "unlogin") {
						window.location.href = "${path}/index.jsp";
						return;
					}
					if(result.code==100){
						//显示员工数据	
						show_user_totbody(result);
						//显示总页数及总记录数
						show_page_item(result);
						//分页导航
						show_page_nav(result);
					}else{
						alert("处理失败");
					}
				}
			});
			
			$("#queryEmpModal").modal("hide");
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
		$("#emp-batch-del").click(function() {
			var empName="";
			var ids="";
			$.each($(".check_item:checked"),function(index,item){
				ids+=$(this).attr("checked-id")+",";
				empName+=$(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			empName=empName.substring(0,empName.length-1);
			ids=ids.substring(0,ids.length-1);
			if(!confirm("确认删除【"+empName+"】吗？")){
				return;
			}
			$.ajax({
				url:"${path}/emp/batchDelete/"+ids,
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
		
		/* 点击修改按钮 */
		$(document).on("click","#emp_edit_btn",function(){
			load_dept_job("#empEditModal #dept_edit_select","#empEditModal #job_edit_select");
			$("#empEditModal").modal("show");
			var id=$(this).attr("edit-id");
			$("#emp_save_edit").attr("edit-id",id);
			$.ajax({
				url:"${path}/emp/getById/"+id,
				type:"GET",
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					var emp=result.extend.emp;
					$("#empEditModal #emp-edit-form")[0].reset();
					$("#ename").val(emp.ename);
					$("#cardId").val(emp.cardId);
					$(":radio[name='sex'][value='" + emp.sex + "']").prop("checked", "checked");
					$("#dept_edit_select").val(emp.did);
					$("#job_edit_select").val(emp.jid);
					$("#education").val(emp.education);
					$("#email").val(emp.email);
					$("#tel").val(emp.tel);
					$("#phone").val(emp.phone);
					$("#party").val(emp.party);
					$("#qqNum").val(emp.qqNum);
					$("#address").val(emp.address);
					$("#postCode").val(emp.postCode);
					$("#birthday").val(emp.birthday);
					$("#race").val(emp.race);
					$("#speciality").val(emp.speciality);
					$("#hobby").val(emp.hobby);
					$("#remark").val(emp.remark);
				}
			});			
		})
		/* 点击修改按钮 */
		$("#emp_save_edit").click(function(){
			var editId=$(this).attr("edit-id");
			$.ajax({
				url:"${path}/emp/edit/"+editId,
				type:"PUT",
				data:$("#empEditModal #emp-edit-form").serialize(),
				success:function(result){
					if(result=="unlogin"){
						window.location.href="${path}/index.jsp";
						return;
					}
					if(result.code==100){
						toPage(currentPage);
						$("#empEditModal").modal("hide");
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
	</script>
</body>
</html>