package utlis;

public class SafeReplace
{
    public static String replace(String str)
    {
        str = str.replaceAll("%20","");
        str = str.replaceAll("%27","");
        str = str.replaceAll("%2527","");
        str = str.replaceAll(";","");
        str = str.replaceAll("<","&lt;");
        str = str.replaceAll(">","&gt;");
        //str = str.replaceAll("{","");
        str = str.replaceAll("}","");
        return str;
    }
}
