package cn.edu.tjpu.model;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName: Student
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-04 14:57
 **/
public class Student implements Serializable {
    private String id;
    private String number;
    private String name;
    private Integer sex;
    private Long clazzId;
    private List<ExperimentalScore> experimentalScores;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Long getClazzId() {
        return clazzId;
    }

    public void setClazzId(Long clazzId) {
        this.clazzId = clazzId;
    }

    public List<ExperimentalScore> getExperimentalScores() {
        return experimentalScores;
    }

    public void setExperimentalScores(List<ExperimentalScore> experimentalScores) {
        this.experimentalScores = experimentalScores;
    }
}
