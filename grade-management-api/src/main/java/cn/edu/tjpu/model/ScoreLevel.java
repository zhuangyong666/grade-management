package cn.edu.tjpu.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: ScoreLevel
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-12 07:09
 **/
public class ScoreLevel implements Serializable {
    private String id;
    private String name;
    private String level;
    private String formula;
    private Long clazzId;
    private Date createTime;
    private String score;

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Long getClazzId() {
        return clazzId;
    }

    public void setClazzId(Long clazzId) {
        this.clazzId = clazzId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
