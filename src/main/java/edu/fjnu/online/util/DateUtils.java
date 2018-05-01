package edu.fjnu.online.util;


import org.apache.commons.lang3.time.DateFormatUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;


/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 *
 * @author ThinkGem
 * @version 2013-3-15
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils{

    private static String[] parsePatterns = { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss",
            "yyyy/MM/dd HH:mm" };

    /**
     * 获取日期，格式：yyyy-MM-dd HH:mm:ss
     *
     * @return
     */
    public static String getDateFormatter() {
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return df.format(date);
    }

    /**
     * 得到当前日期字符串 格式（yyyy-MM-dd）
     */
    public static String getDate() {
        return getDate("yyyy-MM-dd");
    }

    /**
     * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
     */
    public static String getDate(String pattern) {
        return DateFormatUtils.format(new Date(), pattern);
    }

    /**
     * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
     */
    public static String formatDate(Date date, Object... pattern) {
        String formatDate = null;
        if (pattern != null && pattern.length > 0) {
            formatDate = DateFormatUtils.format(date, pattern[0].toString());
        } else {
            formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
        }
        return formatDate;
    }
    public static String changeDate(Date date){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String format = sdf.format(date);
        return format;
    }
    /**
     * 得到日期时间字符串，转换格式（yyyy-MM-dd HH:mm:ss）
     */
    public static String formatDateTime(Date date) {
        return formatDate(date, "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 得到当前时间字符串 格式（HH:mm:ss）
     */
    public static String getTime() {
        return formatDate(new Date(), "HH:mm:ss");
    }

    /**
     * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
     */
    public static String getDateTime() {
        return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 得到当前年份字符串 格式（yyyy）
     */
    public static String getYear() {
        return formatDate(new Date(), "yyyy");
    }

    /**
     * 得到当前月份字符串 格式（MM）
     */
    public static String getMonth() {
        return formatDate(new Date(), "MM");
    }

    /**
     * 得到当天字符串 格式（dd）
     */
    public static String getDay() {
        return formatDate(new Date(), "dd");
    }

    /**
     * 得到当前星期字符串 格式（E）星期几
     */
    public static String getWeek() {
        return formatDate(new Date(), "E");
    }

    /**
     * 日期型字符串转化为日期 格式 { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss",
     * "yyyy-MM-dd HH:mm", "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss",
     * "yyyy/MM/dd HH:mm" }
     */
    public static Date parseDate(Object str) {
        if (str == null) {
            return null;
        }
        try {
            return parseDate(str.toString(), parsePatterns);
        } catch (ParseException e) {
            return null;
        }
    }

    /**
     * 获取过去的天数
     *
     * @param date
     * @return
     */
    public static long pastDays(Date date) {
        long t = new Date().getTime() - date.getTime();
        return t / (24 * 60 * 60 * 1000);
    }

    public static Date getDateStart(Date date) {
        if (date == null) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = sdf.parse(formatDate(date, "yyyy-MM-dd") + " 00:00:00");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    public static Date getDateEnd(Date date) {
        if (date == null) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = sdf.parse(formatDate(date, "yyyy-MM-dd") + " 23:59:59");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 取本周7天的第一天（周一的日期）
     *
     * @param date
     * @return
     */
    public static Date getNowWeekMonday(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DAY_OF_MONTH, -1);
        cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        return cal.getTime();
    }

    /**
     * 得到两个日期相差的天数
     */
    public static int getBetweenDay(Date date1, Date date2) {
        Calendar d1 = new GregorianCalendar();
        d1.setTime(date1);
        Calendar d2 = new GregorianCalendar();
        d2.setTime(date2);
        int days = d2.get(Calendar.DAY_OF_YEAR) - d1.get(Calendar.DAY_OF_YEAR);
        int y2 = d2.get(Calendar.YEAR);
        if (d1.get(Calendar.YEAR) != y2) {
            do {
                days += d1.getActualMaximum(Calendar.DAY_OF_YEAR);
                d1.add(Calendar.YEAR, 1);
            } while (d1.get(Calendar.YEAR) != y2);
        }
        return days;
    }

    /**
     * 获取时间间隔
     *
     * @param time
     *                日期的long形式
     * @return long[] 结果数组，长度为5，依次为天、时、分、秒、毫秒
     */
    public static long[] getMTBR(long time) {
        if (time < 0) {
            time = -time;
        }
        long[] times = new long[5];

        long r = time / (24 * 60 * 60 * 1000);
        long m = time % (24 * 60 * 60 * 1000);
        times[0] = r;
        time = m;

        r = time / (60 * 60 * 1000);
        m = time % (60 * 60 * 1000);
        times[1] = r;
        time = m;

        r = time / (60 * 1000);
        m = time % (60 * 1000);
        times[2] = r;
        time = m;

        r = time / (1000);
        m = time % (1000);
        times[3] = r;
        times[4] = m;

        return times;
    }
    /**
     * 将字符串格式的时间转换成Date类型
     * @param dateStr
     * @return
     */
    public static Date translateStringToDate(String dateStr){
        Date date = null ;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            date = format.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
    /**
     * 将字符串格式的时间转换成Date类型
     * @param dateStr
     * @return
     */
    public static Date translateStringToDateFull(String dateStr){
        Date date = null ;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = format.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 秒转换成两位的时间，格式：HH:mm:ss
     *
     * @param seconds
     * @return
     */
    public static String turnSecondsToTimestring(int seconds) {
        String result = "";
        int hour = 0, min = 0, second = 0;
        hour = seconds / 3600;
        min = (seconds - hour * 3600) / 60;
        second = seconds - hour * 3600 - min * 60;
        if (hour < 10) {
            result += "0" + hour + ":";
        } else {
            result += hour + ":";
        }
        if (min < 10) {
            result += "0" + min + ":";
        } else {
            result += min + ":";
        }
        if (second < 10) {
            result += "0" + second;
        } else {
            result += second;
        }
        return result;
    }

    /**
     * 获取当前时间，以及指定月份数前的时间（如2015-05-05 12:12:12），格式为“yyyy-MM-dd HH:mm:ss” <br>
     * 如果month 为null或者0，默认1个月。
     * @param month
     * @return 如果当前时间是2015-7-14 12:12:12，则返回2015-5-14 12:12:12。
     */
    public static String [] getBeginEndTime(Integer month){
        String [] selectionArgs = new String [2];
        if(month == null || month.intValue() == 0){
            month = 1;
        }
        Date dNow = new Date(); //当前时间
        Date dBefore = new Date();
        Calendar calendar = Calendar.getInstance(); //得到日历
        calendar.setTime(dNow);//把当前时间赋给日历
        calendar.add(Calendar.MONTH, -month); //设置为前3月
        dBefore = calendar.getTime(); //得到前3月的时间

        SimpleDateFormat sdf=new SimpleDateFormat(parsePatterns[1]); //设置时间格式
        String defaultStartDate = sdf.format(dBefore); //格式化前3月的时间
        String defaultEndDate = sdf.format(dNow); //格式化当前时间

        selectionArgs[0] = defaultStartDate;
        selectionArgs[1] = defaultEndDate;
        return selectionArgs;
    }

    /**
     * 秒转换成*小时*分*秒
     *
     * @return
     */
    public static String turnSecondsToString(int totalTime) {
        int hour = totalTime / 3600;
        int min = (totalTime - hour*3600)/60;
        int seconds = totalTime - min*60 -hour*3600;
        String timeStr = "";
        if(hour !=0){
            timeStr += hour+"小时";
        }
        if(min!=0){
            timeStr += min+"分";
        }
        if(seconds!=0){
            timeStr += seconds+"秒";
        }
        return timeStr;
    }


    /**
     * @param args
     * @throws ParseException
     */
    public static void main(String[] args) throws ParseException {
        Date date = new Date();
        GregorianCalendar gc = new GregorianCalendar();
        gc.set(Calendar.YEAR,2013);//设置年
        gc.set(Calendar.MONTH, 8);//这里0是1月..以此向后推
        gc.set(Calendar.DAY_OF_MONTH, 29);//设置天
        gc.set(Calendar.HOUR_OF_DAY,5);//设置小时
        gc.set(Calendar.MINUTE, 7);//设置分
        gc.set(Calendar.SECOND, 6);//设置秒
        gc.set(Calendar.MILLISECOND,200);//设置毫秒
        date = gc.getTime();
        System.out.println("11111111111111111111111111111");
    }

    /**
     * @Description: 对于布置时间的展示按照定义，今天展示时间和分钟如，昨天显示昨天，剩余的直接显示日期如2015-5-6
     * @author  zfq
     * @param startTime
     * @return
     * @throws
     * @date:2016年5月17日上午10:21:58
     */
    public static String formatStartTime(Date startTime) {
        String startTimeStr = "";
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat format2 = new SimpleDateFormat("HH:mm");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date d1 = startTime;
        Date d2 = new Date();
        long diff = d2.getTime() - d1.getTime();
        if(diff<0){
            return null;
        }
        if(diff>0 && d1.getYear()==d2.getYear() && d1.getMonth()==d2.getMonth() && d1.getDay()==d2.getDay()){
            startTimeStr = format2.format(d1) ;
        }else if(diff > 0 && d1.getYear()==d2.getYear() && d1.getMonth()==d2.getMonth() && (d2.getDay()-d1.getDay())==1){
            startTimeStr = "昨天" ;
        }else if(diff > 0){
            startTimeStr = format1.format(d1) ;
        }
        return startTimeStr;
    }
    /**
     * 得到几天后的时间
     *
     * @param d
     * @param day
     * @return
     */
    public static Date getDateAfter(Date d, int day) {
        Calendar now = Calendar.getInstance();
        now.setTime(d);
        now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
        return now.getTime();
    }
    /**
     * 得到几天前的时间
     *
     * @param d
     * @param day
     * @return
     */
    public static Date getDateBefore(Date d, int day) {
        Calendar now = Calendar.getInstance();
        now.setTime(d);
        now.set(Calendar.DATE, now.get(Calendar.DATE) - day);
        return now.getTime();
    }
    /**
     * @Description: 剩余时间大于24H，显示天数，取整数即可；剩余时间大于等于1H，且小于或等于24H，显示小时和分钟；剩余时间小于或等于60min，显示分钟(有延期功能)
     * @author  zfq
     * @param endTime
     * @return
     * @throws
     * @date:2016年5月17日下午2:52:15
     */
    public static String formatEndTime(Date endTime) {
        String endTimeStr ="";
        Date d1 = endTime;
        Date d2 = new Date();
        long diff = d1.getTime() - d2.getTime();
        if(diff<=-(7*24*60*60*1000)){
            endTimeStr = "已过期" ;
        }else if(diff<0 && diff>-(7*24*60*60*1000)){
            String delayTimeStr = "";
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            delayTimeStr = df.format(getDateAfter(endTime,7));
            endTimeStr = "延期至" + delayTimeStr.substring(2);
        }else if(diff/1000>0 && diff/1000/60/60<1){
            if(d1.getMinutes()==d2.getMinutes()){
                endTimeStr = "剩1分" ;
            }else{
                endTimeStr = "剩"+(d1.getMinutes()-d2.getMinutes())+"分" ;
            }
        }else if(diff/1000/60/60/24<1){
            endTimeStr = "剩"+(diff/1000/60/60)+"小时"+((diff/1000/60)%60)+"分" ;
        }else {
            endTimeStr = "剩"+(diff/1000/60/60/24)+"天" ;
        }
        return endTimeStr;
    }

    /**
     * @Description: 剩余时间大于24H，显示天数，取整数即可；剩余时间大于等于1H，且小于或等于24H，显示小时和分钟；剩余时间小于或等于60min，显示分钟(无延期功能)
     * @author  zfq
     * @param endTime
     * @return
     * @throws
     * @date:2016年5月17日下午2:52:15
     */
    public static String formatEndTimeNotDelay(Date endTime) {
        String endTimeStr ="";
        Date d1 = endTime;
        Date d2 = new Date();
        long diff = d1.getTime() - d2.getTime();
        if(diff<=0){
            endTimeStr = "开始考试" ;
        }else if(diff/1000>0 && diff/1000/60/60<1){
            if(d1.getMinutes()==d2.getMinutes()){
                endTimeStr = "剩1分" ;
            }else{
                endTimeStr = "剩"+(d1.getMinutes()-d2.getMinutes())+"分" ;
            }
        }else if(diff/1000/60/60/24<1){
            endTimeStr = "剩"+(diff/1000/60/60)+"小时"+((diff/1000/60)%60)+"分" ;
        }else {
            endTimeStr = "剩"+(diff/1000/60/60/24)+"天" ;
        }
        return endTimeStr;
    }
    public static String formatStartTimeAndEedTime(Date StartTime,Date endTime) {
        String endTimeStr ="";
        Date d1 = StartTime;
        Date d2 = endTime;
        Date d3 = new Date();

        long diff = d1.getTime() - d3.getTime();
        if (d2.getTime() < d3.getTime()){
            endTimeStr="已过期";
            return endTimeStr;
        }
        if(diff<=0){
            endTimeStr = "可以考试" ;
        }else {
            endTimeStr = "离开考"+(diff/1000/60/60/24)+"天"+((diff/1000/60/60)%24)+"小时";
        }
        return endTimeStr;

    }
    /**
     *
     * @param lastTime
     * @return
     */
    public static Long formatEndLastTime(Date lastTime){
        long endTimeStr =0;
        Date d1 = lastTime;
        Date d2 = new Date();
        long diff = d2.getTime() - d1.getTime();
        if(diff<=1000*60*60*24 && diff>=0){
            endTimeStr =1 ;
        }else if(1000*60*60*24<diff && diff<=1000*60*60*24*7){
            endTimeStr = (diff/1000/60/60/24)+1;
        }else {
            endTimeStr=8;
        }
        return endTimeStr;
    }

    /**
     * 距离上传日期的时间：刚刚/n小时前/n天前/n月前/n年前
     */


    private static final long ONE_MINUTE = 60;
    private static final long ONE_HOUR = 3600;
    private static final long ONE_DAY = 86400;
    private static final long ONE_MONTH = 2592000;
    private static final long ONE_YEAR = 31104000;

    public static Calendar calendar = Calendar.getInstance();
    public static String fromToday(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        long time = date.getTime() / 1000;
        long now = new Date().getTime() / 1000;
        long ago = now - time;
        if (ago <= ONE_HOUR)
            return "刚刚";
        else if (ago <= ONE_DAY)
            return ago / ONE_HOUR + "小时前";
        else if (ago <= ONE_MONTH) {
            long day = ago / ONE_DAY;
            return day + "天前";
        } else if (ago <= ONE_YEAR) {
            long month = ago / ONE_MONTH;
            long day = ago % ONE_MONTH / ONE_DAY;
            return month + "个月";
        } else {
            long year = ago / ONE_YEAR;
            return year + "年前";
        }

    }

}

