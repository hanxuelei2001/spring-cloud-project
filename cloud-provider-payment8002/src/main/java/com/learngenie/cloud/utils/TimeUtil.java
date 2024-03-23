package com.learngenie.cloud.utils;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;


public class TimeUtil {

    public final static String format1 = "MM/dd/yyyy HH:mm:ss.SSS";

    public final static String format2 = "yyyy-MM-dd HH:mm:ss.SSS";

    public final static String format3 = "MM/dd/yyyy";

    public final static String format4 = "MM/dd/yy";

    public final static String format5 = "yyyy/MM/dd";

    public final static String format6 = "M/d/yyyy";

    public final static String format7 = "MM/d/yyyy";

    public final static String format8 = "M/dd/yyyy";

    public final static String format9 = "MM-dd-yyyy";

    public final static String format10 = "yyyy-MM-dd";

    public final static String format11 = "MM-d-yyyy";

    public final static String format12 = "yyyy-MM-dd-HH-mm-ss-SSS";

    public final static String format13 = "MM/dd/yyy HH:mm";

    public final static String format14 = "yyyyMMddHHmmssSSS";

    public static final String format15 = "MM/dd/yyyy HH:mm:ss";

    public static final String format16 = "yyyy/MM/dd HH:mm:ss";

    public static final String format17 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

    public static final String format18 = "yyyy-MM-dd'T'HH:mm:ss'Z'";

    public static final String format19 = "hh:mm a";

    public static final String format20 = "MM/dd";

    public final static String format22 = "MMM YYYY";

    public final static String format23 = "MMM dd, YYYY";

    public final static String format24 = "MM/dd/yyyy hh:mma";

    public final static String format27 = "MM_dd_yyyy HH:mm";

    public final static String format_MMM = "MMM";

    public final static String dateFormat = "yyyy-MM-dd HH:mm:ss";

    public final static String dateFormatFull = "yyyy-MM-dd HH:mm:ss.SSS";

    public final static String formatMMddyyyy = "MMddyyyy";

    public final static String formatMMdd = "MM/dd";

    public final static String format21 = "yyyy-MM-dd_HH-mm";

    /**
     * 美国洛杉矶时区
     */
    public final static String US_LA_TIME_ZONE = "American/Los_Angeles";

    public final static String format25 = "yyyy-MM-dd'T'HH:mm:ss";

    public final static String format26 = "MM_dd";

    private final static String[] dateFormats = new String[]{"MM/dd/yyyy", "yyyy/MM/dd", "MM-dd-yyyy", "yyyy-MM-dd", "M/dd/yyyy", "M/d/yyyy", "MM/d/yyyy"};

    private static DateFormat format = new SimpleDateFormat(dateFormat);

    private static Logger logger = LoggerFactory.getLogger(TimeUtil.class);

    public String getUtcNowStr() {
        return this.getUtcNowStr(format2);
    }

    public String getUtcNowStr(String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        return sdf.format(new Date());
    }
}

