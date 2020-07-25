package dao.impl;

import dao.DAO;
import pojo.entity.domain.bean.TravelUser;
import utlis.SHA256;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class TravelUserDAO
{
    //public static List<TravelUser> travelUsers=((new DAO<TravelUser>(TravelUser.class)).getResultList( "select uID,Email email,UserName userName,Pass pass from traveluser "));

    public static List<TravelUser> getTravelUsers()
    {
        return new DAO<TravelUser>(TravelUser.class).getResultList("select uID,Email email,UserName userName,Pass pass,allow from traveluser ");
    }

    public static TravelUser getTravelUserByUID(int uid)
    {
        return new DAO<TravelUser>(TravelUser.class).get("select uID,Email email,UserName userName,Pass pass,allow from traveluser where uID=?",uid);
    }

    public static List<TravelUser> getTravelUserByUID(List<Integer> uid)
    {
        String sql = "select uID,Email email,UserName userName,Pass pass,allow allow from traveluser where ";
        if (uid.size()>0)
        {
            StringBuilder sb = new StringBuilder();
            for (int value : uid)
            {
                sb.append(" or uID=").append(value);
            }
            sql += sb.toString().substring(3);
            //System.out.println(sql);
            return new DAO<TravelUser>(TravelUser.class).getResultList(sql);
        }
        else
            return new ArrayList<>();
    }

    public static List<TravelUser> searchTravelUserByName(String name_self,List<String> keyWords)
    {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("%");
        for (String keyWord : keyWords)
        {
            stringBuilder.append(keyWord).append("%");
        }
        String searchString = stringBuilder.toString();
        String sql = "select uID,Email email,UserName userName,Pass pass,allow allow from traveluser where userName like ? and userName != ? ";
        return new DAO<TravelUser>(TravelUser.class).getResultList(sql,searchString,name_self);
    }

    public static List<TravelUser> searchTravelUserByName(String name_self,String keyWordsStr)
    {
        StringTokenizer stringTokenizer = new StringTokenizer(keyWordsStr," ");
        List<String> keyWords=new ArrayList<>();
        while (stringTokenizer.hasMoreElements())
        {
            keyWords.add(stringTokenizer.nextToken());
        }
        return searchTravelUserByName(name_self,keyWords);
    }

    public static TravelUser getTravelUserByEmail(String email)
    {
        return new DAO<TravelUser>(TravelUser.class).get("select uID,Email email,UserName userName,Pass pass,allow from traveluser where email=?",email);
    }

    public static TravelUser addNewUserIntoSQL(TravelUser travelUser)
    {
        String sql = "insert into traveluser (Email ,UserName , Pass , State) values (?,?,?,1)";
        new DAO<TravelUser>(TravelUser.class).update(sql,travelUser.getEmail(),travelUser.getUserName(),travelUser.getPass());
        TravelUser thisUser = getTravelUserByEmail(travelUser.getEmail());
        HistoryDAO.generateTable(thisUser.getuID());
        return thisUser;
    }

    public static boolean existUserName(String userName)
    {
        return (((new DAO<TravelUser>(TravelImageDAO.class)).get("select uID,Email email,UserName userName,Pass pass,allow from traveluser where userName=?",userName))!=null);
    }

    public static boolean existEmail(String email)
    {
        return (((new DAO<TravelUser>(TravelImageDAO.class)).get("select uID,Email email,UserName userName,Pass pass,allow from traveluser where email=?",email))!=null);
    }

    public static void updateAllow(boolean allow,int uid)
    {
        new DAO<TravelUser>(TravelUser.class).update("update traveluser set allow = ? where UID = ?" , (allow?1:0),uid);
    }

    public static void main(String[] args)
    {
        for (TravelUser travelUser :getTravelUsers())
        {
            String pass = SHA256.sha256Hex(("abcd1234"+travelUser.getEmail()));
            new DAO<TravelUser>(TravelUser.class).update("update traveluser set Pass = ? where UID = ?",pass,travelUser.getuID());
        }
    }
}
