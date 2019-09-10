package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.base.Page;
import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.dao.ExperimentalScoreDao;
import cn.edu.tjpu.dao.ScoreLevelDao;
import cn.edu.tjpu.dao.SemesterDao;
import cn.edu.tjpu.dao.StudentDao;
import cn.edu.tjpu.model.*;
import cn.edu.tjpu.service.StudentService;
import cn.edu.tjpu.utils.RandomGUID;
import cn.edu.tjpu.utils.SemesterUtils;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.nfunk.jep.JEP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: StudentServiceImpl
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-09 10:09
 **/
@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;
    @Autowired
    private ExperimentalScoreDao experimentalScoreDao;
    @Autowired
    private SemesterDao semesterDao;
    @Autowired
    private ScoreLevelDao scoreLevelDao;

    @Override
    public PageInfo findStudentByPage(Page<QueryParams> page) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<Map> resultList = getStudentScore(page.getParams());
        PageInfo pageInfo = new PageInfo(resultList);
        return pageInfo;
    }

    @Override
    public void updateStudentById(Student student) {
        studentDao.updateStudentById(student);
    }

    @Override
    public void deleteStudentById(Student student) {
        studentDao.deleteStudentById(student);
    }

    @Override
    public List<Map> getStudentScore(QueryParams queryParams) {
        List<Map> resultList = studentDao.getStudentScore(queryParams);
        String experimentName = (String) queryParams.get("experimentName");
        if (experimentName != null) {
            if(experimentName.endsWith("实验")){
                experimentName = experimentName.substring(0,experimentName.length()-2);
            }
            for (int i = 0; i < resultList.size(); i++) {
                Map<String, Object> studentInfo = resultList.get(i);
                String score = (String) studentInfo.get("score");
                List<Score> scoreList = JSONObject.parseArray(score, Score.class);
                for (Score scoreBean : scoreList) {
                    if (scoreBean.getName().contains(experimentName) && scoreBean.getExperimentalFlag() == 1) {
                        studentInfo.put("experimentEScore", scoreBean.getScore());
                        studentInfo.put("remarks", scoreBean.getRemarks());
                    } else if (scoreBean.getName().contains(experimentName) && scoreBean.getExperimentalFlag() == 0) {
                        studentInfo.put("experimentUScore", scoreBean.getScore());
                    }
                }
            }
        }
        Map<String, Object> eScoreLevelMap = new HashMap<>();
        Map<String, Object> uScoreLevelMap = new HashMap<>();
        if (resultList != null && resultList.size() != 0) {
            Map<String, Object> studentInfo = resultList.get(0);
            String eLevel = (String) studentInfo.get("eLevel");
            List<ScoreLevel> eScoreLevels = JSONObject.parseArray(eLevel, ScoreLevel.class);
            for (ScoreLevel s : eScoreLevels) {
                eScoreLevelMap.put(s.getLevel(), s.getScore());
            }
            String uLevel = (String) studentInfo.get("uLevel");
            List<ScoreLevel> uScoreLevels = JSONObject.parseArray(uLevel, ScoreLevel.class);
            if (uScoreLevels != null) {
                for (ScoreLevel s : uScoreLevels) {
                    uScoreLevelMap.put(s.getLevel(), s.getScore());
                }
            }


            /*String uFormula = (String) studentInfo.get("uFormula");
            Matcher m2 = p.matcher(uFormula);
            String uFormulaStr = m2.replaceAll("").trim();
            uScorePercentArr = uFormulaStr.split("\\+");*/
        }
        for (int i = 0; i < resultList.size(); i++) {
            Map<String, Object> studentInfo = resultList.get(i);
            String score = (String) studentInfo.get("score");
            String eFormula = (String) studentInfo.get("eFormula");
            String uFormula = (String) studentInfo.get("uFormula");
            List<Score> scoreList = JSONObject.parseArray(score, Score.class);
            String startCell = "E";
            for (int j = 0; j < scoreList.size(); j++) {
                Score scoreBean = scoreList.get(j);
                String level = scoreBean.getScore();
                String eScoreStr = (String) eScoreLevelMap.get(level);
                if (eScoreStr == null || "".equals(eScoreStr.trim())) {
                    eScoreStr = "0";
                }
                String uScoreStr = (String) uScoreLevelMap.get(level);
                if (uScoreStr == null || "".equals(uScoreStr.trim())) {
                    uScoreStr = "0";
                }
                eFormula = StringUtils.replace(eFormula, startCell, eScoreStr);
                uFormula = StringUtils.replace(uFormula, startCell, uScoreStr);
                startCell = ((char) (startCell.toCharArray()[0] + 1)) + "";
            }
            // 运算实验总成绩
            JEP eFormulaJep = new JEP();
            eFormulaJep.parseExpression(eFormula);
            studentInfo.put("eTotalScore", eFormulaJep.getValue());
            if (uFormula != null) {
                JEP uFormulaJep = new JEP();
                // 设置公式
                //平时
                // 得出结果
                uFormulaJep.parseExpression(uFormula);
                studentInfo.put("uTotalScore", uFormulaJep.getValue());
            }
        }
        return resultList;
    }

    @Override
    public void updateStudentScore(QueryParams queryParams) {
        String score = experimentalScoreDao.getExperimentScoreById(queryParams);
        String experimentName = (String) queryParams.get("experimentName");
        if(experimentName.endsWith("实验")){
            experimentName = experimentName.substring(0,experimentName.length()-2);
        }
        String experimentEScore = (String) queryParams.get("experimentEScore");
        String experimentUScore = (String) queryParams.get("experimentUScore");
        String remarks = (String) queryParams.get("remarks");
        List<Score> scoreList = JSONObject.parseArray(score, Score.class);
        if (scoreList != null && scoreList.size() != 0) {
            for (Score scoreBean : scoreList) {
                if (scoreBean.getName().contains(experimentName) && scoreBean.getExperimentalFlag() == 1) {
                    scoreBean.setScore(experimentEScore);
                    scoreBean.setRemarks(remarks);
                } else if (scoreBean.getName().contains(experimentName) && scoreBean.getExperimentalFlag() == 0) {
                    scoreBean.setScore(experimentUScore);
                    scoreBean.setRemarks(remarks);
                }
            }
            String newScoreStr = JSONObject.toJSONString(scoreList);
            queryParams.put("score", newScoreStr);
            experimentalScoreDao.updateExperimentById(queryParams);
        }


    }

    @Override
    public ResponseData addStudent(QueryParams queryParams) {
        queryParams.put("semesterNumber", SemesterUtils.getSemesterNumber());
        ExperimentalScore experimentalScore = experimentalScoreDao.getExperimentScore(queryParams);
        Semester semester = new Semester();
        semester.setNumber((String) queryParams.get("semesterNumber"));
        Semester dbSemester = semesterDao.getSemesterByNumber(semester);
        List<String> param = new ArrayList<>();
        param.add((String) queryParams.get("number"));
        List<Student> result = studentDao.getStudentByNumbers(param);
        String usuallyScoreLevelId = experimentalScore.getUsuallyScoreLevelId();
        String exScoreLevelId = experimentalScore.getExScoreLevelId();
        ScoreLevel uscoreLevel = scoreLevelDao.getById(usuallyScoreLevelId);
        ScoreLevel escoreLevel = scoreLevelDao.getById(exScoreLevelId);
        List<ScoreLevel> uScoreLevels = JSONObject.parseArray(uscoreLevel.getLevel(), ScoreLevel.class);
        List<ScoreLevel> eScoreLevels = JSONObject.parseArray(escoreLevel.getLevel(), ScoreLevel.class);
        if (result != null && result.size() != 0) {
            return ResponseData.fail("学号已存在");
        }
        String score = experimentalScore.getScore();
        List<Score> scoreList = JSONObject.parseArray(score, Score.class);
        for (int i = 0; i < scoreList.size(); i++) {
            Score s = scoreList.get(i);
            if (s.getExperimentalFlag() == 1) {
                s.setScore(eScoreLevels.get(eScoreLevels.size() - 1).getLevel());
            } else {
                if (i == 0 || i == 1) {
                    s.setScore(uScoreLevels.get(i).getLevel());
                }

            }
        }
        String studentId = RandomGUID.generatorGUID();
        queryParams.put("id", studentId);
        queryParams.put("studentId", studentId);
        queryParams.put("score", JSONObject.toJSONString(scoreList));
        queryParams.put("semesterId", dbSemester == null ? null : dbSemester.getId());
        queryParams.put("usuallyScoreLevelId", usuallyScoreLevelId);
        queryParams.put("exScoreLevelId", exScoreLevelId);

        studentDao.addStudent(queryParams);
        return ResponseData.ok("");
    }

}
