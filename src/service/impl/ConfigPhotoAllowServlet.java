package service.impl;

import com.mysql.cj.Session;
import dao.impl.TravelUserDAO;
import pojo.entity.domain.bean.TravelUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ConfigPhotoAllowServlet", urlPatterns = {"/configPhotoAllowServlet"})
public class ConfigPhotoAllowServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int uid = 0 ;
        TravelUser me;
        try
        {
            me = ((TravelUser)(request.getSession().getAttribute("travelUser_login")));
            uid = me.getuID();
        }
        catch (Exception e)
        {
            request.setAttribute("fromUri","myFriendsServlet");
            request.getRequestDispatcher("login").forward(request,response);
            return;
        }
        boolean allow = request.getParameter("allow").equals("yes");
        TravelUserDAO.updateAllow(allow,uid);
        me.setAllow(allow?1:0);
//        request.getSession().setAttribute("travelUser_login",TravelUserDAO.getTravelUserByUID(uid));
        request.getRequestDispatcher("myFriendsServlet").forward(request,response);
    }
}