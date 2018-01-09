<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>费用报销列表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/fa/reimburse/list${reimburseModel.id}">费用报销列表</a></li>
    <li><a href="${ctx}/fa/reimburse/formList">报销费用综合申报表查看</a></li>
</ul>
<form:form id="searchForm"
           modelAttribute="reimburseModel" action="${ctx}/fa/reimburse/list" class="breadcrumb form-search">
   
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        
        <li><label>状态：</label>
            <form:select path="status" class="input-medium">
				<form:option value="" label="请选择"/>
				<form:options items="${fns:getDictList('fa_reimburseMain_status')}" itemLabel="label" itemValue="value"/>
			</form:select>
			
        </li> 
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>申请日期</th>
        <th>部门</th>
        <th>申报人</th>
        <%-- <c:choose>
            <c:when test="${reimburseModel.applicantId =='1' || reimburseModel.applicantId =='8' }">
                <th>申报人</th>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose> --%>
        <th>申报起始日</th>
        <th>申报结束日</th>
        <th>总金额</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="reimburseModel">
        <tr>
         <input id="id" name="id"  value="${reimburseModel.id}"/>     
            <td><fmt:formatDate value="${reimburseModel.applyDate}" type="both" pattern="yyyy-MM-dd"/></td>
       
           <td>${reimburseModel.officeName}</td>
           <td>${reimburseModel.userName}</td>
           <%--  <c:choose>
                <c:when test="${reimburseModel.officeName =='1' || reimburseModel.applicantId =='8' }">
                    <td>${reimburseMain.user.name}</td>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose> --%>
            <td><fmt:formatDate value="${reimburseModel.beginDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatDate value="${reimburseModel.endDate}" type="both" pattern="yyyy-MM-dd"/></td>
            <td>${fns:abbr(reimburseModel.totalAmount,30)}</td>
            <td>${fns:getDictLabel(reimburseModel.status,'fa_reimburseMain_status','')}</td>
            <td><a href="${ctx}/fa/reimburse/show?id=${reimburseModel.id}">查看</a></td> 
           
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>
