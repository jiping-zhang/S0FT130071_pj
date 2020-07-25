package service.impl;

import dao.impl.TravelImageDAO;
import pojo.entity.domain.bean.TravelImage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "welcomeServlet", urlPatterns = {"/welcomeServlet"})
public class WelcomeServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<TravelImage> mostFavoredImages= TravelImageDAO.getAllTravelImages(TravelImageDAO.BY_FAVOR);
        mostFavoredImages=mostFavoredImages.subList(0,6);
        List<TravelImage> latestImages=TravelImageDAO.getAllTravelImages(TravelImageDAO.BY_TIME);
        latestImages=latestImages.subList(0,6);
        request.setAttribute("mostFavoredImages",mostFavoredImages);
        request.setAttribute("latestImages",latestImages);
        request.getRequestDispatcher("welcome").forward(request,response);
    }
}