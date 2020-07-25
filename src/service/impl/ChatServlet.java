package service.impl;

import dao.impl.TravelUserDAO;
import pojo.entity.domain.bean.TravelUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "chatServlet", urlPatterns = {"/chatServlet"})
public class ChatServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int uid = 0 ;
        try
        {
            uid = ((TravelUser)(request.getSession().getAttribute("travelUser_login"))).getuID();
        }
        catch (Exception e)
        {
            request.setAttribute("fromUri","myPhotosServlet");
            request.getRequestDispatcher("login").forward(request,response);
            return;
        }
        int friendUid=0;
        try
        {
            friendUid=Integer.parseInt(request.getParameter("uid"));
            request.setAttribute("friend", TravelUserDAO.getTravelUserByUID(friendUid));
            request.getRequestDispatcher("chat").forward(request,response);
        }
        catch (Exception e)
        {
            request.getRequestDispatcher("myFriendsServlet").forward(request,response);
            return;
        }
    }
}