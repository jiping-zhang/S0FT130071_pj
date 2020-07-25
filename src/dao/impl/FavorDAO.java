package dao.impl;

import dao.DAO;
import pojo.entity.domain.bean.Favor;
import pojo.entity.domain.bean.TravelImage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class FavorDAO
{
    /*public static Map<Integer, ArrayList<Integer>> getFavorInfos()
    {
        List<Favor> favors = new DAO<Favor>(Favor.class).getResultList("select FavorID favorID,UID uID ,ImageID imageID from travelimagefavor");
        Map<Integer,ArrayList<Integer>>
        for (Favor favor : favors)
        {
            if ()
        }
    }*/

    public static List<TravelImage> getFavorList (int uid)
    {
        List<Favor> favors = new DAO<Favor>(Favor.class).getResultList("select FavorID favorID,UID uID ,ImageID imageID from travelimagefavor where uID=?",uid);
        List<TravelImage> favorImages = new ArrayList<>();
        for (Favor favor:favors)
        {
            favorImages.add(TravelImageDAO.getImageByImageID(favor.getImageID()));
        }
        return favorImages;
    }

    public static boolean isFavor(int uid , int imageID)
    {
        return ((new DAO<Favor>(Favor.class).get("select FavorID favorID,UID uID ,ImageID imageID from travelimagefavor where uID=? and imageID=?",uid,imageID))!=null);
    }

    public static void addFavor(int uid , int imageID)
    {
        String sql = "insert into travelimagefavor (UID,ImageID) values (?,?)";
        new DAO<Favor>(Favor.class).update(sql,uid,imageID);
        TravelImageDAO.addFavor(imageID);
    }

    public static void deleteFavor(int uid , int imageID)
    {
        String sql = "delete from travelimagefavor where UID=? and ImageID=?";
        new DAO<Favor>(Favor.class).update(sql,uid,imageID);
        TravelImageDAO.decreaseFavor(imageID);
    }

    public static void deleteImageAndFavor(int imageID)
    {
        new DAO<Favor>(Favor.class).update("delete from travelimagefavor where ImageID=?",imageID);
    }
}
