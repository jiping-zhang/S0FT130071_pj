<%@ page import="pojo.entity.domain.bean.TravelUser" %>
<%@ page import="service.impl.LoginServlet" %><%--
  Created by IntelliJ IDEA.
  User: 张稷平
  Date: 2020/7/11
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link href="css/pages/login&signUpCont.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="js/sliderStyle.css">
    <script type="text/javascript" src="js/slider.js"></script>
    <script type="text/javascript" src="js/loginSubmit.js"></script>
    <title>login</title>
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
        boolean isLogin = (travelUser_login != null);
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
            <a href="login"><span class="singleItem" id="selected"><img
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
    <a href="login"><span id="selected" style="float: right" class="singleItem"><img src="sources/img/navBox/login.jpg">登陆</span></a>
    <%
        }
    %>
    <a href="welcomeServlet"><span class="singleItem">首页</span></a>
    <a href="browserServlet"><span class="singleItem">浏览页</span></a>
    <a href="searchServlet"><span class="singleItem">搜索页</span></a>
</header>
<section id="content">
    <%
        int errorCode = 0;
        try
        {
            errorCode = (int) (request.getAttribute("errorIndex"));
        }
        catch (Exception ignored)
        {

        }
    %>
    <script>
        <%=errorCode>0?("alert('wrong email or password')"):""%>
    </script>
    <%
        if (isLogin)
        {
    %>
    <form method="post" action="loginServlet" id="loginForm">
    <table>
        <tr>
            <td><p>您已登录，用户名：</p></td>
            <td><p><%=travelUser_login.getUserName()%></p>
            </td>
        </tr>
        <tr>
            <td>
                <button type="button" class="submitBt" onclick="window.location.href='logoutServlet'">退出登录</button>
            </td>
        </tr>
    </table>
    </form>
    <%
    }
    else
    {
    %>
    <form method="post" action="loginServlet" id="loginForm">
        <table>
            <tr>
                <td><p>邮箱</p></td>
                <td><input type="text" name="emailAddress" id="emailAddress" required="required"
                           pattern="\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}" value="<%=request.getParameter("emailAddress")==null?"":request.getParameter("emailAddress")%>"></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><p>密码</p></td>
                <td><input type="password" name="password" id="password" required="required" pattern="[0-9a-zA-Z]{6,12}">
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><p>滑动图片</p></td>
                <td colspan="2">
                    <div id="slideBar"></div>
                    <p id="imgCheck" style="color: #e9ffe0">　&nbsp;</p>
                </td>
                <td>
                    <div class="hidden">
                        <%
                            String fromUri="welcomeServlet";
                            Object fromUriObj = request.getAttribute("fromUri");
                            if (fromUriObj!=null)
                                fromUri = (String)fromUriObj;
                            else
                            {
                                String fromUriStr = request.getParameter("fromUri");
                                if (fromUriStr!=null)
                                    fromUri = fromUriStr;
                            }
                        %>
                        <input type="text" id="imgCheckInput" value="0">
                        <input type="text" name="fromUri" value="<%=fromUri%>">
                    </div>
                    <p id="imageCheck"></p>
                </td>
                <script type="text/javascript">
                    var dataList = ["0", "1"];
                    var options = {
                        dataList: dataList,
                        success: function () {
                            console.log("show");
                            document.getElementById("imgCheckInput").value = 1;
                            document.getElementById("imageCheck").innerHTML = "通过"
                        },
                        fail: function () {
                            console.log("fail");
                        }
                    };
                    SliderBar("slideBar", options);
                </script>
            </tr>
            <tr>
                <td><button type="button" class="submitBt" onclick="submitForm()">登陆</button></td>
                <td>
                    <button class="submitBt" type="button" onclick="window.location.href='signup'">注册</button>
                </td>
            </tr>
            <%--<tr>
                <td></td>
                <td>
                    <button class="otherBt" type="button" onclick="window.location.href='resetPassword.html'">忘记密码</button>
                </td>
            </tr>--%>
        </table>
    </form>
    <%
        }
    %>
</section>
</body>
</html>
