<%@page session="false"%>
<html>
<head>

    <title>${title}</title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="hatMenu.jsp" />
<h1 align="center">${message}</h1>
</body>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width:640px;height:360px;margin: auto">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="https://avatars.mds.yandex.net/get-pdb/236760/993d8cfb-f46a-4bba-b910-ac6fdeadc307/s1200" alt="First slide">
            <div class="carousel-caption d-none d-md-block">
                <h3>За нами - будущее!</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://cdn.discordapp.com/attachments/708704013297647678/717823824531292190/nam-doveryayut-2.png" alt="Second slide">
            <div class="carousel-caption d-none d-md-block">
                <h3>Нам доверяют многие</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://i.pinimg.com/originals/2f/9c/f6/2f9cf60c387bffe7d434292c44f166dd.jpg" alt="Third slide">
            <div class="carousel-caption d-none d-md-block">
                <h3>Обеспечьте свое спокойствие</h3>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
</body>
</html>
