package service.impl;

import dao.impl.FavorDAO;
import dao.impl.TravelImageDAO;
import pojo.entity.domain.bean.TravelImage;
import pojo.entity.domain.bean.TravelUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "myPhotosServlet", urlPatterns = {"/myPhotosServlet"})
public class MyPhotosServlet extends HttpServlet
{
    private static final int IMAGE_PER_PAGE=6;

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
            request.setAttribute("fromUri","myPhotosServlet");
            request.getRequestDispatcher("login").forward(request,response);
            return;
        }
        int pageIndex;
        String pageIndexStr=request.getParameter("pageIndex");
        if (pageIndexStr!=null)
            pageIndex=Integer.parseInt(pageIndexStr);
        else
            pageIndex=1;
        List<TravelImage> travelImages = TravelImageDAO.getTravelImages(uid);
        int totalPages = (int)Math.ceil(((double)travelImages.size())/IMAGE_PER_PAGE);
        if (pageIndex>0)
        {
            if (pageIndex<totalPages)
                travelImages=travelImages.subList((pageIndex-1)*IMAGE_PER_PAGE,pageIndex*IMAGE_PER_PAGE);
            else if (pageIndex==totalPages)
                travelImages=travelImages.subList((pageIndex-1)*IMAGE_PER_PAGE,travelImages.size());
            else
                travelImages=new ArrayList<>();
        }
//            travelImages=travelImages.subList((pageIndex-1)*IMAGE_PER_PAGE,pageIndex*IMAGE_PER_PAGE-1);
        request.setAttribute("travelImages",travelImages);
        request.setAttribute("currentPageIndex",pageIndex);
        request.setAttribute("numberOfPages",totalPages);
        request.getRequestDispatcher("myphotos").forward(request,response);
    }
}