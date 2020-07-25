package pojo.entity.domain.bean;

import dao.DAO;

public class TravelUser
{

    private int uID,state,allow;
    private String email,userName,pass;

    public TravelUser()
    {

    }

    public TravelUser(int uID, String email, String userName, String pass)
    {
        this.uID=uID;
        this.state = 1;
        this.email = email;
        this.userName = userName;
        this.pass = pass;
    }

    public TravelUser(String email, String userName, String pass, int state)
    {
        this.state = state;
        this.email = email;
        this.userName = userName;
        this.pass = pass;
    }

    public TravelUser(String email, String userName, String pass)
    {
        this(email, userName,pass,1);
    }

    public int getuID()
    {
        return uID;
    }

    public void setuID(int uID)
    {
        this.uID = uID;
    }

    public int getState()
    {
        return state;
    }

    public void setState(int state)
    {
        this.state = state;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getPass()
    {
        return pass;
    }

    public void setPass(String pass)
    {
        this.pass = pass;
    }

    public int getAllow()
    {
        return allow;
    }
    public void setAllow(int allow)
    {
        this.allow = allow;
    }

    @Override
    public String toString()
    {
        return "TravelUser{" +
                "uID=" + uID +
                ", state=" + state +
                ", allow=" + allow +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", pass='" + pass + '\'' +
                '}';
    }



    /*
    public void addThisUserToSQL()
    {
        String sql = "insert into traveluser (Email,UserName,Pass,State) values "+"("+"'"+email+"'"+","+"'"+userName+"'"+","+"'"+pass+"'"+","+state+")";
        JDBCUtils.update(sql);
    }
*/

/*    public static void addUserToSQL(TravelUser travelUser)
    {
        travelUser.addThisUserToSQL();
    }*/

/*    public static ArrayList<TravelUser> getUsersByResultSet(ResultSet resultSet)
    {
        ArrayList<TravelUser> travelUsers=new ArrayList<>();
        try
        {
            while (resultSet.next())
            {
                travelUsers.add(new TravelUser(resultSet.getInt("UID"),resultSet.getString("Email"),resultSet.getString("UserName"),resultSet.getString("Pass")));
            }
            return travelUsers;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }*/


}
//List<TravelUser> travelUsers=dao.getResultList(TravelUser.class,"select uID,Email email,UserName userName,Pass pass from traveluser ");