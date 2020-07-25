package service.impl;

import dao.impl.FriendDAO;
import pojo.entity.domain.bean.TravelUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RejectServlet", urlPatterns = {"/RejectServlet"})
public class RejectServlet extends HttpServlet
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
            request.setAttribute("fromUri","myFriendsServlet");
            request.getRequestDispatcher("login").forward(request,response);
            return;
        }
        try
        {
            int uid_apply = Integer.parseInt(request.getParameter("uid"));
            FriendDAO.clearApply(uid,uid_apply);
        }
        catch (Exception ignored)
        {

        }
        request.getRequestDispatcher("myFriendsServlet").forward(request,response);
    }
}