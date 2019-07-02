package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.Semester;

import java.util.List;

/**
 * @Interface: SemesterDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-04 10:53
 **/
public interface SemesterDao {
    public void addSemester(Semester semester);

    public Semester getSemesterByNumber(Semester semester);

    public List<Semester> getAllSemester();
}
