package pojo.entity.domain.bean;

import dao.DAO;

public class City
{
    private String cityName,countryCode;
    private int cityCode;

    public City()
    {

    }

    public String getCityName()
    {
        return cityName;
    }

    public void setCityName(String cityName)
    {
        this.cityName = cityName;
    }

    public String getCountryCode()
    {
        return countryCode;
    }

    public void setCountryCode(String countryCode)
    {
        this.countryCode = countryCode;
    }

    public int getCityCode()
    {
        return cityCode;
    }

    public void setCityCode(int cityCode)
    {
        this.cityCode = cityCode;
    }

    @Override
    public String toString()
    {
        return "City{" +
                "cityName='" + cityName + '\'' +
                ", countryCode='" + countryCode + '\'' +
                ", cityCode=" + cityCode +
                '}';
    }



    /*public static void main(String[] args)
    {
        City shanghai = getCity(1796236);
        System.out.println(shanghai);
    }*/
}
