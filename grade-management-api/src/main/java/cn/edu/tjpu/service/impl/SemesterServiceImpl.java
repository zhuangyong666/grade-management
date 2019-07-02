package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.base.ResponseCode;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.dao.*;
import cn.edu.tjpu.model.*;
import cn.edu.tjpu.service.SemesterService;
import cn.edu.tjpu.service.StudentService;
import cn.edu.tjpu.utils.ExcelUtils;
import cn.edu.tjpu.utils.PathUtils;
import cn.edu.tjpu.utils.RandomGUID;
import com.alibaba.fastjson.JSONObject;
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

import java.io.File;
import java.util.*;

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
    @Autowired
    private ScoreLevelDao scoreLevelDao;
    @Autowired
    private ExperimentalDao experimentalDao;
    @Autowired
    private StudentService studentService;
    public final static String DIR = "file";

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

            List<Experiment> experiments = new LinkedList<>();
            List<String> experimentIds = new LinkedList<>();
            for (int i = 4; excelUtils.getValue(sheet.getRow(8).getCell(i)) != null && !excelUtils.getValue(sheet.getRow(8).getCell(i)).equals("实验总成绩"); i += 2) {
                Experiment experiment = new Experiment();
                String experimentId = RandomGUID.generatorGUID();
                experiment.setId(experimentId);
                String name = excelUtils.getValue(sheet.getRow(8).getCell(i));
                experiment.setName(name.substring(0, name.length() - 2));
                experiments.add(experiment);
            }

            List<Experiment> dbExperiments = experimentalDao.getExperimentals(experiments);
            List<Experiment> addExperimentsList = new ArrayList<>();
            for (int i = 0; i < experiments.size(); i++) {
                Experiment experiment = experiments.get(i);
                boolean flag = true;
                for (int j = 0; j < dbExperiments.size(); j++) {
                    Experiment dbExperiment = dbExperiments.get(j);
                    if (experiment.getName().equals(dbExperiment.getName())) {
                        experimentIds.add(dbExperiment.getId());
                        flag = false;
                        break;
                    }
                }
                if (flag) {
                    addExperimentsList.add(experiment);
                    experimentIds.add(experiment.getId());
                }
            }

            if (addExperimentsList.size() != 0) {
                experimentalDao.batchAddExperimental(addExperimentsList);
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
                teacherExtend.setExperimentIds(experimentIds);
                teacherExtendList.add(teacherExtend);
                teacherExtend_TeacherIds.add(teacherId);
            }
            if (addTeacherList.size() != 0) {
                teacherDao.batchAddTeacher(addTeacherList);
            }
            if (updateTeacherList.size() != 0) {
                teacherDao.batchUpdateTeacher(updateTeacherList);
            }

            List<TeacherExtend> dbTeacherExtendList = teacherExtendDao.getTeacherExtends(teacherExtend_TeacherIds, clazzId, courseId, semesterId, experimentIds);
            List<TeacherExtend> addTeacherExtendList = new ArrayList<>();
            for (int i = 0; i < teacherExtendList.size(); i++) {
                TeacherExtend teacherExtend = teacherExtendList.get(i);
                TeacherExtend db_teacherExtend = null;
                for (int j = 0; j < dbTeacherExtendList.size(); j++) {
                    TeacherExtend dbTeacherExtend = dbTeacherExtendList.get(j);
                    if (teacherExtend.getClazzId().equals(dbTeacherExtend.getClazzId()) && teacherExtend.getCourseId().equals(dbTeacherExtend.getCourseId()) && teacherExtend.getSemesterId().equals(dbTeacherExtend.getSemesterId()) && teacherExtend.getTeacherId().equals(dbTeacherExtend.getTeacherId()) && teacherExtend.getExperimentIds().contains(dbTeacherExtend.getExperimentId())) {
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

            Row row2 = sheet.getRow(2);
            Row row3 = sheet.getRow(3);
            List<ScoreLevel> exScoreLevels = new LinkedList<>();
            String defaultEScore = "";
            for (int i = 1; excelUtils.getValue(row2.getCell(i)) != null && excelUtils.getValue(row3.getCell(i)) != null; i++) {
                ScoreLevel eScoreLevel = new ScoreLevel();
                eScoreLevel.setLevel(excelUtils.getValue(row2.getCell(i)));
                eScoreLevel.setScore(excelUtils.getValue(row3.getCell(i)));
                exScoreLevels.add(eScoreLevel);
                defaultEScore = excelUtils.getValue(row2.getCell(i));
            }
            String scoreLevelId = RandomGUID.generatorGUID();
            ScoreLevel scoreLevel = new ScoreLevel();
            scoreLevel.setName(excelUtils.getValue(row2.getCell(0)));
            scoreLevel.setLevel(JSONObject.toJSONString(exScoreLevels));
            scoreLevel.setId(scoreLevelId);
            scoreLevel.setClazzId(clazzId);
            scoreLevel.setFormula(excelUtils.getValue(sheet.getRow(6).getCell(1)));

            Row row4 = sheet.getRow(4);
            Row row5 = sheet.getRow(5);
            List<ScoreLevel> uScoreLevel = new LinkedList<>();
            String defaultUScore = "";
            for (int i = 1; excelUtils.getValue(row4.getCell(i)) != null && excelUtils.getValue(row5.getCell(i)) != null; i++) {
                ScoreLevel scoreLevelBean = new ScoreLevel();
                scoreLevelBean.setLevel(excelUtils.getValue(row4.getCell(i)));
                scoreLevelBean.setScore(excelUtils.getValue(row5.getCell(i)));
                uScoreLevel.add(scoreLevelBean);
                if (i == 1 || i == 2) {
                    defaultUScore = excelUtils.getValue(row4.getCell(i));
                }
            }
            List<ScoreLevel> scoreLevels = new ArrayList<>();
            String uScoreLevelId = null;
            Row row7 = sheet.getRow(7);
            if (row7 != null) {
                uScoreLevelId = RandomGUID.generatorGUID();
                ScoreLevel usScoreLevel = new ScoreLevel();
                usScoreLevel.setName(excelUtils.getValue(row4.getCell(0)));
                usScoreLevel.setLevel(JSONObject.toJSONString(uScoreLevel));
                usScoreLevel.setId(uScoreLevelId);
                usScoreLevel.setClazzId(clazzId);
                usScoreLevel.setFormula(excelUtils.getValue(row7.getCell(1)));
                scoreLevels.add(usScoreLevel);
            }
            scoreLevels.add(scoreLevel);
            scoreLevelDao.batchAddScoreLevel(scoreLevels);

            List<Student> students = new ArrayList<>();
            List<String> studentNumbers = new ArrayList<>();
            String uFormula = "";
            if (row7 != null && row7.getCell(1) != null) {
                uFormula = excelUtils.getValue(row7.getCell(1));
            }
            for (int i = 9; sheet.getRow(i) != null; i++) {
                Row rowi = sheet.getRow(i);
                String studentId = RandomGUID.generatorGUID();
                List<ExperimentalScore> experimentalScoreList = new ArrayList<>();
                List<Score> scoreList = new LinkedList<>();
                String startCell = "E";
                for (int j = 1; excelUtils.getValue(sheet.getRow(8).getCell(j)) != null; j++) {
                    if (j == 1) {
                        String name = excelUtils.getValue(rowi.getCell(j + 1));
                        Student student = new Student();
                        String sex = excelUtils.getValue(rowi.getCell(j + 2));
                        student.setSex(sex);
                        String number = excelUtils.getValue(rowi.getCell(j));
                        student.setId(studentId);
                        student.setName(name);
                        student.setNumber(number);
                        student.setClazzId(clazzId);
                        j = j + 2;
                        student.setExperimentalScores(experimentalScoreList);
                        students.add(student);
                        studentNumbers.add(number);
                    } else {
                        if (j >= 4) {
                            String experimentalName = excelUtils.getValue(sheet.getRow(8).getCell(j));
                            String scoreStr = excelUtils.getValue(rowi.getCell(j));
                            if (!experimentalName.equals("实验总成绩") && !experimentalName.equals("平时总成绩")) {
                                Score score = new Score();
                                score.setName(experimentalName);
                                if (uFormula.contains(startCell)) {
                                    if (scoreStr == null) {
                                        scoreStr = defaultUScore;
                                    }
                                    score.setScore(scoreStr);
                                    score.setExperimentalFlag(0);
                                    scoreList.add(score);
                                } else {
                                    if (scoreStr == null) {
                                        scoreStr = defaultEScore;
                                    }
                                    score.setScore(scoreStr);
                                    score.setExperimentalFlag(1);
                                    scoreList.add(score);
                                }
                            }
                            startCell = ((char) (startCell.toCharArray()[0] + 1)) + "";
                        }
                    }
                }
                ExperimentalScore experimentalScore = new ExperimentalScore();
                experimentalScore.setStudentId(studentId);
                experimentalScore.setCourseId(courseId);
                experimentalScore.setSemesterId(semesterId);
                experimentalScore.setUsuallyScoreLevelId(uScoreLevelId);
                experimentalScore.setExScoreLevelId(scoreLevelId);
                experimentalScore.setScore(JSONObject.toJSONString(scoreList));
                experimentalScoreList.add(experimentalScore);
            }

            List<Student> dbStudents = studentDao.getStudentByNumbers(studentNumbers);
            List<Student> addStudentList = new ArrayList<>();
            List<Student> updateStudentList = new ArrayList<>();
            List<ExperimentalScore> addExperimentalScoreList = new ArrayList<>();
            List<ExperimentalScore> updateExperimentalScoreList = new ArrayList<>();
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
                List<ExperimentalScore> dbExperimentalScores = experimentalScoreDao.getExperimentalScore(studentId, courseId, semesterId);
                for (int k = 0; k < student.getExperimentalScores().size(); k++) {
                    ExperimentalScore experimentalScore = student.getExperimentalScores().get(k);
                    experimentalScore.setStudentId(studentId);
                    long beforeSize = updateExperimentalScoreList.size();
                    for (int j = 0; j < dbExperimentalScores.size(); j++) {
                        ExperimentalScore dbExperimentalScore = dbExperimentalScores.get(j);
                        if (experimentalScore.getCourseId().equals(dbExperimentalScore.getCourseId()) && experimentalScore.getSemesterId().equals(dbExperimentalScore.getSemesterId()) && experimentalScore.getStudentId().equals(dbExperimentalScore.getStudentId())) {
                            experimentalScore.setId(dbExperimentalScore.getId());
                            updateExperimentalScoreList.add(experimentalScore);
                            break;
                        }
                    }
                    if (beforeSize == updateExperimentalScoreList.size()) {
                        addExperimentalScoreList.add(experimentalScore);
                    }
                }
            }
            if (addExperimentalScoreList.size() != 0) {
                experimentalScoreDao.batchAddExperimentalScore(addExperimentalScoreList);
            }
            if (updateExperimentalScoreList.size() != 0) {
                experimentalScoreDao.batchUpdateExperimentalScore(updateExperimentalScoreList);
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

    @Override
    public ResponseData exportDbToExcel(QueryParams queryParams) {
        List<Map> resultList = studentService.getStudentScore(queryParams);
        if (resultList != null && resultList.size() != 0) {
            ExcelUtils excelUtils = new ExcelUtils();
            excelUtils.createRow(0);
            Map<String, String> studentInfo = resultList.get(0);
            excelUtils.setCell(0, "课程：" + studentInfo.get("courseName") + "         " + "班级：" + studentInfo.get("clazzName"));
            excelUtils.createRow(1);
            excelUtils.setCell(0, "序号");
            excelUtils.setCell(1, "姓名");
            excelUtils.setCell(2, "学号");
            excelUtils.setCell(3, "性别");
            String scoreJson = (String) studentInfo.get("score");
            List<Score> scoreList = JSONObject.parseArray(scoreJson, Score.class);
            String eFormula = (String) studentInfo.get("eFormula");
            /*String uFormula = (String) studentInfo.get("uFormula");*/
            List<String> eFormulaList = toScoreList(eFormula);
            /*List<String> uFormulaList = toScoreList(uFormula);*/
            int cellNum = 4;
            int e = 0;
            int u = 0;
            for (int j = 0; j < scoreList.size(); j++) {
                Score scoreBean = scoreList.get(j);
                String name = scoreBean.getName();
                double d = 0;
                if (name.contains("实验成绩")) {
                    d = Double.valueOf(eFormulaList.get(e)) * 1000 / 10;
                    e++;
                } else {
                    d = Double.valueOf(eFormulaList.get(u)) * 1000 / 10;
                    u++;
                }
                excelUtils.setCell(j + 4, name + "(" + d + "%)");
                cellNum = j + 5;
            }
            excelUtils.setCell(cellNum, "总分");
            List<ScoreLevel> eScoreLevels = JSONObject.parseArray((String) studentInfo.get("eLevel"), ScoreLevel.class);
            List<ScoreLevel> uScoreLevels = JSONObject.parseArray((String) studentInfo.get("uLevel"), ScoreLevel.class);
            Map<String, String> eScoreLevelMap = new HashMap<>();
            for (ScoreLevel scoreLevel : eScoreLevels) {
                eScoreLevelMap.put(scoreLevel.getLevel(), scoreLevel.getScore());
            }
            Map<String, String> uScoreLevelMap = new HashMap<>();
            for (ScoreLevel scoreLevel : uScoreLevels) {
                uScoreLevelMap.put(scoreLevel.getLevel(), scoreLevel.getScore());
            }
            for (int i = 0; i < resultList.size(); i++) {
                Map student = resultList.get(i);
                excelUtils.createRow(i + 2);
                excelUtils.setCell(0, i + 1);
                excelUtils.setCell(1, (String) student.get("name"));
                excelUtils.setCell(2, (String) student.get("number"));
                excelUtils.setCell(3, (String) student.get("sex"));
                List<Score> scores = JSONObject.parseArray((String) student.get("score"), Score.class);
                Row row1 = excelUtils.getWorkbook().getSheetAt(0).getRow(1);
                int num = 4;
                for (int j = 0; j < scores.size(); j++) {
                    Score score = scores.get(j);
                    String scoreStr = score.getScore();
                    if (excelUtils.getValue(row1.getCell(j + 4)).contains("实验成绩")) {
                        excelUtils.setCell(j + 4, scoreStr + (scoreStr.equals("") ? scoreStr : "(" + eScoreLevelMap.get(scoreStr) + ")"));
                    } else {
                        excelUtils.setCell(j + 4, scoreStr + (scoreStr.equals("") ? scoreStr : "(" + uScoreLevelMap.get(scoreStr) + ")"));
                    }
                    num = j + 5;
                }
                excelUtils.setCell(num, (Double) student.get("eTotalScore") + (Double) student.get("uTotalScore"));
            }
            String fileName = studentInfo.get("semesterNumber") + studentInfo.get("courseName") + studentInfo.get("clazzName") + ".xlsx";
            String filePath = PathUtils.getWebInfoPath() + DIR + "\\";
            File dir = new File(filePath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            excelUtils.exportXLS(filePath + fileName);
            String downloadUrl = (String) queryParams.get("downloadUrl");
            return ResponseData.ok(downloadUrl + fileName);
        } else {
            return ResponseData.fail("学生成绩不存在");
        }
    }

    @Override
    public List<Semester> getAllSemester() {
        return semesterDao.getAllSemester();
    }

    public List toScoreList(String eFormula) {
        String[] eFormulaArr = eFormula.split("[A-Z]");
        List<String> eFormulaList = new LinkedList<>();
        for (String s : eFormulaArr) {
            s = s.replaceAll("[*,/,+,-]", "");
            if (!s.trim().equals("")) {
                eFormulaList.add(s);
            }
        }
        return eFormulaList;
    }

}
