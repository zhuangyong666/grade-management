package cn.edu.tjpu.utils;

import java.util.Date;

/**
 * @ClassName: SemesterUtils
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-11 12:45
 **/
public class SemesterUtils {
    public static String getSemesterNumber() {
        Date now = new Date();
        int month = now.getMonth() + 1;
        int year = now.getYear() + 1900;
        StringBuilder semesterNumber = new StringBuilder();
        if (month < 9) {
            if (month >= 3) {
                semesterNumber.append((year - 1) + "-" + year + "-" + "2");
            } else {
                semesterNumber.append((year - 1) + "-" + year + "-" + "1");
            }
        } else {
            semesterNumber.append(year + "-" + (year + 1) + "-" + "1");
        }
        return semesterNumber.toString();
    }

}
