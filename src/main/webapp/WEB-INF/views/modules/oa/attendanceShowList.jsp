<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>考勤查看</title>
	<meta name="decorator" content="default"/>
</head>
<body>
	<ul class="nav nav-tabs" id="updateTitle">
	    <li><a href="${ctx}/oa/attendance/list">考勤列表</a></li>
	    <li class="active"><a>考勤查看</a></li>
	</ul>
	<form:form id="attInsertListForm" modelAttribute="attendanceMonth_ShowList" target="mainFrame" action="${ctx}/oa/attendance/attendanceInsertList" method="post" class="breadcrumb form-search">
		<table id="attendanceTable" class="table table-striped table-bsordered table-condensed">
			<thead><tr><th style="width:25%">日期</th><th style="width:25%">星期</th><th style="width:25%">工作地点</th><th style="width:25%">考勤状态</th></thead>
			<tbody>
				<c:forEach items="${attendanceMonth_ShowList.attendanceStatus}" var="attendanceday" varStatus="status">
					<tr>
						<td>${attendanceMonth_ShowList.year}/${attendanceMonth_ShowList.month}/${attendanceday.date}</td>
						<td>${attendanceday.week}</td>
						<td>${attendanceday.location}</td>
						<td>${fns:getDictLabel(attendanceday.status,'oa_attendance_status','')}</td>
					</tr>
				</c:forEach>
				<tr>
					<td></td><td></td><td></td>
					<td><input class="btn btn-primary" type="button" name="goback" value="返回" onclick="location.href='${ctx}/oa/attendance/returnIndexPage'"/></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>