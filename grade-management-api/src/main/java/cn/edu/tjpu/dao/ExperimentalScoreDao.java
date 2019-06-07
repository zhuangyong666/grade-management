package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.ExperimentalScore;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Interface: ExperimentalScoreDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-05 15:32
 **/
public interface ExperimentalScoreDao {
    public List<ExperimentalScore> getExperimentalScore(@Param("studentId") String studentId, @Param("courseId") Long courseId, @Param("semesterId") Long semesterId,@Param("experimentIds") List<Long> experimentIds);

    public void batchAddExperimentalScore(List<ExperimentalScore> experimentalScores);

    public void batchUpdateExperimentalScore(List<ExperimentalScore> experimentalScores);
}
