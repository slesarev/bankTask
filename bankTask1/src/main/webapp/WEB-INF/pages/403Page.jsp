<%@page session="false"%>
<html>
<head>
    <link rel="stylesheet" href="./css/styles.css">
    <title>Access Denied</title>
</head>
<body>
<jsp:include page="hatMenu.jsp"/>

<h3 align="center" style="color:red;">${message}</h3>
</body>
</html>