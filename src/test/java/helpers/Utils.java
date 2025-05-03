package helpers;

import com.ibm.icu.util.TimeZone;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalUnit;
import java.util.*;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class Utils {

    public static String generateRandomString(int range) {
        String CHAR_LIST = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuffer randStr = new StringBuffer();
        for (int i = 0; i < range; i++) {
            int number = new Random().nextInt(CHAR_LIST.length());
            char ch = CHAR_LIST.charAt(number);
            randStr.append(ch);
        }
        return randStr.toString();
    }

    public static String generateRandomNumbersString(int range) {
        String CHAR_LIST = "123456789";
        StringBuffer randStr = new StringBuffer();
        for (int i = 0; i < range; i++) {
            int number = new Random().nextInt(CHAR_LIST.length());
            char ch = CHAR_LIST.charAt(number);
            randStr.append(ch);
        }
        return randStr.toString();
    }

    public static int generateRandomNumbersInt(int range) {
        String numberStr = generateRandomNumbersString(range);
        return Integer.parseInt(numberStr);
    }

    public static String generateRandomStatus() {
        String[] statuses = {"available", "sold", "pending"};
        int index = new Random().nextInt(statuses.length);
        return statuses[index];
    }

    public static boolean generateRandomBoolean() {
        return new Random().nextBoolean();
    }

}





