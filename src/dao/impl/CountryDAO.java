package dao.impl;

import dao.DAO;
import pojo.entity.domain.bean.Country;

import java.util.List;

public class CountryDAO
{
    public static List<Country> countries  = ((new DAO<Country>(Country.class)).getResultList("select iSO countryCode,countryName from geocountries"));

    public static Country getCountryByCountryCode(String countryCode)
    {
        for (Country country : countries)
        {
            if (country.getCountryCode().equals(countryCode))
                return country;
        }
        return null;
    }

    public static Country getCountryByCountryName(String countryName)
    {
        for (Country country : countries)
        {
            if (country.getCountryName().equals(countryName))
                return country;
        }
        return null;
    }

    public static String getCountryNameByCountryCode(String countryCode)
    {
        for (Country country : countries)
        {
            if (country.getCountryCode().equals(countryCode))
                return country.getCountryName();
        }
        return null;
    }
}
