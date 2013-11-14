package cn.ac.big.dp.test;

import java.text.SimpleDateFormat;
import java.util.Date;
public final class UUID {
    /* *
    创建一个20位的UUID串
    */
    public static String create() {
        return new UUID().toString();
    }

    public static String create(String prefx) {
        return new UUID(prefx).toString();
    }
    /**
     * 判断输入串是否是合法的UUID
     */
     public static boolean isID(String sid) {
        if (sid == null || sid.length() < 1||"null".equalsIgnoreCase(sid)) {
            return false;
        }
        return true;
    }

    public static boolean isID(int id) {
        return id != 0;
    }
    /**
     * 缺省的id的前缀
     */
    private  String prefx = "ID";
    private static long serial=0;

    public UUID() {
    }
    public UUID(String pre) {
        prefx=pre;
    }

    public String toString() {
      SimpleDateFormat formatter  = new SimpleDateFormat("MMddHHmmssSSS");
      String time = formatter.format( new Date());
        serial++;
        if(serial>999)
            serial=0;
       int random=(int)(Math.random()*10000);
       return
                //formatString(prefx, 2, '0') +
                time+//13位
                formatString(serial+ "", 3, '0')+
                formatString(random+ "", 4, '0');
    }
    /**
     * 创建一个定长的字符串，不足的部分用指定的字符补齐
     */
    private static String formatString(String a, int length, char b) {
        if (a == null) {
            return "";
        }

        if (a.length() > length) {
            return a.substring(0, length);
        }
        if (a.length() == length) {
            return a;
        }
        StringBuffer buf = new StringBuffer(length);
        buf.append(a);
        for (int i = 0; i < length - a.length(); i++) {
            buf.append(b);
        }
        return buf.toString();
    }

}
