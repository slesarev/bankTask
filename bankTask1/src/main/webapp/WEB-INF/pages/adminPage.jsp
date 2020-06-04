<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page session="true"%>

<html>
<head>
    <title>${title}</title>

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
<jsp:include page="hatMenu.jsp" />

<h2>Admin Page</h2>


<h3>Welcome, ${pageContext.request.userPrincipal.name}</h3>

<h3>Clients:</h3>

<a class="btn btn-primary" style="margin-left: 16px; margin-right: 16px" href="${pageContext.request.contextPath}/admin/add" role="button">Add client</a>

<form action="${pageContext.request.contextPath}/admin" style="text-align: right;">
    <input type="text" name="filter" value="${filter}"/>
    <input name="submit" class="btn btn-primary btn-rounded btn-indigo" style="background-color:#2b22aa"  type="submit" value="Search">
</form>



<form style="margin-left: 16px; margin-right: 16px">
    <table class="table table-striped table-borderless">
        <thead>
        <tr>
            <th>#</th>
            <th>First name</th>
            <th>Last name</th>
            <th>Patronymic</th>
            <th>Date of Birth</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tempClient" items="${clients}">

            <%--<c:url var="updateLink" value="${pageContext.request.contextPath}/admin/update">
                <c:param name="clientId" value="${tempClient.id}" />
            </c:url>--%>


            <%--<c:url var="deleteLink" value="/admin/delete">
                <c:param name="clientId" value="${tempClient.id}" />
            </c:url>--%>

            <tr>
                <td>${tempClient.id}</td>
                <td>${tempClient.firstName}</td>
                <td>${tempClient.lastName}</td>
                <td>${tempClient.patronymic}</td>
                <td>"${tempClient.dateOfBirth}"</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/clients/${tempClient.id}/accounts">Show accounts</a> |
                    <a href="${pageContext.request.contextPath}/admin/clients/${tempClient.id}/transactions">Show transactions</a>
                </td>


                <%--<td>
                    <a href="${pageContext.request.contextPath}/admin/update/${tempClient.id}">update</a>
                    | <a href="${pageContext.request.contextPath}/admin/delete/${tempClient.id}"
                         onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                </td>--%>

            </tr>

        </c:forEach>
        </tbody>
    </table>
</form>
</body>
</html>
