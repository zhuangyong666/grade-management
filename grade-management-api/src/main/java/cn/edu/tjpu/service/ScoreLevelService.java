package cn.edu.tjpu.service;

import cn.edu.tjpu.base.Page;
import cn.edu.tjpu.model.ScoreLevel;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Interface: ScoreLevvelService
 * @description:
 * @author: zhuangy
 * @date: 2019-06-12 07:16
 **/
public interface ScoreLevelService {
    public PageInfo<ScoreLevel> getScoreLevelByPage(Page<ScoreLevel> page);

    public void updateScoreLevelById(ScoreLevel scoreLevel);

    public void deleteScoreLevelById(ScoreLevel scoreLevel);

    public void addScoreLevel(ScoreLevel scoreLevel);

    public List<ScoreLevel> getAllLevel();
}
