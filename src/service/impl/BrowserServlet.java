package service.impl;

import dao.impl.CityDAO;
import dao.impl.CountryDAO;
import dao.impl.TravelImageDAO;
import pojo.entity.domain.bean.City;
import pojo.entity.domain.bean.Country;
import pojo.entity.domain.bean.TravelImage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "browserServlet", urlPatterns = {"/browserServlet"})
public class BrowserServlet extends HttpServlet
{
    private static final int IMAGE_PER_PAGE = 6 ;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Country country = CountryDAO.getCountryByCountryName(request.getParameter("country"));
        City city = CityDAO.getCity(request.getParameter("city"));
        String content = request.getParameter("content");
        if (content==null)
            content="0";
        int pageIndex=1;
        try
        {
             pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        }
        catch (Exception ignored)
        {

        }
        String parameterStr="content=";
        List<TravelImage> travelImages = TravelImageDAO.getAllTravelImages();
        if (!content.equals("0"))
        {
            travelImages = TravelImageDAO.filterImageByContent(travelImages, content);
            parameterStr+=content;
        }
        else
        {
            parameterStr+='0';
        }
        parameterStr+="&country=";
        if (country!=null)
        {
            travelImages = TravelImageDAO.filterImageByCountry(travelImages, country);
            parameterStr+=country.getCountryName();
            parameterStr+="&city=";
            if (city != null)
            {
                travelImages = TravelImageDAO.filterImageByCity(travelImages, city);
                parameterStr+=city.getCityName();
            }
            else
            {
                parameterStr+='0';
            }
        }
        else
        {
            parameterStr+="0&city=0";
        }
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
        request.setAttribute("parameterStr",parameterStr);
        request.getRequestDispatcher("browser").forward(request,response);
    }
}