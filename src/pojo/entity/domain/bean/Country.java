package pojo.entity.domain.bean;

public class Country
{
    //public static List<Country> countries  = ((new DAO()).getResultList(Country.class,"select iSO countryCode,countryName from geocountries"));
    private String countryCode,countryName;

    public Country()
    {

    }

    public String getCountryCode()
    {
        return countryCode;
    }

    public void setCountryCode(String countryCode)
    {
        this.countryCode = countryCode;
    }

    public String getCountryName()
    {
        return countryName;
    }

    public void setCountryName(String countryName)
    {
        this.countryName = countryName;
    }

    @Override
    public String toString()
    {
        return "Country{" +
                "countryCode='" + countryCode + '\'' +
                ", countryName='" + countryName + '\'' +
                '}';
    }



    /*public static void main(String[] args)
    {
        List<Country> countries = ((new DAO()).getResultList(Country.class,"select iSO countryCode,countryName from geocountries"));
        for (Country country:countries)
            System.out.println(country);
    }*/
}
