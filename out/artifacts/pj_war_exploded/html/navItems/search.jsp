<%@ page import="pojo.entity.domain.bean.TravelUser" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.entity.domain.bean.TravelImage" %><%--
  Created by IntelliJ IDEA.
  User: 张稷平
  Date: 2020/7/14
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link href="css/cutImage.css" rel="stylesheet" type="text/css">
    <link href="css/pageBox.css" rel="stylesheet" type="text/css">
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
            <a href="login?fromUri=search"><span class="singleItem"><img
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
    <a href="login?fromUri=search"><span id="navRight" class="singleItem"><img src="sources/img/navBox/login.jpg">登陆</span></a>
    <%
        }
    %>
    <a href="welcomeServlet"><span class="singleItem">首页</span></a>
    <a href="browserServlet"><span class="singleItem">浏览页</span></a>
    <a href="searchServlet"><span class="singleItem" id="selected">搜索页</span></a>
</header>
<section id="content">
    <div class="contRow title">
        搜索
    </div>
    <div class="contRow">
        <%
            boolean byTitle = true ;
            String searchMethodStr = request.getParameter("searchMethod");
            if (searchMethodStr!=null&&searchMethodStr.equals("content"))
                byTitle = false;
            boolean byFavor = true;
            String sortMethodStr = request.getParameter("sortMethod");
            if (sortMethodStr!=null&&sortMethodStr.equals("time"))
                byFavor = false;

            String title = request.getParameter("title");
            if (title==null)
                title = "";

            String description = request.getParameter("content");
            if (description==null)
                description="";

        %>
        <div>
            <form name="contentForm" id="contentForm" action="searchServlet" method="get">
                <input type="radio" name="searchMethod" id="searchMethod_title" value="title" <%=byTitle?"checked":""%>> by title
                <br>
                <input type="text" name="title" id="searchTitle" value="<%=byTitle?title:""%>">
                <br>
                <input type="radio" name="searchMethod" id="searchMethod_content" value="content" <%=byTitle?"":"checked"%>> by content
                <br>
                <textarea name="description" id="searchCont" ><%=byTitle?"":description%></textarea>
                <br>
                <input type="submit" class="submit" value="search">
                <br>
                <input type="radio" name="sortMethod" value="favor" <%=byFavor?"checked":""%>>sort by favor
                <input type="radio" name="sortMethod" value="time" <%=byFavor?"":"checked"%>>sort by time
            </form>
        </div>
    </div>
    <div class="contRow">
        <div class="singleItem">
            <a class="linkToDetailPage">
                <div class="imgContainer">
                    <img class="contImg" src="">
                </div>
            </a>
            <div class="description">
                <h3></h3>
                <p></p>
            </div>
        </div>
    </div>
    <div class="contRow">
        <div class="singleItem">
            <a class="linkToDetailPage">
                <div class="imgContainer">
                    <img class="contImg" src="">
                </div>
            </a>
            <div class="description">
                <h3></h3>
                <p></p>
            </div>
        </div>
    </div>
    <div class="contRow">
        <div class="singleItem">
            <a class="linkToDetailPage">
                <div class="imgContainer">
                    <img class="contImg" src="">
                </div>
            </a>
            <div class="description">
                <h3></h3>
                <p></p>
            </div>
        </div>
    </div>
    <div class="contRow">
        <div class="singleItem">
            <a class="linkToDetailPage">
                <div class="imgContainer">
                    <img class="contImg" src="">
                </div>
            </a>
            <div class="description">
                <h3></h3>
                <p></p>
            </div>
        </div>
    </div>
    <div class="contRow">
        <div class="singleItem">
            <a class="linkToDetailPage">
                <div class="imgContainer">
                    <img class="contImg" src="">
                </div>
            </a>
            <div class="description">
                <h3></h3>
                <p></p>
            </div>
        </div>
    </div>
    <div class="contRow">
        <div class="singleItem">
            <a class="linkToDetailPage">
                <div class="imgContainer">
                    <img class="contImg" src="">
                </div>
            </a>
            <div class="description">
                <h3></h3>
                <p></p>
            </div>
        </div>
    </div>
    <div class="contRow_bottom" id="pageBox">
        <ul>
            <%--<li><a href="#"><span class="singleItem">首页</span></a></li>
            <li><a href="#"><span class="singleItem">上一页</span></a></li>
            <li><a href="#"><span class="singleItem">1</span></a></li>
            <li><a href="#"><span class="singleItem">2</span></a></li>
            <li><a href="#"><span class="singleItem">3</span></a></li>
            <li><a href="#"><span class="singleItem">4</span></a></li>
            <li><a href="#"><span class="singleItem">5</span></a></li>
            <li><a href="#"><span class="singleItem">下一页</span></a></li>
            <li><a href="#"><span class="singleItem">末页</span></a></li>--%>
        </ul>
    </div>
    <div class="hidden">
        <form id="imageIDForm" action="../navItems/detail.php" method="get">
            <input type="number" name="imageID" id="imageIDInput">
            <input type="text" name="imagePath" id="imagePathInput">
        </form>
        <ul id="imgList">
            <%
                List<TravelImage> travelImages = (List<TravelImage>) request.getAttribute("travelImages");
                if (travelImages.size() == 0)
                {
            %>
            <li class="onePageInfo">
                <ul>
                    <li class="oneImgInfo"></li>
                </ul>
            </li>
            <%
                }
                int imgOnThisPage = 0;
                for (TravelImage travelImage : travelImages)
                {
            %>
            <%
                if (imgOnThisPage == 0)
                {
            %>
            <li class="onePageInfo">
                <ul>
                    <%
                        }
                    %>
                    <li class="oneImgInfo"><h5><%=travelImage.getImageID()%>
                    </h5><h6><%=travelImage.getTitle()%>
                    </h6>
                        <article><%=travelImage.getDescription()%>
                        </article>
                        <p><%=travelImage.getPath()%>
                        </p></li>
                    <%
                        imgOnThisPage++;
                        if (imgOnThisPage == 6)
                        {
                            imgOnThisPage = 0;
                    %>
                </ul>
            </li>
            <%
                }
            %>
            <%
                }
            %>
        </ul>
        <script type="text/javascript" src="js/pageBox/searchPages.js"></script>
        <script>setPageBox()</script>
    </div>
</section>
</body>
</html>
