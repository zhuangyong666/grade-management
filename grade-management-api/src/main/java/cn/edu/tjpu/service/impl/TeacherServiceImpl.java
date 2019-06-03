package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.dao.TeacherDao;
import cn.edu.tjpu.model.Teacher;
import cn.edu.tjpu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName: TeacherServiceImpl
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-02 15:46
 **/
@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherDao teacherDao;

    @Override
    public Teacher getTeacherByNumber(Teacher teacher) {
        return teacherDao.getTeacherByNumber(teacher);
    }
}
