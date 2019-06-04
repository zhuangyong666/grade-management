package cn.edu.tjpu.model;

import java.io.Serializable;

/**
 * @ClassName: SystemDic
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-04 09:06
 **/
public class SystemDic implements Serializable {
    private Long id;
    private String type;
    private String key;
    private String val;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getVal() {
        return val;
    }

    public void setVal(String val) {
        this.val = val;
    }
}
