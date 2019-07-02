package cn.edu.tjpu.model;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName: TeacherExtend
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-05 09:25
 **/
public class TeacherExtend implements Serializable {
    private Long id;
    private Long semesterId;
    private Long courseId;
    private Long clazzId;
    private String teacherId;
    private List<String> experimentIds;
    private String experimentId;

    public String getExperimentId() {
        return experimentId;
    }

    public void setExperimentId(String experimentId) {
        this.experimentId = experimentId;
    }

    public List<String> getExperimentIds() {
        return experimentIds;
    }

    public void setExperimentIds(List<String> experimentIds) {
        this.experimentIds = experimentIds;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSemesterId() {
        return semesterId;
    }

    public void setSemesterId(Long semesterId) {
        this.semesterId = semesterId;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public Long getClazzId() {
        return clazzId;
    }

    public void setClazzId(Long clazzId) {
        this.clazzId = clazzId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }
}
