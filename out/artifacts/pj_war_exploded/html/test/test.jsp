<%@ page import="java.util.List" %>
<%@ page import="pojo.entity.domain.bean.TravelImage" %><%--
  Created by IntelliJ IDEA.
  User: 张稷平
  Date: 2020/7/13
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
</head>
<body>
<ul>
    <%
        List<TravelImage> images = (List<TravelImage>)(request.getAttribute("images"));
        for (TravelImage travelImage:images)
        {
    %>
    <li><%= travelImage %></li>
    <%

        }
    %>
</ul>
</body>
</html>
