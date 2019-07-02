package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.base.Page;
import cn.edu.tjpu.dao.TeacherDao;
import cn.edu.tjpu.model.Teacher;
import cn.edu.tjpu.service.TeacherService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName: TeacherServiceImpl
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-02 15:46
 **/
@Service
@Transactional
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherDao teacherDao;

    @Override
    public Teacher getTeacherByNumber(Teacher teacher) {
        return teacherDao.getTeacherByNumber(teacher);
    }

    @Override
    public PageInfo<Teacher> getTeacherByPage(Page<Teacher> page) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize());
        List<Teacher> resultList = teacherDao.getTeacherByPage(page.getParams());
        PageInfo<Teacher> resultData = new PageInfo<>(resultList);
        return resultData;
    }

    @Override
    public void updateTeacherById(Teacher teacher) {
        teacherDao.updateTeacherById(teacher);
    }

    @Override
    public void deleteTeacherById(Teacher teacher) {
        teacherDao.deleteTeacherById(teacher);
    }

    @Override
    public void addTeacher(Teacher teacher) {
        teacherDao.addTeacher(teacher);
    }

    @Override
    public List<Teacher> getTeachersByNumbers(List<String> numbers) {
        return teacherDao.getTeachersByNumbers(numbers);
    }
}
