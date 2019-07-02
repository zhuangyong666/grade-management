package cn.edu.tjpu.controller;

import cn.edu.tjpu.base.BaseController;
import cn.edu.tjpu.base.QueryParams;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.service.SemesterService;
import cn.edu.tjpu.service.impl.SemesterServiceImpl;
import cn.edu.tjpu.utils.FileUtils;
import cn.edu.tjpu.utils.PathUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

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

    @PostMapping("export")
    public ResponseData export(@RequestBody QueryParams queryParams, HttpServletRequest request) {
        String downloadUrl = request.getRequestURL().toString().replace("export", "download") + "/";
        queryParams.put("downloadUrl", downloadUrl);
        return semesterService.exportDbToExcel(queryParams);
    }

    @RequestMapping(value = "download/{fileName}", method = RequestMethod.GET)
    public void download(@PathVariable("fileName") String fileName, HttpServletResponse response) throws Exception {
        try {
            File file = new File(PathUtils.getWebInfoPath() + SemesterServiceImpl.DIR + "\\" + fileName + ".xlsx");
            FileUtils.downloadFile(file, file.getName(), response, true);
        } catch (Exception e) {
            LOG.error("系统错误", e);
        }
    }
}
