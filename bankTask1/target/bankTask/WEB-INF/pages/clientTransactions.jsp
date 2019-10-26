<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Client Transactions</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin">back to clients</a>
<h1>Client transactions ${client.lastName} ${client.firstName}</h1>
<form>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Account number in</th>
            <th>Account number out</th>
            <th>Sum</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tempTransaction" items="${transactions}">
            <tr>
                <td>${tempTransaction.id}</td>
                <td>${tempTransaction.inAccount.accountNumber}</td>
                <td>${tempTransaction.outAccount.accountNumber}</td>
                <td>${tempTransaction.sum}</td>
                <td>${tempTransaction.date}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
</body>
</html>

