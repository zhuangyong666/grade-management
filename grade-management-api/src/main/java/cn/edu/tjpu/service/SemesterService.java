package cn.edu.tjpu.service;

import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.model.Semester;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Interface: SemesterService
 * @description:
 * @author: zhuangy
 * @date: 2019-06-04 10:56
 **/
public interface SemesterService {
    public Long addSemester(Semester semester);
    /**
     * 功能描述: 导入excel文件
     * @auther: zhuangy
     * @date: 2019/6/4 11:26
     */
    public ResponseData exportExcelToDb(MultipartFile file);
}
