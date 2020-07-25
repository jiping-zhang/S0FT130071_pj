package service.impl;

import dao.impl.FavorDAO;
import dao.impl.TravelImageDAO;
import dao.impl.TravelUserDAO;
import pojo.entity.domain.bean.TravelImage;
import pojo.entity.domain.bean.TravelUser;
import sun.nio.cs.ArrayEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "friendsFavoriteServlet", urlPatterns = {"/friendsFavoriteServlet"})
public class FriendsFavoriteServlet extends HttpServlet
{
    public static final int IMAGE_PER_PAGE = 6 ;

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
            request.setAttribute("fromUri","myFavoriteServlet");
            request.getRequestDispatcher("login").forward(request,response);
            return;
        }
        int friendID;
        try
        {
            friendID=Integer.parseInt(request.getParameter("friendID"));
        }
        catch (Exception e)
        {
            request.getRequestDispatcher("myFriendsServlet").forward(request,response);
            return;
        }
        TravelUser friend = TravelUserDAO.getTravelUserByUID(friendID);
        if (friend.getAllow()==0)
        {
            request.getRequestDispatcher("myFriendsServlet").forward(request,response);
            return;
        }
        List<TravelImage> friendFavorImages = FavorDAO.getFavorList(friendID);

        int pageIndex;
        String pageIndexStr=request.getParameter("pageIndex");
        if (pageIndexStr!=null)
            pageIndex=Integer.parseInt(pageIndexStr);
        else
            pageIndex=1;
        /*try
        {
             pageIndex= Integer.parseInt(request.getParameter("pageIndex"));
        }
        catch (Exception e)
        {
            pageIndex=1;
        }*/
        int totalPages = (int)Math.ceil(((double)friendFavorImages.size())/IMAGE_PER_PAGE);
        if (pageIndex>0)
        {
            if (pageIndex<totalPages)
                friendFavorImages=friendFavorImages.subList((pageIndex-1)*IMAGE_PER_PAGE,pageIndex*IMAGE_PER_PAGE);
            else if (pageIndex==totalPages)
                friendFavorImages=friendFavorImages.subList((pageIndex-1)*IMAGE_PER_PAGE,friendFavorImages.size());
            else
                friendFavorImages=new ArrayList<>();
        }

        request.setAttribute("friend",friend);
        request.setAttribute("friendFavorImages",friendFavorImages);
        request.setAttribute("currentPageIndex",pageIndex);
        request.setAttribute("numberOfPages",totalPages);
        request.getRequestDispatcher("friendsfavorite").forward(request,response);
    }
}