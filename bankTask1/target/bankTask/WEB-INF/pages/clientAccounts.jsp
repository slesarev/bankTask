<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Client Accounts</title>
</head>
<body>
<tr>
    <a href="${pageContext.request.contextPath}/admin/clients/${client.id}/accounts/add">Add account</a>
    <a href="${pageContext.request.contextPath}/admin">back to clients</a>
</tr>
<h1>Client accounts ${client.lastName} ${client.firstName}</h1>
<form>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Account number</th>
            <th>Open date</th>
            <th>Balance</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tempAccount" items="${accounts}">

            <tr>
                <td>${tempAccount.id}</td>
                <td>${tempAccount.accountNumber}</td>
                <td>${tempAccount.openDate}</td>
                <td>${tempAccount.balance}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/clients/${client.id}/accounts/${tempAccount.id}/add">
                        Add transaction</a>
                </td>


            </tr>

        </c:forEach>
        </tbody>
    </table>
</form>
</body>
</html>
