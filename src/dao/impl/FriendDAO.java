package dao.impl;

import dao.DAO;
import pojo.entity.domain.bean.Apply;
import pojo.entity.domain.bean.Friend;
import pojo.entity.domain.bean.TravelImage;
import pojo.entity.domain.bean.TravelUser;

import java.util.ArrayList;
import java.util.List;

public class FriendDAO
{
    public static void applyTo(int uid_receive,int uid_apply)
    {
        if (new DAO<Apply>(Apply.class).get("select uidapply uidApply,uidreceive uidReceive from friendapply where uidApply = ? and uidReceive = ?",uid_apply,uid_receive)==null)
            new DAO<Apply>(Apply.class).update("insert into friendapply (uidapply,uidreceive) values (?,?)",uid_apply,uid_receive);
    }

    public static void becomeFriends(int uid1 , int uid2)
    {
        String sql = "insert into friend (uid1,uid2) values (?,?)";
        new DAO<Object>(Object.class).update(sql,uid1,uid2);
        new DAO<Object>(Object.class).update(sql,uid2,uid1);
        ChatDAO.generateTable(uid1,uid2);
    }

    public static void clearApply(int uid_receive,int uid_apply)
    {
        new DAO<>(Object.class).update("delete from friendapply where uidapply=? and uidreceive=?",uid_apply,uid_receive);
    }

    public static List<TravelUser> getFriendList(int uid)
    {
        List<Friend> friendsInfo=new DAO<Friend>(Friend.class).getResultList("select uid1,uid2 from friend where uid1 = ?",uid);
        List<Integer> friendIDs = new ArrayList<>();
        for (Friend friendInfo : friendsInfo)
        {
            friendIDs.add(friendInfo.getUid2());
        }
        return TravelUserDAO.getTravelUserByUID(friendIDs);
    }

    public static List<TravelUser> getApplyList(int uid)
    {
        List<Integer> applierIDs=new ArrayList<>();
        List<Apply> applyList = new DAO<Apply>(Apply.class).getResultList("select uidapply uidApply,uidreceive uidReceive from friendapply where uidReceive = ?",uid);
        for (Apply apply:applyList)
        {
            applierIDs.add(apply.getUidApply());
        }
        return TravelUserDAO.getTravelUserByUID(applierIDs);
    }
}
