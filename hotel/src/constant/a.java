package constant;

import java.lang.reflect.Type;
import java.util.Date;
import java.util.Random;

public class a {
    public static int a = 0;
    public static void main(String[] args) {
        Random random = new Random();//16 06 65 30 08 02 9
        int endNo = random.nextInt(99999);
        String no = String.valueOf(new Date().getTime());
        long i = (new Date().getTime());
        System.out.println(i);
        System.out.println(no);
        System.out.println(no.getClass().toString());
    }



}
