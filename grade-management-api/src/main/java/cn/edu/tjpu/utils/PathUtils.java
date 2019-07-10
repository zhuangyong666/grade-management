package cn.edu.tjpu.utils;

/**
 * @ClassName: PathUtils
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-01-16 10:11
 **/
public class PathUtils {
    /**
     * 功能描述: 获取WEB-INF路径
     *
     * @auther: zhuangy
     * @date: 2019/1/15 14:47
     */
    public static String getWebInfoPath() {
        String path = Thread.currentThread().getContextClassLoader().getResource("").toString();
        path = path.replace('/', '\\');
        path = path.replace("file:", "");
        path = path.replace("classes\\", "");
        path = path.substring(1);
        return path;
    }
}
