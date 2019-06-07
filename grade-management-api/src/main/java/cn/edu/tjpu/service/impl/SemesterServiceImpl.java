package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.base.ResponseCode;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.base.SystemDicCache;
import cn.edu.tjpu.dao.*;
import cn.edu.tjpu.model.*;
import cn.edu.tjpu.service.SemesterService;
import cn.edu.tjpu.utils.ExcelUtils;
import cn.edu.tjpu.utils.RandomGUID;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
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
    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private TeacherExtendDao teacherExtendDao;
    @Autowired
    private StudentDao studentDao;
    @Autowired
    private ExperimentalScoreDao experimentalScoreDao;

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
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
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
            course.setName(excelUtils.getValue(row1.getCell(1)));
            Course dbCourse = courseDao.getCourseByName(course);
            Long courseId = null;
            if (dbCourse == null) {
                courseDao.addCourse(course);
                courseId = course.getId();
            } else {
                courseId = dbCourse.getId();
            }
            Clazz clazz = new Clazz();
            clazz.setName(excelUtils.getValue(row1.getCell(2)).trim() + excelUtils.getValue(row1.getCell(3)).trim());
            Clazz dbClazz = clazzDao.getClazzByName(clazz);
            Long clazzId = null;
            if (dbClazz == null) {
                clazzDao.addClazz(clazz);
                clazzId = clazz.getId();
            } else {
                clazzId = dbClazz.getId();
            }
            List<Teacher> teachers = new ArrayList<>();
            List<String> teacherNumbers = new ArrayList<>();
            List<TeacherExtend> teacherExtendList = new ArrayList<>();
            for (int i = 4; excelUtils.getValue(row1.getCell(i)) != null; i += 2) {
                String name = excelUtils.getValue(row1.getCell(i));
                String number = excelUtils.getValue(row1.getCell(i + 1));
                Teacher teacher = new Teacher();
                teacher.setName(name);
                teacher.setNumber(number);
                teachers.add(teacher);
                teacherNumbers.add(number);
            }
            List<Teacher> dbTeachers = teacherDao.getTeachersByNumbers(teacherNumbers);
            List<Teacher> addTeacherList = new ArrayList<>();
            List<Teacher> updateTeacherList = new ArrayList<>();
            List<String> teacherExtend_TeacherIds = new ArrayList<>();
            for (int i = 0; i < teachers.size(); i++) {
                Teacher newTeacher = teachers.get(i);
                String teacherId = null;
                for (int j = 0; j < dbTeachers.size(); j++) {
                    Teacher dbTeacher = dbTeachers.get(j);
                    if (newTeacher.getNumber().equals(dbTeacher.getNumber())) {
                        teacherId = dbTeacher.getId();
                        newTeacher.setId(teacherId);
                        updateTeacherList.add(newTeacher);
                        break;
                    }
                }
                if (teacherId == null) {
                    teacherId = RandomGUID.generatorGUID();
                    newTeacher.setId(teacherId);
                    addTeacherList.add(newTeacher);
                }
                TeacherExtend teacherExtend = new TeacherExtend();
                teacherExtend.setTeacherId(teacherId);
                teacherExtend.setSemesterId(semesterId);
                teacherExtend.setCourseId(courseId);
                teacherExtend.setClazzId(clazzId);
                teacherExtendList.add(teacherExtend);
                teacherExtend_TeacherIds.add(teacherId);
            }
            if (addTeacherList.size() != 0) {
                teacherDao.batchAddTeacher(addTeacherList);
            }
            if (updateTeacherList.size() != 0) {
                teacherDao.batchUpdateTeacher(updateTeacherList);
            }
            List<TeacherExtend> dbTeacherExtendList = teacherExtendDao.getTeacherExtends(teacherExtend_TeacherIds, clazzId, courseId, semesterId);
            List<TeacherExtend> addTeacherExtendList = new ArrayList<>();
            for (int i = 0; i < teacherExtendList.size(); i++) {
                TeacherExtend teacherExtend = teacherExtendList.get(i);
                TeacherExtend db_teacherExtend = null;
                for (int j = 0; j < dbTeacherExtendList.size(); j++) {
                    TeacherExtend dbTeacherExtend = dbTeacherExtendList.get(j);
                    if (teacherExtend.getClazzId().equals(dbTeacherExtend.getClazzId()) && teacherExtend.getCourseId().equals(dbTeacherExtend.getCourseId()) && teacherExtend.getSemesterId().equals(dbTeacherExtend.getSemesterId()) && teacherExtend.getTeacherId().equals(dbTeacherExtend.getTeacherId())) {
                        db_teacherExtend = dbTeacherExtend;
                        break;
                    }
                }
                if (db_teacherExtend == null) {
                    addTeacherExtendList.add(teacherExtend);
                }
            }
            if (addTeacherExtendList.size() != 0) {
                teacherExtendDao.batchAddTeacherExtend(addTeacherExtendList);
            }


            List<Student> students = new ArrayList<>();
            List<String> studentNumbers = new ArrayList<>();
            List<Long> experimentIds = new ArrayList<>();
            for (int i = 3; sheet.getRow(i) != null; i++) {
                Row rowi = sheet.getRow(i);
                String studentId = RandomGUID.generatorGUID();
                List<ExperimentalScore> experimentalScoreList = new ArrayList<>();
                for (int j = 1; excelUtils.getValue(rowi.getCell(j)) != null; j ++) {
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
                        student.setClazzId(clazzId);
                        j = j + 1;
                        student.setExperimentalScores(experimentalScoreList);
                        students.add(student);
                        studentNumbers.add(number);
                    } else {
                        if(excelUtils.getValue(rowi.getCell(j+1))!=null){
                            ExperimentalScore experimentalScore = new ExperimentalScore();
                            experimentalScore.setStudentId(studentId);
                            experimentalScore.setCourseId(courseId);
                            experimentalScore.setSemesterId(semesterId);
                            experimentalScore.setScore(excelUtils.getValue(rowi.getCell(j+1)));
                            experimentalScore.setExperimentId(j * 11L);
                            if (experimentIds.size() == 0) {
                                experimentIds.add(experimentalScore.getExperimentId());
                            }
                            experimentalScoreList.add(experimentalScore);
                        }
                    }
                }
            }
            List<Student> dbStudents = studentDao.getStudentByNumbers(studentNumbers);
            List<Student> addStudentList = new ArrayList<>();
            List<Student> updateStudentList = new ArrayList<>();
            for (int i = 0; i < students.size(); i++) {
                Student student = students.get(i);
                String studentId = null;
                for (int j = 0; j < dbStudents.size(); j++) {
                    Student dbStudent = dbStudents.get(j);
                    if (student.getNumber().equals(dbStudent.getNumber())) {
                        studentId = dbStudent.getId();
                        student.setId(studentId);
                        updateStudentList.add(student);
                        break;
                    }
                }
                if (studentId == null) {
                    studentId = student.getId();
                    addStudentList.add(student);
                }
                List<ExperimentalScore> dbExperimentalScores = experimentalScoreDao.getExperimentalScore(studentId, courseId, semesterId, experimentIds);
                List<ExperimentalScore> addExperimentalScoreList = new ArrayList<>();
                List<ExperimentalScore> updateExperimentalScoreList = new ArrayList<>();
                for (int k = 0; k < student.getExperimentalScores().size(); k++) {
                    ExperimentalScore experimentalScore = student.getExperimentalScores().get(k);
                    experimentalScore.setStudentId(studentId);
                    long beforeSize = updateExperimentalScoreList.size();
                    for (int j = 0; j < dbExperimentalScores.size(); j++) {
                        ExperimentalScore dbExperimentalScore = dbExperimentalScores.get(j);
                        if (experimentalScore.getExperimentId().equals(dbExperimentalScore.getExperimentId()) && experimentalScore.getCourseId().equals(dbExperimentalScore.getCourseId()) && experimentalScore.getSemesterId().equals(dbExperimentalScore.getSemesterId()) && experimentalScore.getStudentId().equals(dbExperimentalScore.getStudentId())) {
                            experimentalScore.setId(dbExperimentalScore.getId());
                            updateExperimentalScoreList.add(experimentalScore);
                            break;
                        }
                    }
                    if (beforeSize == updateExperimentalScoreList.size()) {
                        addExperimentalScoreList.add(experimentalScore);
                    }
                }
                if (addExperimentalScoreList.size() != 0) {
                    experimentalScoreDao.batchAddExperimentalScore(addExperimentalScoreList);
                }
                if (updateExperimentalScoreList.size() != 0) {
                    experimentalScoreDao.batchUpdateExperimentalScore(updateExperimentalScoreList);
                }
            }
            if (addStudentList.size() != 0) {
                studentDao.batchAddStudent(addStudentList);
            }
            if (updateStudentList.size() != 0) {
                studentDao.batchUpdateStudent(updateStudentList);
            }

            return ResponseData.ok("success");
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return ResponseData.fail();
        }
    }
}
