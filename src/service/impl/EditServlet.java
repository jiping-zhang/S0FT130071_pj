package service.impl;

import dao.impl.CityDAO;
import dao.impl.CountryDAO;
import dao.impl.TravelImageDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pojo.entity.domain.bean.TravelImage;
import pojo.entity.domain.bean.TravelUser;
import utlis.GetProjectDictroyPath;
import utlis.SafeReplace;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static service.impl.UploadServlet.IMAGE_FOLDER_PATH_IN_PJ;

@WebServlet(name = "editServlet", urlPatterns = {"/editServlet"})
public class EditServlet extends HttpServlet
{
    //public static final String IMAGE_FOLDER_PATH= GetProjectDictroyPath.getPackageString()+"web\\sources\\img\\";

    public static String getRandomFileName(String fileName)
    {
        int dotPosition = fileName.indexOf('.');
        String suffix = fileName.substring(dotPosition);
        ArrayList<Long> existingIndex = TravelImageDAO.getImageNumberIndex();
        long newIndex = 0 ;
        // 1000000000, 10000000000
        do
        {
            newIndex=randomLong(100000000, 1000000000);
        }while (existingIndex.contains(newIndex));
        return (newIndex+suffix);
    }

    private static long randomLong(long min , long  max)
    {
        return (((long) (Math.random()*(max-min)))+min);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int uid = 0;
        try
        {
            uid = ((TravelUser)(request.getSession().getAttribute("travelUser_login"))).getuID();
        }
        catch (Exception e)
        {
            request.setAttribute("fromUri","upload");
            request.getRequestDispatcher("login").forward(request,response);
            return;
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //factory.setSizeThreshold(1024*1024*16);
        ServletFileUpload upload = new ServletFileUpload(factory);
        try
        {
            List<FileItem> fileItems = upload.parseRequest(request);
            String path="" , content="" , countryCodeISO = "",cityName="" , title="",description = ""  ;
            int cityCode=0,imageID=0;
            long date;
            for (FileItem fileItem : fileItems)
            {
                if (fileItem.isFormField())
                {
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (name.equals("imageID"))
                        imageID=Integer.parseInt(value);
                    else if (name.equals("content"))
                        content=value;
                    else if (name.equals("country"))
                        countryCodeISO= CountryDAO.getCountryByCountryName(value).getCountryCode();
                    else if (name.equals("city"))
                        cityName=value;
                    else if (name.equals("title"))
                        title=value;
                    else if (name.equals("description"))
                        description=value;
                }
                else
                {
                    String name = fileItem.getFieldName();
                    String fileName = fileItem.getName();
                    String contType = fileItem.getContentType();
                    long sizeInByte=fileItem.getSize();
                    InputStream is = fileItem.getInputStream();
                    System.out.println("name:"+name);
                    System.out.println("fileName:"+fileName);
                    System.out.println("contType:"+contType);
                    System.out.println("sizeInByte:"+sizeInByte);
                    System.out.println("InputStream:"+is);


                    if (sizeInByte>0)
                    {
                        path = getRandomFileName(fileName);
                        String absolutePath=(request.getServletContext().getRealPath("/")+IMAGE_FOLDER_PATH_IN_PJ+path);
                        OutputStream os = new FileOutputStream(absolutePath);

                        byte[] buffer = new byte[1024];
                        int len = 0;

                        while ((len = is.read(buffer)) != -1)
                        {
                            os.write(buffer, 0, len);
                        }
                        os.close();
                    }
                    else
                        path=TravelImageDAO.getImageByImageID(imageID).getPath();
                    is.close();
                }
            }
            cityCode= CityDAO.getCity(countryCodeISO,cityName).getCityCode();
            description= SafeReplace.replace(description);
            title=SafeReplace.replace(title);
            date=new Date().getTime();
            TravelImage travelImage = new TravelImage();
            travelImage.setPath(path);
            travelImage.setCityCode(cityCode);
            travelImage.setContent(content);
            travelImage.setCountryCode(countryCodeISO);
            travelImage.setDate(date);
            travelImage.setDescription(description);
            travelImage.setTitle(title);
            travelImage.setuID(uid);
            travelImage.setImageID(imageID);
            TravelImageDAO.editPhoto(travelImage);
            //TravelImageDAO.
        }
        catch (FileUploadException e)
        {
            e.printStackTrace();
        }
        request.getRequestDispatcher("myPhotosServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

}