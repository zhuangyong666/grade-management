package cn.edu.tjpu.dao;

import cn.edu.tjpu.model.TeacherExtend;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Interface: TeacherExtendDao
 * @description:
 * @author: zhuangy
 * @date: 2019-06-05 09:27
 **/
public interface TeacherExtendDao {
    public List<TeacherExtend> getTeacherExtends(@Param("list") List<String> teacherIds, @Param("clazzId") Long clazzId, @Param("courseId") Long courseId,@Param("semesterId") Long semesterId);

    public void batchAddTeacherExtend(List<TeacherExtend> teacherExtends);
}
