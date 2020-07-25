<%@ page import="pojo.entity.domain.bean.TravelUser" %>
<%@ page import="pojo.entity.domain.bean.Friend" %><%--
  Created by IntelliJ IDEA.
  User: 张稷平
  Date: 2020/7/18
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>聊天</title>
    <link href="css/pages/chat.css" rel="stylesheet" type="text/css">
</head>
<body>
<%--<button onclick=" getNewMessages() ;alert(messages);alert(originalResponseText) "></button>--%>
<div id="container">
    <%
        TravelUser me;
        try
        {
            me = (TravelUser) session.getAttribute("travelUser_login");
        }
        catch (NullPointerException e)
        {
            request.setAttribute("fromUri","myFriendsServlet");
            request.getRequestDispatcher("login").forward(request,response);
            return;
        }
        TravelUser friend = null;
        try
        {
            friend=(TravelUser) request.getAttribute("friend");
        }
        catch (Exception e)
        {
            request.getRequestDispatcher("myFriendServlet").forward(request,response);
            return;
        }
    %>
    <section id="content">
        <div id="title">
            <h2>和<%=friend.getUserName()%>的聊天</h2>
        </div>
        <div id="messageBox">
            <%--<div class="me"><p></p><br><p>aaa</p></div>
            <div class="friend"><p>aaa</p></div>
            <div class="me"><p>aaa</p></div>
            <div class="friend"><p>aaa</p></div>
            <div class="me"><p>aaa</p></div>--%>
        </div>
        <script>
            function sendMessage() {

                let inputElement=document.getElementById("messageInput");
                if (inputElement.value!=="") {
                    let xmlHttpRequest = new XMLHttpRequest();
                    let uri = "sendMessageServlet?";
                    uri += "sender=<%=me.getuID()%>&receiver=<%=friend.getuID()%>&message="
                    uri += inputElement.value;
                    console.log(uri);

                    xmlHttpRequest.open("GET",uri,true);
                    xmlHttpRequest.send();
                }
            }
        </script>
        <div id="sendBox">
            <input type="text" id="messageInput"><button id="submit" onclick="sendMessage();document.getElementById('messageInput').value=''">发送</button>
        </div>
    </section>
    <script>
        var messages,originalResponseText;
        var messageBox=document.getElementById("messageBox");
        function getNewMessages() {
            let xmlHttpRequest = new XMLHttpRequest();
            console.log("messageServlet?uid1=<%=me.getuID()%>&uid2=<%=friend.getuID()%>")
            xmlHttpRequest.open("GET", "messageServlet?uid1=<%=friend.getuID()%>",true)
            xmlHttpRequest.onreadystatechange=function () {
                if (xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200) {
                    messages = JSON.parse(xmlHttpRequest.responseText);
                    originalResponseText=xmlHttpRequest.responseText;
                    /*console.log(originalResponseText)*/
                    showDialog();
                }
            }
            xmlHttpRequest.send();
        }
        function showDialog() {
            messageBox.innerHTML="";
            for (let i = messages.length-1; i >=0 ; i--) {
                let divElement=document.createElement("div");
                let str;
                if (messages[i].receiver==<%=friend.getuID()%>)
                    str="me";
                else
                    str="friend";
                divElement.setAttribute("class",str);
                let date = new Date(messages[i].sendTime)
                let dateStr= date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+"  "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
                divElement.innerHTML="<p>"+dateStr+"</p><br><p>"+messages[i].messageContent+"</p>";
                messageBox.appendChild(divElement)
            }
        }
        window.setInterval(function () {
            getNewMessages();
        },1000)
    </script>
</div>
</body>
</html>
