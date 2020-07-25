package pojo.entity.domain.bean;

import dao.DAO;

import java.util.List;

public class Favor
{
    private int favorID,uID,ImageID;

    public Favor()
    {

    }

    public int getFavorID()
    {
        return favorID;
    }

    public void setFavorID(int favorID)
    {
        this.favorID = favorID;
    }

    public int getuID()
    {
        return uID;
    }

    public void setuID(int uID)
    {
        this.uID = uID;
    }

    public int getImageID()
    {
        return ImageID;
    }

    public void setImageID(int imageID)
    {
        ImageID = imageID;
    }

    @Override
    public String toString()
    {
        return "Favor{" +
                "favorID=" + favorID +
                ", uID=" + uID +
                ", ImageID=" + ImageID +
                '}';
    }


}
