package dao.impl;

import dao.DAO;
import pojo.entity.domain.bean.City;

public class CityDAO
{
    public static City getCity(int cityCode)
    {
        String sql = "select GeoNameID cityCode,AsciiName cityName,CountryCodeISO countryCode from geocities where GeoNameID=?";
        return (new DAO<City>(City.class)).get(sql,cityCode);
    }

    public static City getCity(String cityName)
    {
        String sql = "select GeoNameID cityCode,AsciiName cityName,CountryCodeISO countryCode from geocities where AsciiName=? order by population desc";
        return (new DAO<City>(City.class)).get(sql,cityName);
    }

    public static City getCity(String countryCode, String cityName)
    {
        String sql = "select GeoNameID cityCode,AsciiName cityName,CountryCodeISO countryCode from geocities where CountryCodeISO=? and AsciiName=? ";
        return (new DAO<City>(City.class)).get(sql,countryCode,cityName);
    }
}
