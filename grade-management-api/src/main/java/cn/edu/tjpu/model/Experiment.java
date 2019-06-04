package cn.edu.tjpu.model;

import java.io.Serializable;

/**
 * @ClassName: Experiment
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-04 13:34
 **/
public class Experiment implements Serializable {
    private Long id;
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
