package cn.edu.tjpu.controller;

import cn.edu.tjpu.base.BaseController;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.service.SemesterService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/file")
public class FileController extends BaseController {
    private static final Log LOG = LogFactory.getLog(FileController.class);
    @Autowired
    private SemesterService semesterService;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ResponseData uploadImg(@RequestParam("file") MultipartFile file) {
        return semesterService.exportExcelToDb(file);
    }
}
