<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/admin/add" method='POST' modelAttribute="client">
    <table>
<%--        <form:hidden path="id" />--%>
        <tr>
            <td>First name:</td>
            <td><form:input type='text' path='firstName' /></td>
        </tr>
        <tr>
            <td>Last name:</td>
            <td><form:input type='text' path='lastName' /></td>
        </tr>
        <tr>
            <td>Patronymic:</td>
            <td><form:input type='text' path='patronymic' /></td>
        </tr>
        <tr>
            <td>Date of birth format "MM-dd-yyyy":</td>
            <td><form:input type='text' path='dateOfBirth' /></td>
        </tr>
        <tr>
            <td><input  type="submit" value="add" /></td>
        </tr>
    </table>
</form:form>
</body>
</html>
