<%@ page import="pojo.entity.domain.bean.TravelUser" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 张稷平
  Date: 2020/7/14
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link href="css/pages/myfriends.css" rel="stylesheet" type="text/css">
    <title>my friends</title>
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
            <a href="myphotosServlet"><span class="singleItem"><img
                    src="sources/img/navBox/myphotos.jpg">我的照片</span></a>
            <br>
            <a href="myFavoriteServlet"><span class="singleItem" ><img
                    src="sources/img/navBox/myfavourite.jpg">我的收藏</span></a>
            <br>
            <a href="login"><span class="singleItem"><img
                    src="sources/img/navBox/login.jpg">登陆</span></a>
            <br>
            <a href="myFriendsServlet"><span class="singleItem" id="selected"><img
                    src="sources/img/navBox/myfriends.jpg">我的好友</span></a>
        </div>
    </div>
    <%
        }
        else
        {
            request.setAttribute("fromURI", "myFriendsServlet");
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }
    %>
    <a href="welcomeServlet"><span class="singleItem">首页</span></a>
    <a href="browserServlet"><span class="singleItem">浏览页</span></a>
    <a href="searchServlet"><span class="singleItem">搜索页</span></a>
</header>
<section id="content">
    <%
        List<TravelUser> myFriends,applyFriends,foundUsers;
        try
        {
            myFriends = (List<TravelUser>) request.getAttribute("myFriends");
            applyFriends = (List<TravelUser>) request.getAttribute("applyFriends");
            foundUsers = (List<TravelUser>) request.getAttribute("foundUsers");
        }
        catch (Exception e)
        {
            request.getRequestDispatcher("myFriendsServlet").forward(request,response);
            return;
        }
        if (foundUsers==null)
            foundUsers=new ArrayList<>();
    %>
    <div id="contLeft">
        <div>
            <%
                boolean allow = travelUser_login.getAllow()==1;
            %>
            设置
            <p>是否允许好友查看我的收藏</p>
            <form id="configForm" method="get" action="configPhotoAllowServlet">
                <input type="radio" name="allow" value="yes" <%=allow?"checked":""%>>是
                <input type="radio" name="allow" value="no" <%=allow?"":"checked"%>>否
                <input type="submit" class="submit" value="保存">
            </form>
        </div>
        <div id="acceptBts">
            <p>收到的好友请求</p>
            <%
                for (TravelUser travelUser:applyFriends)
                {
            %>
            <div>
                <p>用户名:<%=travelUser.getUserName()%></p>
                <button class="accept" onclick="window.location.href='acceptServlet?uid=<%=travelUser.getuID()%>'">接受</button>
                <button class="reject" onclick="window.location.href='rejectServlet?uid=<%=travelUser.getuID()%>'">拒绝</button>
            </div>
            <%
                }
            %>
            <%--<div>
                <p>用户名:</p>
                <button class="accept">接受</button>
                <button class="reject">拒绝</button>
            </div>
            <div>
                <p>用户名:</p>
                <button class="accept">接受</button>
                <button class="reject">拒绝</button>
            </div>--%>
        </div>
    </div>
    <div id="contMiddle">
        <p>按用户名搜索用户</p>
        <form method="get" action="myFriendsServlet">
            <input type="text" name="searchName">
            <input type="submit" value="搜索" class="submit">
        </form>
        <p>
            搜索结果
        </p>
        <%
            for (TravelUser travelUser:foundUsers)
            {
        %>
        <div>
            <p>用户名:<%=travelUser.getUserName()%></p>
            <button class="apply" onclick="window.location.href='applyServlet?uid=<%=travelUser.getuID()%>'">加为好友</button>
        </div>
        <%
            }
        %>
        <%--<div>
            <p>用户名:</p>
            <button class="apply">加为好友</button>
        </div>
        <div>
            <p>用户名:</p>
            <button class="apply">加为好友</button>
        </div>
        <div>
            <p>用户名:</p>
            <button class="apply">加为好友</button>
        </div>--%>
    </div>
    <div id="contRight">
        <p>我的好友</p>
        <%
            for (TravelUser travelUser : myFriends)
            {
                Date date = new Date(travelUser.getDate());
        %>
        <div>
            <p>用户名:<%=travelUser.getUserName()%></p>
            <br>
            <p>邮箱:<%=travelUser.getEmail()%></p>
            <br>
            <p>注册时间:<%=date.getYear()%>-<%=(date.getMonth()+1)%>-<%=date.getDate()%>/<%=date.getHours()%>-<%=date.getMinutes()%>-<%=date.getSeconds()%></p>
            <button class="chat" onclick="window.open('chatServlet?uid=<%=travelUser.getuID()%>')">和ta聊天</button>
            <button class="friendFavor" onclick="<%=travelUser.getAllow()==0?"alert('该用户禁止好友查看ta的收藏')":"window.location.href='friendsFavoriteServlet?friendID="+travelUser.getuID()+"'"%>">ta的喜欢</button>
        </div>
        <%
            }
        %>
       <%-- <p>我的好友</p>
        <div>
            <p>用户名:</p>
            <button class="chat">和ta聊天</button>
        </div>
        <p>我的好友</p>
        <div>
            <p>用户名:</p>
            <button class="chat">和ta聊天</button>
        </div>
        <p>我的好友</p>
        <div>
            <p>用户名:</p>
            <button class="chat">和ta聊天</button>
        </div>--%>
    </div>
</section>
</body>
</html>
