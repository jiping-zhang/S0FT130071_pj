package pojo.entity.domain.bean;

import java.util.Date;

public class TravelImage implements Comparable<TravelImage>, Cloneable
{
    private int imageID, cityCode, uID, favor;
    private String title, description, countryCode, content, path;
    private long date ;

    public TravelImage()
    {

    }

    public int getImageID()
    {
        return imageID;
    }

    public void setImageID(int imageID)
    {
        this.imageID = imageID;
    }

    public int getCityCode()
    {
        return cityCode;
    }

    public void setCityCode(int cityCode)
    {
        this.cityCode = cityCode;
    }

    public int getuID()
    {
        return uID;
    }

    public void setuID(int uID)
    {
        this.uID = uID;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getCountryCode()
    {
        return countryCode;
    }

    public void setCountryCode(String countryCode)
    {
        this.countryCode = countryCode;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getPath()
    {
        return path;
    }

    public void setPath(String path)
    {
        this.path = path;
    }

    public int getFavor()
    {
        return favor;
    }

    public void setFavor(int favor)
    {
        this.favor = favor;
    }

    public long getDate()
    {
        return date;
    }

    public void setDate(long date)
    {
        this.date = date;
    }

    @Override
    public String toString()
    {
        return "TravelImage{" +
                "imageID=" + imageID +
                ", cityCode=" + cityCode +
                ", uID=" + uID +
                ", favor=" + favor +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", countryCode='" + countryCode + '\'' +
                ", content='" + content + '\'' +
                ", path='" + path + '\'' +
                ", date=" + date +
                '}';
    }

    @Override
    public int compareTo(TravelImage o)
    {
        return o.getFavor() - this.getFavor();
    }

    public TravelImage getClone()
    {
        try
        {
            return (TravelImage) this.clone();
        }
        catch (Exception e)
        {
            return null;
        }
    }


}
