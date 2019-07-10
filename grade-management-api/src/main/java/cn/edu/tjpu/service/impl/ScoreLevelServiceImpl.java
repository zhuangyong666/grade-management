package cn.edu.tjpu.service.impl;

import cn.edu.tjpu.base.Page;
import cn.edu.tjpu.dao.ScoreLevelDao;
import cn.edu.tjpu.model.ScoreLevel;
import cn.edu.tjpu.service.ScoreLevelService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName: ScoreLevelServiceImpl
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-12 07:16
 **/
@Service
@Transactional
public class ScoreLevelServiceImpl implements ScoreLevelService {
    @Autowired
    private ScoreLevelDao scoreLevelDao;

    @Override
    public PageInfo<ScoreLevel> getScoreLevelByPage(Page<ScoreLevel> page) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize());
        List<ScoreLevel> resultList = scoreLevelDao.getScoreLevelByPage();
        PageInfo pageInfo = new PageInfo(resultList);
        return pageInfo;
    }

    @Override
    public void updateScoreLevelById(ScoreLevel scoreLevel) {
        scoreLevelDao.updateScoreLevelById(scoreLevel);
    }

    @Override
    public void deleteScoreLevelById(ScoreLevel scoreLevel) {
        scoreLevelDao.deleteScoreLevelById(scoreLevel);
    }

    @Override
    public void addScoreLevel(ScoreLevel scoreLevel) {
        scoreLevelDao.addScoreLevel(scoreLevel);
    }

    @Override
    public List<ScoreLevel> getAllLevel() {
        return scoreLevelDao.getScoreLevelByPage();
    }
}
