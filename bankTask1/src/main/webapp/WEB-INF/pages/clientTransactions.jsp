<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Client Transactions</title>

    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="css/mdb/mdb.min.css">

</head>
<body >
<a class="btn btn-primary" style="margin-left: 16px; margin-top: 16px" href="${pageContext.request.contextPath}/admin" role="button">Back to clients</a>

<h1>Client transactions ${client.lastName} ${client.firstName}</h1>
<form>
    <table class="table table-striped table-borderless">
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

