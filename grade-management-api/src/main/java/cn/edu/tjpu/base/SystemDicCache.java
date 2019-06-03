package cn.edu.tjpu.base;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * @描述 :
 * @创建者：liuss
 * @创建时间： 2019/1/16
 */
public class SystemDicCache {
    /**
     * 缓存数据map
     **/
    private static final ConcurrentMap<String, ConcurrentMap<String, String>> CACHE_MAP = new ConcurrentHashMap<>();

    public static ConcurrentMap<String, String> getDicByType(String type) {
        return CACHE_MAP.get(type);
    }

    public static String getDicValue(String type, String key) {
        return CACHE_MAP.get(type).get(key);
    }

    public static List<ConcurrentMap<String, String>> getAllDic() {
        return new ArrayList<>(CACHE_MAP.values());
    }

    public static void setDic(String type, ConcurrentMap<String, String> dic) {
        CACHE_MAP.put(type, dic);
    }

    public static void setDicValue(String type, String key, String value) {
        CACHE_MAP.get(type).put(key, value);
    }

    public static void removeDic(String type) {
        CACHE_MAP.remove(type);
    }

    public static void removeDicValue(String type, String key) {
        CACHE_MAP.get(type).remove(key);
    }
}
