package service.impl;

import dao.impl.HistoryDAO;
import dao.impl.TravelImageDAO;
import dao.impl.TravelUserDAO;
import pojo.entity.domain.bean.TravelImage;
import pojo.entity.domain.bean.TravelUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "detailServlet", urlPatterns = {"/detailServlet"})
public class DetailServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        TravelImage travelImage = TravelImageDAO.getImageByImageID(Integer.parseInt(request.getParameter("imageID")));
        request.setAttribute("travelImage",travelImage);

        try
        {
            int uid = ((TravelUser)(request.getSession().getAttribute("travelUser_login"))).getuID();
            HistoryDAO.record(uid,travelImage.getImageID());
        }
        catch (Exception ignored)
        {

        }

        TravelUser travelUser = TravelUserDAO.getTravelUserByUID(travelImage.getuID());
        request.setAttribute("travelUser",travelUser);
        request.getRequestDispatcher("detail").forward(request,response);
    }
}