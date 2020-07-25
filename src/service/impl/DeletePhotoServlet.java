package service.impl;

import dao.impl.TravelImageDAO;
import pojo.entity.domain.bean.TravelImage;
import pojo.entity.domain.bean.TravelUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "deletePhotoServlet", urlPatterns = {"/deletePhotoServlet"})
public class DeletePhotoServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int uid = 0, imageID = 0;
        try
        {
            uid = ((TravelUser) (request.getSession().getAttribute("travelUser_login"))).getuID();
        }
        catch (Exception e)
        {
            request.setAttribute("fromUri", "myPhotosServlet");
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }
        try
        {
            imageID = Integer.parseInt(request.getParameter("imageID"));
        }
        catch (Exception e)
        {
            request.getRequestDispatcher("myPhotosServlet").forward(request, response);
        }
        TravelImage travelImage = TravelImageDAO.getImageByImageID(imageID);
        if (travelImage != null)
            if (travelImage.getuID() == uid)
                TravelImageDAO.delete(imageID);
        request.getRequestDispatcher("myPhotosServlet").forward(request, response);

    }
}