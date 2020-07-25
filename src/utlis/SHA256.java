package utlis;

import org.apache.commons.codec.digest.DigestUtils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256
{


        /**
         　　* 利用java原生的摘要实现SHA256加密
         　　* @param bytes 加密后的报文
         　　* @return
         　　*/
        public static String sha256Hex(String string)
        {
            byte[] bytes = string.getBytes();
            return sha256Hex(bytes);
        }

        public static String sha256Hex(byte[] bytes){
            MessageDigest messageDigest;
            String encodeStr = "";
            try {
                messageDigest = MessageDigest.getInstance("SHA-256");
                messageDigest.update(bytes);
                encodeStr = byte2Hex(messageDigest.digest());
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
            return encodeStr;
        }

        /**
         　　* 将byte转为16进制
         　　* @param bytes
         　　* @return
         　　*/
        private static String byte2Hex(byte[] bytes){
            StringBuffer stringBuffer = new StringBuffer();
            String temp = null;
            for (int i=0;i<bytes.length;i++){
                temp = Integer.toHexString(bytes[i] & 0xFF);
                if (temp.length()==1){
                    //1得到一位的进行补0操作
                    stringBuffer.append("0");
                }
                stringBuffer.append(temp);
            }
            return stringBuffer.toString();
        }

        public static String getSecretPassword(String password,String emailAddress)
        {
            return (sha256Hex(password+emailAddress));
        }
}
