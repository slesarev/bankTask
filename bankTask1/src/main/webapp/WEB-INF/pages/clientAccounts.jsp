<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Client Accounts</title>

    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="css/mdb/mdb.min.css">
</head>
<body>
<tr>
    <a class="btn btn-primary" style="margin-left: 16px; margin-top: 16px" href="${pageContext.request.contextPath}/admin/clients/${client.id}/accounts/add" role="button">Add account</a>
    <a class="btn btn-primary" style="margin-top: 16px" href="${pageContext.request.contextPath}/admin" role="button">Back to clients</a>

</tr>
<h1>Client accounts ${client.lastName} ${client.firstName}</h1>
<form>
    <table class="table table-striped table-borderless">
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
