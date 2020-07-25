<%--
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
    <link href="css/pages/login&signUpCont.css" rel="stylesheet" type="text/css">
    <script src="js/submitCheck.js" type="text/javascript" rel="script" defer></script>
    <link rel="stylesheet" href="js/sliderStyle.css">
    <script type="text/javascript" src="js/slider.js"></script>
    <script src="js/passwordIntensity.js" type="text/javascript" rel="script" defer></script>
    <title>sign up</title>
</head>
<body>
<section id="content">
    <%
        Object errorMessage = request.getAttribute("errorMessage");
        String errorMessageStr="";
        boolean hasError = (errorMessage!=null);
        if (hasError)
            errorMessageStr=((String)errorMessage);
    %>
    <script>
        <%= hasError?("alert('"+errorMessageStr+"')"):"" %>
    </script>
    <form action="signUpServlet" method="post" id="signUpForm">
        <table>
            <tr>
                <td><p>输入用户名</p></td>
                <td><input type="text" name="nickName" id="nickName" required onblur="nickNameCheck();"
                           pattern="[A-Za-z0-9_]{6,16}"  <%=hasError?("value=\""+request.getParameter("nickName")+"\""):""%>></td>
                <td colspan="2"><p id="wrongNickName">昵称需由6-16位 字母或数字或_ 组成</p></td>
            </tr>
            <tr>
                <td><p>输入邮箱名</p></td>
                <td><input type="text" name="userName" id="userName" required onblur="userNameCheck();"
                           pattern="\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}" <%=hasError?("value=\""+request.getParameter("userName")+"\""):""%>></td>
                <td colspan="2"><p id="wrongUserName">邮箱名需为正确的邮箱地址</p></td>
            </tr>
            <tr>
                <td><p>输入密码</p></td>
                <td><input type="password" name="password" id="password" onblur="passwordCheck();rePasswordCheck()"
                           onkeyup="passwordCheck();rePasswordCheck()" required="required"
                           pattern="[0-9a-zA-Z]{8,17}"></td>
                <td colspan="2"><p id="wrongPw">密码需由8-16位 英语字母或数字 组成</p></td>
            </tr>
            <tr>
                <td></td>
                <td><span style="color: #d1f8ff">密码强度: </span><span id="intensity"></span></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><p>确认密码</p></td>
                <td><input type="password" name="rePassword" id="rePassword" onblur="rePasswordCheck()"
                           onkeyup="rePasswordCheck()"
                           required="required" pattern="[0-9a-zA-Z]{8,17}"></td>
                <td colspan="2"><p id="wrongRePw">两次输入的密码不一样</p></td>
            </tr>
            <tr>
                <td><p>滑动图片</p></td>
                <td colspan="3">
                    <div class="hidden">
                        <input type="number" id="imgCheckInput" value="0">
                    </div>
                    <div id="slideBar"></div>
                    <p id="imgCheck" style="color: #e9ffe0">　&nbsp;</p>
                </td>
                <script type="text/javascript">
                    var dataList = ["0", "1"];
                    var options = {
                        dataList: dataList,
                        success: function ()
                        {
                            console.log("show");
                            document.getElementById("imgCheckInput").value = 1;
                            document.getElementById("imgCheck").innerHTML = "验证通过";
                        },
                        fail: function ()
                        {
                            console.log("fail");
                        }
                    };
                    SliderBar("slideBar", options);
                </script>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><input type="button" class="submitBt" value="提交" onclick="submitForm()"></td>
                <td></td>
            </tr>
        </table>
    </form>
</section>
</body>
</html>
