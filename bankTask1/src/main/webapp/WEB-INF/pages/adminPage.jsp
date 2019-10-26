<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page session="true"%>

<html>
<head>
    <title>${title}</title>
</head>
<body>
<jsp:include page="hatMenu.jsp" />

<h2>Admin Page</h2>


<h3>Welcome : ${pageContext.request.userPrincipal.name}</h3>

<h3>Client table:</h3>

<a href="${pageContext.request.contextPath}/admin/add">Add client</a>

<form action="${pageContext.request.contextPath}/admin">
    <input type="text" name="filter" value="${filter}"/>
    <input name="submit" type="submit" value="Search" />
</form>



<form>
    <table>
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
                    <a href="${pageContext.request.contextPath}/admin/clients/${tempClient.id}/accounts">show accounts</a> |
                    <a href="${pageContext.request.contextPath}/admin/clients/${tempClient.id}/transactions">show transactions</a>
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
