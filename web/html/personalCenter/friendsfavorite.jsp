<%@ page import="pojo.entity.domain.bean.TravelImage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="pojo.entity.domain.bean.TravelUser" %><%--
  Created by IntelliJ IDEA.
  User: 张稷平
  Date: 2020/7/22
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>friend's favorite</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link href="css/pageBox.css" rel="stylesheet" type="text/css">
    <link href="css/cutImage.css" rel="stylesheet" type="text/css">
    <link href="css/pages/search.css" rel="stylesheet" type="text/css">
    <script src="js/cutImage.js" type="text/javascript"></script>
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
            <a href="login"><span class="singleItem"><img
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
            request.setAttribute("fromURI", "friendsFavoriteServlet");
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }
    %>
    <a href="welcomeServlet"><span class="singleItem">首页</span></a>
    <a href="browserServlet"><span class="singleItem">浏览页</span></a>
    <a href="searchServlet"><span class="singleItem">搜索页</span></a>
</header>
<div id="content">
<div class="contRow title">
    <%
        TravelUser friend = null;
        try
        {
            friend = (TravelUser)request.getAttribute("friend");
        }
        catch (Exception e)
        {
            request.getRequestDispatcher("myFriendsServlet").forward(request,response);
        }
    %>
    <%=friend.getUserName()%>的收藏
</div>
<%
    List<TravelImage> travelImages = (List<TravelImage>) (request.getAttribute("friendFavorImages"));
    for (TravelImage travelImage : travelImages)
        System.out.println(travelImage);
    Iterator<TravelImage> iterator = travelImages.iterator();
    boolean hasNext;
    TravelImage travelImage = null;
%>


<div class="contRow">
    <%
        hasNext = iterator.hasNext();
        if (hasNext)
            travelImage = iterator.next();
    %>
    <div class="singleItem">
        <a <%=hasNext ? ("href='detailServlet?imageID=" + travelImage.getImageID() + "'") : ""%>>
            <div class="imgContainer">
                <img class="contImg" src="sources/img/<%=hasNext?travelImage.getPath():"nomore.jpg"%>">
            </div>
        </a>
        <div class="description">
            <h3><%=hasNext ? travelImage.getTitle() : ""%>
            </h3>
            <p><%=hasNext ? travelImage.getDescription() : ""%>
            </p>
        </div>
    </div>
</div>
<div class="contRow">
    <%
        hasNext = iterator.hasNext();
        if (hasNext)
            travelImage = iterator.next();
    %>
    <div class="singleItem">
        <a <%=hasNext ? ("href='detailServlet?imageID=" + travelImage.getImageID() + "'") : ""%>>
            <div class="imgContainer">
                <img class="contImg" src="sources/img/<%=hasNext?travelImage.getPath():"nomore.jpg"%>">
            </div>
        </a>
        <div class="description">
            <h3><%=hasNext ? travelImage.getTitle() : ""%>
            </h3>
            <p><%=hasNext ? travelImage.getDescription() : ""%>
            </p>
        </div>
    </div>
</div>
<div class="contRow">
    <%
        hasNext = iterator.hasNext();
        if (hasNext)
            travelImage = iterator.next();
    %>
    <div class="singleItem">
        <a <%=hasNext ? ("href='detailServlet?imageID=" + travelImage.getImageID() + "'") : ""%>>
            <div class="imgContainer">
                <img class="contImg" src="sources/img/<%=hasNext?travelImage.getPath():"nomore.jpg"%>">
            </div>
        </a>
        <div class="description">
            <h3><%=hasNext ? travelImage.getTitle() : ""%>
            </h3>
            <p><%=hasNext ? travelImage.getDescription() : ""%>
            </p>
        </div>
    </div>
</div>
<div class="contRow">
    <%
        hasNext = iterator.hasNext();
        if (hasNext)
            travelImage = iterator.next();
    %>
    <div class="singleItem">
        <a <%=hasNext ? ("href='detailServlet?imageID=" + travelImage.getImageID() + "'") : ""%>>
            <div class="imgContainer">
                <img class="contImg" src="sources/img/<%=hasNext?travelImage.getPath():"nomore.jpg"%>">
            </div>
        </a>
        <div class="description">
            <h3><%=hasNext ? travelImage.getTitle() : ""%>
            </h3>
            <p><%=hasNext ? travelImage.getDescription() : ""%>
            </p>
        </div>
    </div>
</div>
<div class="contRow">
    <%
        hasNext = iterator.hasNext();
        if (hasNext)
            travelImage = iterator.next();
    %>
    <div class="singleItem">
        <a <%=hasNext ? ("href='detailServlet?imageID=" + travelImage.getImageID() + "'") : ""%>>
            <div class="imgContainer">
                <img class="contImg" src="sources/img/<%=hasNext?travelImage.getPath():"nomore.jpg"%>">
            </div>
        </a>
        <div class="description">
            <h3><%=hasNext ? travelImage.getTitle() : ""%>
            </h3>
            <p><%=hasNext ? travelImage.getDescription() : ""%>
            </p>
        </div>
    </div>
</div>
<div class="contRow">
    <%
        hasNext = iterator.hasNext();
        if (hasNext)
            travelImage = iterator.next();
    %>
    <div class="singleItem">
        <a <%=hasNext ? ("href='detailServlet?imageID=" + travelImage.getImageID() + "'") : ""%>>
            <div class="imgContainer">
                <img class="contImg" src="sources/img/<%=hasNext?travelImage.getPath():"nomore.jpg"%>">
            </div>
        </a>
        <div class="description">
            <h3><%=hasNext ? travelImage.getTitle() : ""%>
            </h3>
            <p><%=hasNext ? travelImage.getDescription() : ""%>
            </p>
        </div>
    </div>
</div>

<div class="contRow_bottom" id="pageBox">
    <ul>
        <%
            int currentPageIndex = (int) request.getAttribute("currentPageIndex");
            int numberOfPages = (int) request.getAttribute("numberOfPages");
            //String parameterStr = (String) request.getAttribute("parameterStr");
            String uri = "friendsFavoriteServlet?friendID="+friend.getuID() + "&pageIndex=";
        %>
        <li><a href="<%=uri+1%>"><span class="singleItem">首页</span></a></li>
        <li><a href="<%=uri+Math.max(currentPageIndex-1,1)%>"><span class="singleItem">上一页</span></a></li>
        <%--<li><a href="#"><span class="singleItem">1</span></a></li>
        <li><a href="#"><span class="singleItem">2</span></a></li>
        <li><a href="#"><span class="singleItem">3</span></a></li>
        <li><a href="#"><span class="singleItem">4</span></a></li>
        <li><a href="#"><span class="singleItem">5</span></a></li>--%>
        <%
            for (int i = 1; i <= numberOfPages; i++)
            {
        %>
        <li><a href="<%=uri+i%>"><span
                class="singleItem" <%=(i == currentPageIndex ? "id='selectedPage'" : "")%>><%=i%></span></a>
        </li>
        <%
            }
        %>
        <li><a href="<%=uri+(Math.min((currentPageIndex + 1), numberOfPages))%>"><span
                class="singleItem">下一页</span></a></li>
        <li><a href="<%=uri+numberOfPages%>"><span class="singleItem">末页</span></a></li>
    </ul>
</div>
</div>
</body>
</html>
