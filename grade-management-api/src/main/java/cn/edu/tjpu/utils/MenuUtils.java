package cn.edu.tjpu.utils;

import cn.edu.tjpu.model.Menu;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @ClassName: MenuUtils
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-03 10:00
 **/
public class MenuUtils {
    public static List<Menu> grantAdminToUser() {
        List<Menu> menus = new ArrayList<>();
        Menu m = new Menu();
        m.setIcon("el-icon-setting");
        m.setIndex("/home");
        m.setTitle("首页");
        menus.add(m);

        Menu m3 = new Menu();
        m3.setIndex("/teachers");
        m3.setTitle("教师列表");
        Menu m2 = new Menu();
        m2.setIcon("el-icon-menu");
        m2.setIndex("2");
        m2.setTitle("教师管理");
        m2.setSubs(Arrays.asList(m3));
        menus.add(m2);

        Menu m31 = new Menu();
        m31.setIndex("/students");
        m31.setTitle("学生列表");

        Menu m21 = new Menu();
        m21.setIcon("el-icon-menu");
        m21.setIndex("4");
        m21.setTitle("学生管理");
        m21.setSubs(Arrays.asList(m31));
        menus.add(m21);

        /*Menu m311 = new Menu();
        m311.setIndex("/courses");
        m311.setTitle("课程列表");

        Menu m211 = new Menu();
        m211.setIcon("el-icon-menu");
        m211.setIndex("5");
        m211.setTitle("课程管理");
        m211.setSubs(Arrays.asList(m311));
        menus.add(m211);*/

        Menu m4 = new Menu();
        m4.setIndex("/upload");
        m4.setTitle("导入实验评分表格");
       /* Menu m6 = new Menu();
        m6.setIndex("/upload");
        m6.setTitle("导出实验评分表格");*/
        /*Menu m7 = new Menu();
        m7.setIndex("/scoreLevel");
        m7.setTitle("评分等级管理");*/
        Menu m5 = new Menu();
        m5.setIcon("el-icon-menu");
        m5.setIndex("3");
        m5.setTitle("实验评分");
        m5.setSubs(Arrays.asList(m4));
        menus.add(m5);

        return menus;
    }

    public static List<Menu> grantUserToUser() {
        List<Menu> menus = new ArrayList<>();
        Menu m = new Menu();
        m.setIcon("el-icon-setting");
        m.setIndex("/home");
        m.setTitle("首页");
        menus.add(m);

        Menu m3 = new Menu();
        m3.setIndex("/users");
        m3.setTitle("学生列表");

        Menu m2 = new Menu();
        m2.setIcon("el-icon-menu");
        m2.setIndex("2");
        m2.setTitle("学生管理");
        m2.setSubs(Arrays.asList(m3));
        menus.add(m2);
        return menus;
    }
}
