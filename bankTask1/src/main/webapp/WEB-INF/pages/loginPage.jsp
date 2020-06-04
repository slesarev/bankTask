<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Login</title>

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
<h1>Login</h1>
<c:if test="${param.error == 'true'}">
    <div style="color:red;margin:10px 0px;">
        Login Failed!!!<br />
        Reason :  ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
    </div>
</c:if>
<h3>Enter username and password:</h3>
<form name='f' action="${pageContext.request.contextPath}/j_spring_security_check" method='POST'>
    <table>
        <tr>
            <div class="input-group mb-3 w-25">
                <div class="input-group-prepend">
                    <span class="input-group-text">Username: </span>
                </div>
                <input name="username" type="text" class="form-control" aria-label="Default"
                       aria-describedby="inputGroup-sizing-default">
            </div>
        </tr>
        <tr>
            <div class="input-group mb-3 w-25">
                <div class="input-group-prepend">
                    <span class="input-group-text">Password: </span>
                </div>
                <input name="password" type="password" class="form-control" aria-label="Default"
                       aria-describedby="inputGroup-sizing-default">
            </div>
        </tr>
        <tr>
            <td>
                <input name="submit" class="btn btn-primary btn-rounded btn-indigo" type="submit" value="Submit">
            </td>
        </tr>
    </table>
</form>
</body>
</html>