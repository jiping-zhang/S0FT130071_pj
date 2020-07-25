package dao.impl;

import dao.DAO;
import pojo.entity.domain.bean.Message;

import java.util.Date;
import java.util.List;

public class ChatDAO
{
    public static void generateTable(int uid1 , int uid2)
    {
        int temp ;
        if (uid1>uid2)
        {
            temp=uid1;
            uid1=uid2;
            uid2=temp;
        }
        String tableName = uid1+"and"+uid2;
        String sql = "create table "+tableName+" (Sender int(11) ,Receiver int(11) ,SendTime bigint(20) ,MessageContent varchar(255))";

        new DAO<Message>(Message.class).update(sql);
    }

    public static List<Message> getMessages(int uid1 , int uid2 , int limit)
    {
        if (uid1==uid2)
            return null;
        int temp ;
        if (uid1>uid2)
        {
            temp=uid1;
            uid1=uid2;
            uid2=temp;
        }
        String tableName = uid1+"and"+uid2;
        String sql = "select sender , receiver , sendTime , messageContent from "+tableName+" order by sendTime desc limit "+limit;
        List<Message> messages=new DAO<Message>(Message.class).getResultList(sql);
        return messages;
    }

    public static void insertMessage(int uid_sender, int uid_receiver , String messageContent)
    {
        String tableName=Math.min(uid_sender,uid_receiver)+"and"+Math.max(uid_sender,uid_receiver);
        new DAO<Message>(Message.class).update("insert into "+tableName+" (sender,receiver,sendTime,messageContent) values (?,?,?,?)",uid_sender,uid_receiver,(new Date().getTime()),messageContent);
    }
}
