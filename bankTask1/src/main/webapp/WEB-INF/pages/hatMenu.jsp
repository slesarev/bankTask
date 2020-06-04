<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/styles.css">
<div class="pageHat">

    <a style="color: white" href="${pageContext.request.contextPath}/welcome">Home</a>

    | &nbsp;

    <a style="color: white" href="${pageContext.request.contextPath}/userInfo">User Info</a>

    | &nbsp;

    <a style="color: white" href="${pageContext.request.contextPath}/admin">Admin</a>

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        | &nbsp;
        <a style="color: white" href="${pageContext.request.contextPath}/logout">Logout</a>

    </c:if>

</div>