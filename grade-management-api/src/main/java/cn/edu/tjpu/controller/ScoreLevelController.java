package cn.edu.tjpu.controller;

import cn.edu.tjpu.base.BaseController;
import cn.edu.tjpu.base.Page;
import cn.edu.tjpu.base.ResponseData;
import cn.edu.tjpu.model.ScoreLevel;
import cn.edu.tjpu.service.ScoreLevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * @ClassName: ScoreLevelController
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-02 16:17
 **/
@RequestMapping("scoreLevel")
@RestController
public class ScoreLevelController extends BaseController {
    @Autowired
    private ScoreLevelService scoreLevelService;


    @PostMapping("/list")
    public ResponseData queryUsers(@Valid @RequestBody Page<ScoreLevel> page) {
        return ResponseData.ok(scoreLevelService.getScoreLevelByPage(page));
    }

    @PostMapping("update")
    public ResponseData updateScoreLevel(@RequestBody ScoreLevel scoreLevel) {
        scoreLevelService.updateScoreLevelById(scoreLevel);
        return ResponseData.ok("");
    }

    @PostMapping("delete")
    public ResponseData deleteScoreLevel(@RequestBody ScoreLevel scoreLevel) {
        scoreLevelService.deleteScoreLevelById(scoreLevel);
        return ResponseData.ok("");
    }

    @PostMapping("add")
    public ResponseData addScoreLevel(@RequestBody ScoreLevel scoreLevel) {
        scoreLevelService.addScoreLevel(scoreLevel);
        return ResponseData.ok("");
    }

    @GetMapping("getAllLevel")
    public ResponseData getAllLevel() {
        List<ScoreLevel> resultList = scoreLevelService.getAllLevel();
        return ResponseData.ok(resultList);
    }

}
