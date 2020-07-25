package dao.impl;

import dao.DAO;
import pojo.entity.domain.bean.History;
import pojo.entity.domain.bean.TravelImage;
import pojo.entity.domain.bean.TravelUser;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HistoryDAO
{
    public static void generateTable(int uid)
    {
        String tableName = uid+"history";
        String sql = "create table "+tableName+" (time bigint , imageID int)";
        new DAO<Object>(Object.class).update(sql);
    }

    private static List<History> getHistory(int uid)
    {
        String tableName = uid+"history";
        String sql = "select imageID , time from "+tableName+" order by time desc limit 10";
        return ((new DAO<History>(History.class)).getResultList(sql));
    }

    private static boolean hasViewed(int uid , int imageID)
    {
        String tableName = uid+"history";
        String sql = "select imageID , time from "+tableName+" where imageID = ?";
        return (((new DAO<History>(History.class)).get(sql,imageID))!=null);
    }

    private static void insert(int uid , int imageID)
    {
        String tableName = uid+"history";
        String sql = "insert into "+tableName+" (imageID,time) values (?,?)";
        new DAO(Object.class).update(sql,imageID,new Date().getTime());
    }

    private static void update(int uid , int imageID)
    {
        String tableName = uid+"history";
        String sql = "update "+tableName+" set time = ? where imageID = ? ";
        new DAO(Object.class).update(sql,new Date().getTime(),imageID);
    }

    public static List<TravelImage> getHistoryImages(int uid)
    {
        List<TravelImage> historyImages = new ArrayList<>();
        for (History history:getHistory(uid))
            historyImages.add(TravelImageDAO.getImageByImageID(history.getImageID()));
        return historyImages;
    }

    public static void record(int uid , int imageID)
    {
        if (hasViewed(uid,imageID))
        {
            update(uid,imageID);
        }
        else
        {
            insert(uid,imageID);
        }
    }

    public static void deleteHistory(int imageID)
    {
        List<TravelUser> allUsers = TravelUserDAO.getTravelUsers();
        for (TravelUser travelUser : allUsers)
        {
            String tableName = travelUser.getuID()+"history";
            String sql = "delete from "+tableName+" where imageID = ?";
            new DAO<>(Object.class).update(sql,imageID);
        }
    }
}
