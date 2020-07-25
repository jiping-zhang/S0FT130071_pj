package test.junit;

import dao.DAO;
import dao.impl.TravelImageDAO;
import dao.impl.TravelUserDAO;
import pojo.entity.domain.bean.TravelUser;
import service.impl.UploadServlet;
import utlis.GetProjectDictroyPath;
import utlis.SHA256;

import java.util.ArrayList;
import java.util.List;


public class Test
{

    public static final String IMAGE_FOLDER_PATH= GetProjectDictroyPath.getPackageString()+"web/sources/img/";

    public static String getRandomFileName(String fileName)
    {
        System.out.println(fileName);
        int dotPosition = fileName.indexOf('.');
        String suffix = fileName.substring(dotPosition);
        ArrayList<Long> existingIndex = TravelImageDAO.getImageNumberIndex();
        System.out.println(existingIndex);
        long newIndex = 0 ;
        // 1000000000, 10000000000
        do
        {
            newIndex=randomLong(100000000, 1000000000);
            System.out.println(newIndex);
        }while (existingIndex.contains(newIndex));
        return (newIndex+suffix);
    }

    private static long randomLong(long min , long  max)
    {
        return (((long) (Math.random()*(max-min)))+min);
    }

    public static void main(String[] args)
    {
        getRandomFileName("大傻逼.jpg");
    }
}
