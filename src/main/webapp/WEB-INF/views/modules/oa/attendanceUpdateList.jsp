<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>考勤修改</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#attUpdateListForm").validate({
				submitHandler: function(form){
					loading('正在修改，请稍等...');
					form.submit();
				},
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs" id="updateTitle">
	    <li><a href="${ctx}/oa/attendance/list">考勤列表</a></li>
	    <li class="active"><a>考勤修改</a></li>
	</ul>
	<form:form id="attUpdateListForm" modelAttribute="attendanceMonth_UpdateList" target="mainFrame" action="${ctx}/oa/attendance/attendanceUpdateList" method="post" class="breadcrumb form-search">
		<table id="attendanceTable" class="table table-striped table-bsordered table-condensed">
			<thead><tr><th style="width:20%">日期</th><th style="width:20%">星期</th><th style="width:30%">工作地点</th><th style="width:30%">考勤状态</th></thead>
			<tbody>
				<c:forEach items="${attendanceMonth_UpdateList.attendanceStatus}" var="attendanceday" varStatus="status">
					<tr>
						<td>${attendanceMonth_UpdateList.year}/${attendanceMonth_UpdateList.month}/${attendanceday.date}</td>
						<td>${attendanceday.week}</td>
						<td><form:input path="${fns:getDefaultLocation(status.count)}" htmlEscape="false" maxlength="50" class="required" style="width:150px"/></td>
						<td>
							<form:select path="${fns:getDefaultStatus(status.count)}" class="input-medium">
								<form:options items="${fns:getDictList('oa_attendance_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td></td><td></td><td></td>
					<td><input class="btn btn-primary" type="button" name="goback" value="返回" onclick="location.href='${ctx}/oa/attendance/returnIndexPage'"/>
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="修改" onclick="success()" style="margin-left:50px"/></td>
				</tr>
			</tbody>
			<tr>
				<td><form:input path="name" htmlEscape="false" maxlength="50" class="required" style="width:150px;display:none"/></td>
				<td><form:input path="month" htmlEscape="false" maxlength="50" class="required" style="width:150px;display:none"/></td>
				<td><form:input path="year" htmlEscape="false" maxlength="50" class="required" style="width:150px;display:none"/></td>
				<td><form:input path="id" htmlEscape="false" maxlength="50" class="required" style="width:150px;display:none"/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>