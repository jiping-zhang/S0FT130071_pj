package service.impl;

import dao.impl.FriendDAO;
import dao.impl.TravelUserDAO;
import pojo.entity.domain.bean.TravelUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "myFriendsServlet", urlPatterns = {"/myFriendsServlet"})
public class MyFriendsServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request,response);
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
        /*Object foundUsersObj=request.getAttribute("foundUsers");
        if (foundUsersObj==null)
            request.setAttribute("foundUsers",new ArrayList<TravelUser>());*/
        String searchStr;
        if ((searchStr=request.getParameter("searchName"))!=null)
        {
            List<TravelUser> foundUsers;
            if (!searchStr.equals(""))
                foundUsers = TravelUserDAO.searchTravelUserByName(((TravelUser) (request.getSession().getAttribute("travelUser_login"))).getUserName(), searchStr);
            else
                foundUsers=new ArrayList<>();
            request.setAttribute("foundUsers", foundUsers);
        }
        List<TravelUser> myFriends= FriendDAO.getFriendList(uid);
        request.setAttribute("myFriends",myFriends);
        List<TravelUser> applyFriends=FriendDAO.getApplyList(uid);
        request.setAttribute("applyFriends",applyFriends);
        request.getRequestDispatcher("myfriends").forward(request,response);
    }
}