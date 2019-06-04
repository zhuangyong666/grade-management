package cn.edu.tjpu.model;

import java.io.Serializable;

/**
 * @ClassName: Semester
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-04 10:49
 **/
public class Semester implements Serializable {
    private Long id;
    private String number;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
}
