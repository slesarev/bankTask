<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add account</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/admin/clients/${client.id}/accounts/add"
           method='POST' modelAttribute="account">
    <table>
        <tr>
            <td>Account number:</td>
            <td><form:input type='text' path='accountNumber' /></td>
        </tr>
        <tr>
            <td>open date format "MM-dd-yyyy:</td>
            <td><form:input type='text' path='openDate' /></td>
        </tr>
        <tr>
            <td>balance:</td>
            <td><form:input type='double' path='balance' /></td>
        </tr>
        <tr>
            <td><input  type="submit" value="add" /></td>
        </tr>
    </table>
</form:form>
</body>
</html>
