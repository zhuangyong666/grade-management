package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.base.ResponseCode;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.base.SystemDicCache;
import cn.edu.tjpu.dao.ClazzDao;
import cn.edu.tjpu.dao.CourseDao;
import cn.edu.tjpu.dao.SemesterDao;
import cn.edu.tjpu.model.*;
import cn.edu.tjpu.service.CourseService;
import cn.edu.tjpu.service.SemesterService;
import cn.edu.tjpu.utils.ExcelUtils;
import cn.edu.tjpu.utils.RandomGUID;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: SemesterServiceImpl
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-04 10:57
 **/
@Service
@Transactional
public class SemesterServiceImpl implements SemesterService {
    private static final Log LOG = LogFactory.getLog(SemesterServiceImpl.class);
    @Autowired
    private SemesterDao semesterDao;
    @Autowired
    private CourseDao courseDao;
    @Autowired
    private ClazzDao clazzDao;

    @Override
    public Long addSemester(Semester semester) {
        Semester dbSemester = semesterDao.getSemesterByNumber(semester);
        if (dbSemester == null) {
            semesterDao.addSemester(semester);
            return semester.getId();
        }
        return dbSemester.getId();
    }

    @Override
    public ResponseData exportExcelToDb(MultipartFile file) {
        try {
            ExcelUtils excelUtils = new ExcelUtils();
            Sheet sheet = excelUtils.getSheet(file.getInputStream(), 0);
            if (sheet == null) {
                return ResponseData.fail(" 文件格式不正确", ResponseCode.PARAM_ERROR_CODE.getCode());
            }
            Row row0 = sheet.getRow(0);
            if (row0 == null) {
                return ResponseData.fail("模板格式不正确", ResponseCode.PARAM_ERROR_CODE.getCode());
            }
            Row row1 = sheet.getRow(1);
            Semester semester = new Semester();
            semester.setNumber(excelUtils.getValue(row1.getCell(0)));
            Long semesterId = addSemester(semester);
            Course course = new Course();
            course.setName(excelUtils.getValue(row1.getCell(1)) + excelUtils.getValue(row1.getCell(2)));
            Course dbCourse = courseDao.getCourseByName(course);
            Long courseId = null;
            if (dbCourse == null) {
                courseDao.addCourse(course);
                courseId = course.getId();
            } else {
                courseId = dbCourse.getId();
            }
            Clazz clazz = new Clazz();
            clazz.setName(excelUtils.getValue(row1.getCell(3)));
            Clazz dbClazz = clazzDao.getClazzByName(clazz);
            Long clazzId = null;
            if(dbClazz == null){
                clazzDao.addClazz(clazz);
                clazzId = clazz.getId();
            }else{
                clazzId = dbClazz.getId();
            }
            List<Teacher> teachers = new ArrayList<>();
            for (int i = 4; excelUtils.getValue(row1.getCell(i)) != null; i += 2) {
                String name = excelUtils.getValue(row1.getCell(i));
                String number = excelUtils.getValue(row1.getCell(i + 1));
                Teacher teacher = new Teacher();
                teacher.setName(name);
                teacher.setNumber(number);
                teachers.add(teacher);
            }
            List<Student> students = new ArrayList<>();
            for (int i = 3; sheet.getRow(i) != null; i++) {
                Row rowi = sheet.getRow(i);
                String studentId = RandomGUID.generatorGUID();
                for (int j = 1; excelUtils.getValue(rowi.getCell(j)) != null; j += 2) {
                    if (j == 1) {
                        String name = excelUtils.getValue(rowi.getCell(j));
                        Student student = new Student();
                        String sex = excelUtils.getValue(rowi.getCell(j + 1));
                        String sexMan = SystemDicCache.getDicValue("sex", "1");
                        if (sex.equals(sexMan)) {
                            student.setSex(1);
                        } else {
                            student.setSex(2);
                        }
                        String number = excelUtils.getValue(rowi.getCell(j + 2));
                        student.setId(studentId);
                        student.setName(name);
                        student.setNumber(number);
                        student.setClazzId(clazz.getId());
                        j = j + 1;
                        students.add(student);
                    } else {
                        ExperimentalScore experimentalScore = new ExperimentalScore();
                        experimentalScore.setStudentId(studentId);
                        experimentalScore.setCourseId(course.getId());
                    }
                }
            }
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
        }
        return null;
    }
}
