<%@ page import="java.util.List" %>
<%@ page import="pojo.entity.domain.bean.TravelImage" %>
<%@ page import="utlis.GetProjectDictroyPath" %>
<%@ page import="pojo.entity.domain.bean.TravelUser" %><%--
  Created by IntelliJ IDEA.
  User: 张稷平
  Date: 2020/7/14
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link href="css/pages/welcome.css" rel="stylesheet" type="text/css">
    <link href="css/cutImage.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/scrollBox.css">
    <script type="text/javascript" src="js/cutImage.js"></script>
    <script type="text/javascript" src="js/welcomePage.js" defer></script>
</head>
<body>
<header id="navBox">
    <%
        TravelUser travelUser_login;
        try
        {
            travelUser_login = (TravelUser) session.getAttribute("travelUser_login");
        }
        catch (NullPointerException e)
        {
            travelUser_login = null;
        }
        if (travelUser_login != null)
        {
    %>
    <div class="singleMenu" id="navRight">
        <span>个人中心</span>
        <div class="singleCont">
            <a href="upload"><span class="singleItem"><img
                    src="sources/img/navBox/upload.jpg">上传</span></a>
            <br>
            <a href="myPhotosServlet"><span class="singleItem"><img
                    src="sources/img/navBox/myphotos.jpg">我的照片</span></a>
            <br>
            <a href="myFavoriteServlet"><span class="singleItem"><img
                    src="sources/img/navBox/myfavourite.jpg">我的收藏</span></a>
            <br>
            <a href="login?fromUri=welcomeServlet"><span class="singleItem"><img
                    src="sources/img/navBox/login.jpg">登陆</span></a>
            <br>
            <a href="myFriendsServlet"><span class="singleItem"><img
                    src="sources/img/navBox/myfriends.jpg">我的好友</span></a>
        </div>
    </div>
    <%
    }
    else
    {
    %>
    <a href="login?fromUri=welcomeServlet"><span id="navRight" class="singleItem"><img src="sources/img/navBox/login.jpg">登陆</span></a>
    <%
        }
    %>
    <a href="welcomeServlet"><span class="singleItem"  id="selected">首页</span></a>
    <a href="browserServlet"><span class="singleItem">浏览页</span></a>
    <a href="searchServlet"><span class="singleItem">搜索页</span></a>
</header>
<section id="content">
    <div id="contLeft">
        <div class="container">
            <%
                List<TravelImage> mostFavoredImages;
                try
                {
                    mostFavoredImages = (List<TravelImage>) (request.getAttribute("mostFavoredImages"));
                }
                catch (Exception e)
                {
                    request.getRequestDispatcher("welcomeServlet").forward(request, response);
                    return;
                }
            %>
            <div class="wrap" style="left: -600px;">
                <a href="detailServlet?imageID=<%=mostFavoredImages.get(4).getImageID()%>">
                    <img src="sources/img/<%=mostFavoredImages.get(4).getPath()%>" alt="5">
                </a>
                <a href="detailServlet?imageID=<%=mostFavoredImages.get(0).getImageID()%>">
                    <img src="sources/img/<%=mostFavoredImages.get(0).getPath()%>" alt="1">
                </a>
                <a href="detailServlet?imageID=<%=mostFavoredImages.get(1).getImageID()%>">
                    <img src="sources/img/<%=mostFavoredImages.get(1).getPath()%>" alt="2">
                </a>
                <a href="detailServlet?imageID=<%=mostFavoredImages.get(2).getImageID()%>">
                    <img src="sources/img/<%=mostFavoredImages.get(2).getPath()%>" alt="3">
                </a>
                <a href="detailServlet?imageID=<%=mostFavoredImages.get(3).getImageID()%>">
                    <img src="sources/img/<%=mostFavoredImages.get(3).getPath()%>" alt="4">
                </a>
                <a href="detailServlet?imageID=<%=mostFavoredImages.get(4).getImageID()%>">
                    <img src="sources/img/<%=mostFavoredImages.get(4).getPath()%>" alt="5">
                </a>
                <a href="detailServlet?imageID=<%=mostFavoredImages.get(0).getImageID()%>">
                    <img src="sources/img/<%=mostFavoredImages.get(0).getPath()%>" alt="1">
                </a>
            </div>
            <div class="buttons">
                <span class="on">1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>5</span>
            </div>
            <a href="javascript:" class="arrow arrow_left">&lt;</a>
            <a href="javascript:" class="arrow arrow_right">&gt;</a>
        </div>
    </div>
    <script type="text/javascript" src="js/scrollBox.js" defer></script>
    <div id="contRight">
        <%
            List<TravelImage> latestImages = (List<TravelImage>)(request.getAttribute("latestImages"));
        %>
        <%
            for (TravelImage travelImage : latestImages)
            {
        %>
        <a href="detailServlet?imageID=<%=travelImage.getImageID()%>">
        <div class="imgItem">
            <div class="imgTitle">
                <h3><%=travelImage.getTitle()%></h3>
            </div>
            <div class="imgContainer">
                <img class="contImg" src="sources/img/<%=travelImage.getPath()%>">
            </div>
            <div class="description">
                <p>
                    <%=travelImage.getDescription()%>
                </p>
            </div>
        </div>
        </a>
        <%
            }
        %>
    </div>
</section>
</body>
</html>
