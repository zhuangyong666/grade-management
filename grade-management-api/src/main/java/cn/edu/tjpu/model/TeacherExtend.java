package cn.edu.tjpu.model;

import java.io.Serializable;

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
