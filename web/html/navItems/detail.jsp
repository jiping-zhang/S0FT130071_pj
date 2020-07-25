<%@ page import="pojo.entity.domain.bean.TravelImage" %>
<%@ page import="pojo.entity.domain.bean.TravelUser" %>
<%@ page import="dao.impl.CountryDAO" %>
<%@ page import="dao.impl.CityDAO" %>
<%@ page import="dao.impl.FavorDAO" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 张稷平
  Date: 2020/7/13
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link href="css/pages/detail.css" rel="stylesheet" type="text/css">
    <link href="css/self-definedTable.css" rel="stylesheet" type="text/css">
    <script src="js/stretchImage.js" type="text/javascript" defer></script>
    <script src="js/changeTableWidth.js" type="text/javascript" defer></script>
    <title>详情</title>
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
        boolean isLogin = (travelUser_login!=null);
        if (isLogin)
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
            <a href="login?fromUri=browserServlet"><span class="singleItem"><img
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
    <a href="login?fromUri=browserServlet"><span id="navRight" class="singleItem"><img src="sources/img/navBox/login.jpg">登陆</span></a>
    <%
        }
    %>
    <a href="welcomeServlet"><span class="singleItem">首页</span></a>
    <a href="browserServlet"><span class="singleItem">浏览页</span></a>
    <a href="searchServlet"><span class="singleItem">搜索页</span></a>
</header>
<%
    TravelImage travelImage = (TravelImage) request.getAttribute("travelImage");
    TravelUser uploadUser = (TravelUser) request.getAttribute("travelUser");
    Date editingDate = new Date(travelImage.getDate());
%>
<%--<section id="content">

    <div id="contHead">
        <p></p>
        <h2> <%=travelImage.getTitle()%> </h2>
        <sub> by <%=uploadUser.getUserName()%> </sub>
        <a href="addFriendServlet<%=((!isLogin)?"":("?uid="+uploadUser.getuID()))%>"><%=(!isLogin)?"":"add as friend"%></a>
        <p></p>
    </div>
    <div id="middle">
        <div class="imgContainer" id="imgContainer">
            <img class="contImg" src="sources/img/<%= travelImage.getPath()%>">
        </div>
        <div class="infoBox" id="infoBox">
            <table class="contTable">
                <tr>
                    <th>like number</th>
                </tr>
                <tr>
                    <td><%=travelImage.getFavor()%></td>
                </tr>
            </table>
            <table class="contTable">
                <tr>
                    <th>details</th>
                </tr>
                <tr>
                    <td>Content: <%= travelImage.getContent()%></td>
                </tr>
                <tr>
                    <td>Country: <%= CountryDAO.getCountryNameByCountryCode(travelImage.getCountryCode()) %></td>
                </tr>
                <tr>
                    <td>City: <%=CityDAO.getCity(travelImage.getCityCode()).getCityName()%></td>
                </tr>
                <tr>
                    <td>last edit date: <%=editingDate.getYear()+1900%>-<%=(editingDate.getMonth()+1)%>-<%=editingDate.getDay()%></td>
                </tr>
            </table>
            <button onclick="window.location.href='<%=isLogin?("addAndDeleteFavorServlet?imageID="+travelImage.getImageID()):"login"%>'">
                <%= isLogin?(FavorDAO.isFavor(travelUser_login.getuID(),travelImage.getImageID())?"取消收藏":"收藏"):"请先登录" %>
            </button>
        </div>
    </div>
    <div id="description">
        <p>
            <%=travelImage.getDescription()%>
        </p>
    </div>
</section>--%>
<section id="content">
    <div id="contHead">
        <p></p>
        <h2> <%=travelImage.getTitle()%> </h2>
        <sub> by <%=uploadUser.getUserName()%> </sub>
        <a href="addFriendServlet<%=((!isLogin)?"":("?uid="+uploadUser.getuID()))%>"><%=(!isLogin)?"":"add as friend"%></a>
        <p></p>
    </div>
    <div id="middle">
        <div class="imgContainer" id="imgContainer">
            <img class="contImg" src="sources/img/<%= travelImage.getPath()%>">
        </div>
        <div id="enlarge">
            <img>
        </div>
        <script>
            window.addEventListener("resize",function(){
                document.getElementById("enlarge").style.height=(document.getElementById("enlarge").clientWidth+"px")
            });
            window.addEventListener("load",function(){
                document.getElementById("enlarge").style.height=(document.getElementById("enlarge").clientWidth+"px")
            });
        </script>
        <script>
            var shouldTrace = false;
            let contImgElement = document .getElementById("imgContainer").getElementsByClassName("contImg")[0];
            let imgContainerElement = document .getElementById("imgContainer");
            let contentElement=document.getElementById("content");
            var x=0 ,y=0;
            contImgElement.addEventListener("mouseenter",function(){
                shouldTrace=true;
            });
            contImgElement.addEventListener("mouseleave",function ()
            {
                shouldTrace = false;
            });
            window.addEventListener("mousemove",function(event)
            {
                x=event.clientX-(contImgElement.offsetLeft+imgContainerElement.offsetLeft+contentElement.offsetLeft);
                y=event.clientY-(contImgElement.offsetTop+imgContainerElement.offsetTop+contentElement.offsetTop)+document.body.scrollTop;
                //console.log(x+" "+y)
                enlargePhoto()
                //console.log(x+" "+y)
            });
            function enlargePhoto()
            /*contImgElement.clientWidth*/
            {
                let enlargeContainer=document.getElementById("enlarge");
                let enlargeImgElement=document.getElementById("enlarge").getElementsByTagName("img")[0];

                enlargeImgElement.setAttribute("src","sources/img/<%=travelImage.getPath()%>");
                enlargeImgElement.style.left = (0.5 * enlargeContainer.clientWidth - 3 * x) + "px";
                enlargeImgElement.style.top = (0.5 * enlargeContainer.clientHeight - 3 * y) + "px";
                enlargeImgElement.style.width=3*contImgElement.clientWidth+"px";
                enlargeImgElement.style.height=3*contImgElement.clientHeight+"px";

            }
        </script>
    </div>
    <div id="bottom">
        <table class="contTable">
            <tr>
                <th>like number</th>
            </tr>
            <tr>
                <td><%=travelImage.getFavor()%></td>
            </tr>
        </table>
        <table class="contTable">
            <tr>
                <th>details</th>
            </tr>
            <tr>
                <td>Content: <%= travelImage.getContent()%></td>
            </tr>
            <tr>
                <td>Country: <%= CountryDAO.getCountryNameByCountryCode(travelImage.getCountryCode()) %></td>
            </tr>
            <tr>
                <td>City: <%=CityDAO.getCity(travelImage.getCityCode()).getCityName()%></td>
            </tr>
            <tr>
                <td>last edit date: <%=editingDate.getYear()+1900%>-<%=(editingDate.getMonth()+1)%>-<%=editingDate.getDay()%></td>
            </tr>
        </table>
        <button onclick="window.location.href='<%=isLogin?("addAndDeleteFavorServlet?imageID="+travelImage.getImageID()):"login"%>'">
            <%= isLogin?(FavorDAO.isFavor(travelUser_login.getuID(),travelImage.getImageID())?"取消收藏":"收藏"):"请先登录" %>
        </button>
        <div id="description">
            <p>
                <%=travelImage.getDescription()%>
            </p>
        </div>
    </div>
</section>
</body>
</html>
