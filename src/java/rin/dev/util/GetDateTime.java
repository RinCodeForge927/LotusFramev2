package rin.dev.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class GetDateTime {

    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public static List<String> get7Date() {
        return getDates(7);
    }

    public static List<String> getDates(int number) {
        List<String> dateList = new ArrayList<>();
        LocalDate today = LocalDate.now(); // always fetch the current date at method call

        for (int i = number - 1; i >= 0; i--) {
            dateList.add(today.minusDays(i).format(FORMATTER));
        }

        return dateList;
    }

    /**
     * Return the current date and time in a human-readable format.
     */
    public static String getCurrentDateTimeString() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return LocalDateTime.now().format(dtf);
    }

    /**
     * Convenience method used in JSPs to display the current timestamp.
     */
    public static Object now() {
        return getCurrentDateTimeString();
    }
}
