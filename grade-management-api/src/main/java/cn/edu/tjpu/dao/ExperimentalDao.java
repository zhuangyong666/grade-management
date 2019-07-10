package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.Experiment;

import java.util.List;

/**
 * @Interface: ExperimentalDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-12 13:19
 **/
public interface ExperimentalDao {
    public void batchAddExperimental(List<Experiment> experiment);

    public List<Experiment> getExperimentals(List<Experiment> experiments);
}
