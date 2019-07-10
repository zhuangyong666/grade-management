package cn.edu.tjpu.dao;

import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.model.TeacherExtend;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Interface: TeacherExtendDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-05 09:27
 **/
public interface TeacherExtendDao {
    public List<TeacherExtend> getTeacherExtends(@Param("list") List<String> teacherIds, @Param("clazzId") Long clazzId, @Param("courseId") Long courseId,@Param("semesterId") Long semesterId,@Param("experimentIds") List<String> experimentId);

    public void batchAddTeacherExtend(List<TeacherExtend> teacherExtends);

    public List<Map> getExperimentByTeacherId(QueryParams queryParams);
}
