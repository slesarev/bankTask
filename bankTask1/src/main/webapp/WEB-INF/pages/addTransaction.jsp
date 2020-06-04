<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add transaction</title>
    <link rel="stylesheet" href="./css/styles.css">
</head>
<body>
<form:form action="${pageContext.request.contextPath}/admin/clients/${client.id}/transaction/add/${account.id}"
           method='POST' modelAttribute="transaction">
    <table>
        <%--<form:hidden path="outAccount" value ='${account}' />--%>
        <tr>
            <td>Where? account ID:</td>
            <tr>
                <select name="mInAccountId" >
                    <c:forEach items="${accountList}" var="currentAccount">
                        <option value="${currentAccount.id}">${currentAccount.accountNumber}</option>
                        <%--<td><form:input type='select' path='inAccount'
                                        value ='${currentAccount.accountNumber}' /></td>--%>
                    </c:forEach>
                </select>
            </tr>

        </tr>
        <tr>
            <td>Sum:</td>
            <td><form:input type='double' path='sum' /></td>
        </tr>
        <tr>
            <td>date format "MM-dd-yyyy:</td>
            <td><form:input type='text' path='date' /></td>
        </tr>
        <tr>
            <td><input  type="submit" value="add" /></td>
        </tr>
    </table>
</form:form>
</body>
</html>
