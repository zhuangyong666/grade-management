package cn.edu.tjpu.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.Closeable;

/**
 * @描述 : io关闭的工具类
 * @创建者：liushengsong
 * @创建时间： 2014-6-16上午11:56:25
 */
public class CloseUtils {


    private static final Log LOG = LogFactory.getLog(CloseUtils.class);

    public static void close(Closeable closeable) {
        if (closeable != null)
            try {
                closeable.close();
            } catch (Exception e) {
                LOG.error("Unable to close " + closeable, e);
            }
    }
}
