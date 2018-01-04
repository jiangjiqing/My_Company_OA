<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>报销费用综合申报表查看</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/fa/reimburse/list">费用报销列表</a></li>
    <li class="active"><a href="${ctx}/fa/reimburse/formList">报销费用综合申报表查看</a></li>
</ul>
<%--<form:form id="searchForm" action="${ctx}/fa/reimburse/list" class="breadcrumb form-search">--%>
<%--</form:form>--%>
<%--<sys:message content="${message}"/>--%>

<table id="contentTable4" class="table table-striped table-bordered table-condensed">
    <tr>
        <td><strong>部门</strong></td>
        <td>${reimburseMain.user.office.name}</td>
        <td><strong>申请人</strong></td>
        <td>${reimburseMain.user.name}</td>
        <td><strong>申请日期</strong></td>
        <td><fmt:formatDate value="${reimburseMain.applyDate}" type="both" pattern="yyyy-MM-dd"/></td>
        <td><strong>申报日期</strong></td>
        <td><fmt:formatDate value="${reimburseMain.beginDate}" type="both" pattern="yyyy-MM-dd"/></td>
        <td><strong>至</strong></td>
        <td><fmt:formatDate value="${reimburseMain.endDate}" type="both" pattern="yyyy-MM-dd"/></td>
    </tr>
</table>

<table id="contentTable" class="table table-striped table-bordered table-condensed">

    <thead>
    <tr>
        <th>日期</th>
        <th>项目编号</th>
        <th>项目名称</th>
        <th>摘要（内容、事由）</th>
        <th>金额</th>
    </tr>
    </thead>
    <tbody>
    <%--<c:forEach items="${page.list}" var="reimburseMain">--%>
        <tr>
            <td><fmt:formatDate value="${reimburseMain.applyDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td>${fns:abbr(reimburseMain.user.office.name,30)} </td>
            <td><fmt:formatDate value="${reimburseMain.beginDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td>${fns:abbr(reimburseMain.totalAmount,30)}</td>
            <td>${fns:getDictLabel(reimburseMain.status,'fa_reimburseMain_status','')}</td>
        </tr>
    <%--</c:forEach>--%>
    </tbody>
</table>

<table id="contentTable1" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>日期</th>
        <th>项目编号</th>
        <th>项目名称</th>
        <th>摘要（内容、事由）</th>
        <th>时间</th>
        <th>出发地点</th>
        <th>到达地点</th>
        <th>金额</th>
    </tr>
    </thead>
    <tbody>
    <%--<c:forEach items="${page.list}" var="reimburseMain">--%>
        <tr>
            <td><fmt:formatDate value="${reimburseMain.applyDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td>${fns:abbr(reimburseMain.user.office.name,30)} </td>
            <td><fmt:formatDate value="${reimburseMain.beginDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatDate value="${reimburseMain.endDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td>${fns:abbr(reimburseMain.totalAmount,30)}</td>
            <td>${fns:getDictLabel(reimburseMain.status,'fa_reimburseMain_status','')}</td>
            <td>${fns:getDictLabel(reimburseMain.status,'fa_reimburseMain_status','')}</td>
            <td>${fns:getDictLabel(reimburseMain.status,'fa_reimburseMain_status','')}</td>
        </tr>
    <%--</c:forEach>--%>
    </tbody>
</table>

<table id="contentTable1" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>日期</th>
        <th>项目编号</th>
        <th>项目名称</th>
        <th>摘要（内容、事由）</th>
        <th>受邀人员姓名</th>
        <th>受邀人员职务</th>
        <th>人数</th>
        <th>金额</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${reimburseHospitalityPage.list}" var="reimburseHospitality">
        <tr>
            <td><fmt:formatDate value="${reimburseHospitality.createDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td>${reimburseHospitality.project.itemNo}</td>
            <td>${reimburseHospitality.project.name}</td>
            <td></td>
            <td>${reimburseHospitality.inviteesName}</td>
            <td>${reimburseHospitality.invitedPosition}</td>
            <td>${reimburseHospitality.number}</td>
            <td>${reimburseHospitality.amount}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>长途交通费</th>
        <th>出租车费</th>
        <th>招待费</th>
        <th>其他</th>
        <th>合计</th>
    </tr>
    </thead>
    <tbody>
    <%--<c:forEach items="${page.list}" var="reimburseMain">--%>
        <tr>
            <td><fmt:formatDate value="${reimburseMain.applyDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td>${fns:abbr(reimburseMain.user.office.name,30)} </td>
            <td><fmt:formatDate value="${reimburseMain.beginDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td>${fns:abbr(reimburseMain.totalAmount,30)}</td>
            <td>${fns:getDictLabel(reimburseMain.status,'fa_reimburseMain_status','')}</td>
        </tr>
    <%--</c:forEach>--%>
    </tbody>
</table>

<div class="form-actions">
    <input id="btnSubmit" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>
