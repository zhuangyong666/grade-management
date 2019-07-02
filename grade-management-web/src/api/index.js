import Axios from '../libs/AxiosPlugin'

// 接口地址
const BASE_PATH = process.env.API_URL

// 教师登录
export const login = params => { return Axios.post(`${BASE_PATH}/teacher/login`, params).then(res => res.data); };

// 获取教师列表
export const getTeacherList = params => { return Axios.post(`${BASE_PATH}/teacher/list`, params).then(res => res.data); };

//添加教师信息
export const addTeacher = params => { return Axios.post(`${BASE_PATH}/teacher/add`, params).then(res => res.data); };

//修改教师信息
export const updateTeacher = params => { return Axios.post(`${BASE_PATH}/teacher/update`, params).then(res => res.data); };

//删除教师信息
export const deleteTeacher = params => { return Axios.post(`${BASE_PATH}/teacher/delete`, params).then(res => res.data); };

// 首页加载数据
export const loadData  = params => { return Axios.get(`${BASE_PATH}/home/loadData`).then(res => res.data) };

// 文件上传地址
export const uploadFile = `${BASE_PATH}/file/upload`;

//获取学生列表
export const getStudentList = params => { return Axios.post(`${BASE_PATH}/student/list`, params).then(res => res.data); };

//更新学生信息
export const updateStudent = params => { return Axios.post(`${BASE_PATH}/student/update`, params).then(res => res.data); };

//获取所有班级列表
export const getAllClazzList = () => { return Axios.get(`${BASE_PATH}/clazz/list`).then(res => res.data); };

// 获取评分等级列表
export const getScoreLevelList = params => { return Axios.post(`${BASE_PATH}/scoreLevel/list`, params).then(res => res.data); };

//添加评分等级信息
export const addScoreLevel = params => { return Axios.post(`${BASE_PATH}/scoreLevel/add`, params).then(res => res.data); };

//修改评分等级信息
export const updateScoreLevel = params => { return Axios.post(`${BASE_PATH}/scoreLevel/update`, params).then(res => res.data); };

//删除评分等级信息
export const deleteScoreLevel = params => { return Axios.post(`${BASE_PATH}/scoreLevel/delete`, params).then(res => res.data); };

//获取所有学期
export const getAllSemester = () => { return Axios.get(`${BASE_PATH}/semester/getAllSemester`).then(res => res.data); };

//获取所有课程
export const getAllCourse = () => { return Axios.get(`${BASE_PATH}/course/getAllCourse`).then(res => res.data); };

//修改学生实验评分
export const updateStudentScore = params => { return Axios.post(`${BASE_PATH}/student/updateStudentScore`, params).then(res => res.data); };

//导出
export const exportStudentScore = params => { return Axios.post(`${BASE_PATH}/file/export`, params).then(res => res.data); };

//删除学生信息
export const deleteStudentInfo = params => { return Axios.post(`${BASE_PATH}/student/delete`, params).then(res => res.data); };