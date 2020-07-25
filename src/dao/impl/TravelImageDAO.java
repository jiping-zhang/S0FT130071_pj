package dao.impl;

import dao.DAO;
import pojo.entity.domain.bean.*;

import java.util.*;

public class TravelImageDAO
{

    public static final int BY_FAVOR = 1;
    public static final int BY_TIME = 2;
    public static final int BY_TITLE = 5;
    public static final int BY_DESCRIPTION = 6;

    /*public static List<TravelImage> travelImages = new DAO<TravelImage>(TravelImage.class).getResultList(
            "select ImageID imageID,Title title,Description description,CityCode cityCode,CountryCode countryCode,UID uid,path path,Content content,Favor favor from travelimage order by favor desc");*/

    public static void addImageIntoSQL(TravelImage travelImage)
    {
        String sql = "insert into travelimage (Title,Description,Content,CountryCode,CityCode,UID,path,date) values (?,?,?,?,?,?,?,?)";
        new DAO<TravelImage>(TravelImage.class).update(sql, travelImage.getTitle(), travelImage.getDescription(), travelImage.getContent(), travelImage.getCountryCode(), travelImage.getCityCode(), travelImage.getuID(), travelImage.getPath(), travelImage.getDate());
    }

    public static List<TravelImage> filterImageByContent(List<TravelImage> initialList, String content)
    {
        try
        {
            ArrayList<TravelImage> outputList = new ArrayList<>();
            for (TravelImage travelImage : initialList)
            {
                if (travelImage.getContent().equals(content))
                    outputList.add(travelImage.getClone());
            }
            return outputList;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public static List<TravelImage> filterImageByCountry(List<TravelImage> initialList, Country country)
    {
        return filterImageByCountry(initialList, country.getCountryCode());
    }

    public static List<TravelImage> filterImageByCountry(List<TravelImage> initialList, String countryCode)
    {
        try
        {
            ArrayList<TravelImage> outputList = new ArrayList<>();
            for (TravelImage travelImage : initialList)
            {
                if (travelImage.getCountryCode().equals(countryCode))
                    outputList.add(travelImage.getClone());
            }
            return outputList;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public static List<TravelImage> filterImageByCity(List<TravelImage> initialList, City city)
    {
        return filterImageByCity(initialList, city.getCityCode());
    }

    public static List<TravelImage> filterImageByCity(List<TravelImage> initialList, int cityCode)
    {
        try
        {
            ArrayList<TravelImage> outputList = new ArrayList<>();
            for (TravelImage travelImage : initialList)
            {
                if (travelImage.getCityCode() == cityCode)
                    outputList.add(travelImage.getClone());
            }
            return outputList;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public static TravelImage getImageByImageID(int imageID)
    {
        return new DAO<TravelImage>(TravelImage.class).get("select imageID,title,description,cityCode,countryCode,uID,path,content,favor,date from travelimage where imageID=?", imageID);
    }

    public static List<TravelImage> getAllTravelImages()
    {
        return new DAO<TravelImage>(TravelImage.class).getResultList("select imageID,title,description,cityCode,countryCode,uID,path,content,favor,date from travelimage");
    }

    public static List<TravelImage> getAllTravelImages(int searchMode)
    {
        return new DAO<TravelImage>(TravelImage.class).getResultList("select imageID,title,description,cityCode,countryCode,uID,path,content,favor,date from travelimage order by " + (searchMode == BY_FAVOR ? "favor" : "date") + " desc");
    }

    public static List<TravelImage> getTravelImages(int uid)
    {
        return new DAO<TravelImage>(TravelImage.class).getResultList("select imageID,title,description,cityCode,countryCode,uID,path,content,favor,date from travelimage where uID=?", uid);
    }

    public static void addFavor(int imageID)
    {
        int favorTimes = getImageByImageID(imageID).getFavor();
        favorTimes++;
        String sql = "update travelimage set Favor = ? where ImageID = ?";
        new DAO<TravelImage>(TravelImage.class).update(sql, favorTimes, imageID);
    }

    public static void decreaseFavor(int imageID)
    {
        int favorTimes = getImageByImageID(imageID).getFavor();
        favorTimes--;
        String sql = "update travelimage set Favor = ? where ImageID = ?";
        new DAO<TravelImage>(TravelImage.class).update(sql, favorTimes, imageID);
    }

    public static List<TravelImage> searchImages(List<String> keyWords, int searchMethod, int sortMode)
    {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("%");
        for (String keyWord : keyWords)
        {
            stringBuilder.append(keyWord).append("%");
        }
        String searchString = stringBuilder.toString();
        String searchMethodStr = ((searchMethod == BY_TITLE) ? "title" : "description");
        String sql = "select imageID,title,description,cityCode,countryCode,uID,path,content,favor,date from travelimage where " + searchMethodStr + " like ? ";
        sql += (sortMode == BY_FAVOR ? "order by favor desc" : "order by date desc");
        List<TravelImage> matchImages = new DAO<TravelImage>(TravelImage.class).getResultList(sql, searchString);
        if (matchImages.size() >= 6)
            return matchImages;
        else
        {
            //System.out.println("by single word");
            sql = "select imageID,title,description,cityCode,countryCode,uID,path,content,favor,date from travelimage where " + searchMethodStr + " like ";
            StringBuilder sb = new StringBuilder();
            for (String keyWord : keyWords)
                sb.append("or '%").append(keyWord).append("%' ");
            sql += sb.toString().substring(2);
            sql += (sortMode == BY_FAVOR ? "order by favor desc" : "order by date desc");
            List<TravelImage> partlyMatchImages = new DAO<TravelImage>(TravelImage.class).getResultList(sql);
            append(matchImages,partlyMatchImages);
            if (matchImages.size() >= 6)
                return matchImages;
            else
            {
                //System.out.println("spell mistake");
                ArrayList<TravelImage> lowMatchImages = new ArrayList<>();
                for (String keyWord : keyWords)
                {
                    for (int i = 0; i <= (keyWord.length() - 2); i++)
                    {
                        String keyWordCopy = "%"+keyWord.substring(0, i) + "%" + keyWord.substring(i + 1)+"%";
                        //System.out.println(keyWordCopy);
                        sql = "select imageID,title,description,cityCode,countryCode,uID,path,content,favor,date from travelimage where " + searchMethodStr + " like ?";
                        append(lowMatchImages,new DAO<TravelImage>(TravelImage.class).getResultList(sql,keyWordCopy));
                    }
                }
                lowMatchImages.sort(new Comparator<TravelImage>()
                {
                    @Override
                    public int compare(TravelImage o1, TravelImage o2)
                    {
                        if (sortMode==BY_TIME)
                        {
                            if (o1.getDate()<o2.getDate())
                                return 1;
                            else if (o1.getDate()==o2.getDate())
                                return 0;
                            else 
                                return -1;
                        }
                        else 
                        {
                            if (o1.getFavor()<o2.getFavor())
                                return 1;
                            else if (o1.getFavor()==o2.getFavor())
                                return 0;
                            else
                                return -1;
                        }
                    }
                });
                append(matchImages,lowMatchImages);
                return matchImages;
            }
        }
    }

    private static void append(List<TravelImage> originalList , List<TravelImage> addList)
    {
        int size = originalList.size();
        for (TravelImage addImage : addList)
        {
            boolean exist = false ;
            for (int i = 0 ; i < size ; i++)
            {
                if (originalList.get(i).getImageID()==addImage.getImageID())
                {
                    exist = true;
                    break;
                }
            }
            if (!exist)
                originalList.add(addImage);
        }
    }

    public static List<TravelImage> searchImages(String keyWordStr, int searchMethod, int sortMode)
    {
        ArrayList<String> keyWords = new ArrayList<>();
        StringTokenizer stringTokenizer = new StringTokenizer(keyWordStr, " ");
        while (stringTokenizer.hasMoreElements())
            keyWords.add(stringTokenizer.nextToken());
        return searchImages(keyWords, searchMethod, sortMode);
    }

    public static void delete(int imageID)
    {
        new DAO<TravelImage>(TravelImage.class).update("delete from travelimage where ImageID=?", imageID);
        FavorDAO.deleteImageAndFavor(imageID);
        HistoryDAO.deleteHistory(imageID);
    }

    public static ArrayList<Long> getImageNumberIndex()
    {
        ArrayList<Long> indexes = new ArrayList<>();
        for (TravelImage travelImage : getAllTravelImages())
        {
            String path = travelImage.getPath();
            if (path != null)
            {
                int dotPosition = path.indexOf('.');
                indexes.add(Long.parseLong(path.substring(0, dotPosition)));
            }
        }
        indexes.sort(Long::compareTo);
        return indexes;
    }

    public static void editPhoto(TravelImage editedImage)
    {
        String sql = "update travelimage set Title = ? , Description = ? , CityCode = ? , CountryCode = ? , path = ? , content = ? , date = ? where ImageID = ?";
        new DAO<TravelImage>(TravelImage.class).update(sql, editedImage.getTitle(), editedImage.getDescription(), editedImage.getCityCode(), editedImage.getCountryCode(), editedImage.getPath(), editedImage.getContent(), editedImage.getDate(), editedImage.getImageID());
    }

    public static void main(String[] args)
    {
        /*String[] keyWords={"b","a"};
        for (TravelImage travelImage : selectByDescription(keyWords,BY_DESCRIPTION,BY_FAVOR))
            System.out.println(travelImage.getFavor()+"   "+travelImage.getDescription());*/
        /*TravelImage editedImage = new TravelImage();
        editedImage.setImageID(83);
        editedImage.setTitle("test");
        editedImage.setDescription("test");
        editedImage.setCityCode(123456);
        editedImage.setCountryCode("AS");
        editedImage.setPath("asshole.jpg");
        editedImage.setContent("scenery");
        editedImage.setDate(new Date().getTime());
        editPhoto(editedImage);*/
        /*for(TravelImage travelImage : searchImages("naw",BY_DESCRIPTION,BY_FAVOR))
            System.out.println(travelImage);*/
    }
}
