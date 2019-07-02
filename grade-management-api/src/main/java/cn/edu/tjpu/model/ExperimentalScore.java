package cn.edu.tjpu.model;

import java.io.Serializable;

/**
 * @ClassName: ExperimentalScore
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-04 16:33
 **/
public class ExperimentalScore implements Serializable {
    private Long id;
    private String score;
    private String studentId;
    private Long courseId;
    private Long semesterId;
    private String usuallyScoreLevelId;
    private String exScoreLevelId;

    public String getUsuallyScoreLevelId() {
        return usuallyScoreLevelId;
    }

    public void setUsuallyScoreLevelId(String usuallyScoreLevelId) {
        this.usuallyScoreLevelId = usuallyScoreLevelId;
    }

    public String getExScoreLevelId() {
        return exScoreLevelId;
    }

    public void setExScoreLevelId(String exScoreLevelId) {
        this.exScoreLevelId = exScoreLevelId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public Long getSemesterId() {
        return semesterId;
    }

    public void setSemesterId(Long semesterId) {
        this.semesterId = semesterId;
    }
}
