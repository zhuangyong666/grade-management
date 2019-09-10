package cn.edu.tjpu.model;

import java.io.Serializable;

/**
 * @ClassName: Score
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-15 08:30
 **/
public class Score implements Serializable {
    private String name;
    private String score;
    private Integer experimentalFlag;
    private String remarks;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public Integer getExperimentalFlag() {
        return experimentalFlag;
    }

    public void setExperimentalFlag(Integer experimentalFlag) {
        this.experimentalFlag = experimentalFlag;
    }

    public String getRemarks() {
        return remarks == null ? "" : remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
