package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.ScoreLevel;

import java.util.List;

/**
 * @Interface: ScoreLevelDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-12 07:11
 **/
public interface ScoreLevelDao {
    public List<ScoreLevel> getScoreLevelByPage();

    public void updateScoreLevelById(ScoreLevel scoreLevel);

    public void deleteScoreLevelById(ScoreLevel scoreLevel);

    public void addScoreLevel(ScoreLevel scoreLevel);

    public void batchAddScoreLevel(List<ScoreLevel> scoreLevels);

    public ScoreLevel getById(String id);
}

