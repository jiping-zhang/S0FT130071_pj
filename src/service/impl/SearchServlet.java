package service.impl;

import dao.impl.TravelImageDAO;
import pojo.entity.domain.bean.TravelImage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "searchServlet", urlPatterns = {"/searchServlet"})
public class SearchServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<TravelImage> travelImages = null;
        String sortMode = request.getParameter("sortMethod");
        boolean byFavor=true;
        if (sortMode!=null&&sortMode.equals("time"))
            byFavor=false;
        String searchMethod = request.getParameter("searchMethod");
        if (searchMethod!=null)
        {
            if (searchMethod.equals("title"))
            {
                String title = request.getParameter("title");
                title=title.replaceAll("'"," ");
                travelImages = TravelImageDAO.searchImages(title,TravelImageDAO.BY_TITLE,byFavor?TravelImageDAO.BY_FAVOR:TravelImageDAO.BY_TIME);
            }
            else
            {
                String description= request.getParameter("description");
                description=description.replaceAll("'"," ");
                travelImages = TravelImageDAO.searchImages(description,TravelImageDAO.BY_DESCRIPTION,byFavor?TravelImageDAO.BY_FAVOR:TravelImageDAO.BY_TIME);
            }
        }
        else
        {
            travelImages=new ArrayList<>();
        }
        request.setAttribute("travelImages",travelImages);
        request.getRequestDispatcher("search").forward(request,response);
    }
}