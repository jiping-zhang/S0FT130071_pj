package service.impl;

import com.google.gson.Gson;
import dao.impl.ChatDAO;
import pojo.entity.domain.bean.Message;
import pojo.entity.domain.bean.TravelUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "messageServlet", urlPatterns = {"/messageServlet"})
public class MessageServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        int uid = 0 ;
        try
        {
            uid = ((TravelUser)(request.getSession().getAttribute("travelUser_login"))).getuID();
        }
        catch (Exception e)
        {
            request.setAttribute("fromUri","myFriendsServlet");
            request.getRequestDispatcher("login").forward(request,response);
            return;
        }
        //System.out.println("收到请求");
        try
        {
            int uid1 = Integer.parseInt(request.getParameter("uid1"));
//            int uid2 = Integer.parseInt(request.getParameter("uid2"));
            List<Message> messages = ChatDAO.getMessages(uid1, uid, 10);
            Gson gson = new Gson();
            String messagesToStr = gson.toJson(messages);
            response.getWriter().write(messagesToStr);

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}