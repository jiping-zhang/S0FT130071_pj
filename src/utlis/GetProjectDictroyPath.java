package utlis;

import com.sun.xml.internal.ws.api.model.wsdl.WSDLOutput;

import java.io.File;

public class GetProjectDictroyPath
{
    public static final String IMG_FOLDER_PATH= getPJDictoryPath()+"web/sources/img/";

    public static String getPJDictoryPath()
    {
        return "file:/C:/Users/张稷平/Desktop/复旦大学/大一暑假/卓越软件开发基础/pj/";
    }

    public static String getPackageString()
    {
        /*String TEST_STRING = "43h3c4hmcf28hcf83c.txt";
        File testFile = new File(TEST_STRING);
        String filePath = testFile.getAbsolutePath();
        filePath = filePath.replace("\\", "/");
        int indexOfTestS = filePath.indexOf(TEST_STRING);
        String packagePath = filePath.substring(0, indexOfTestS);
        packagePath = "file:/" + packagePath;
        return packagePath;*/
        return "C:\\Users\\张稷平\\Desktop\\复旦大学\\大一暑假\\卓越软件开发基础\\pj\\";
    }

    public static void main(String[] args)
    {
        System.out.println(getPackageString());
    }
}
