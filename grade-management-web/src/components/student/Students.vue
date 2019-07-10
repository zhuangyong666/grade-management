<template>
  <div id="students">
    <el-form :model="formInline" ref="formInline" class="demo-ruleForm" :inline="true">
      <el-form-item label="学期">
        <el-select v-model="formInline.semesterId" @change="semesterChanage">
          <el-option
            v-for="item in semesterOptions"
            :key="item.number"
            :label="item.number"
            :value="item.number"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="课程">
        <el-select v-model="formInline.courseId" @change="courseChanage">
          <el-option
            v-for="item in courseOptions"
            :key="item.id"
            :label="item.name"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="班级">
        <el-select v-model="formInline.clazzId" @change="clazzChanage">
          <el-option
            v-for="item in clazzOptions"
            :key="item.id"
            :label="item.name"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>

      <!-- <el-form-item label="学号">
        <el-input v-model="formInline.number" placeholder="学号"></el-input>
      </el-form-item>

      <el-form-item label="姓名">
        <el-input v-model="formInline.name" placeholder="姓名"></el-input>
      </el-form-item>-->

      <el-form-item>
        <el-button type="primary" @click="onSubmit">查询</el-button>
        <!-- <el-button @click="resetForm('formInline')">重置</el-button> -->
        <el-button @click="exportFile">导出</el-button>
      </el-form-item>
    </el-form>

    <el-table
      :data="tableData"
      style="width: 100%"
      v-loading="loading2"
      :row-key="getRowKeys"
      element-loading-text="拼命加载中"
      @selection-change="handleSelectionChange"
      @expand="expand"
      :expand-row-keys="expands"
    >
      <!-- <el-table-column type="selection" width="55"></el-table-column> -->
      <el-table-column type="expand">
        <template scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
            <el-form-item label="学期">
              <span>{{ props.row.semesterNumber }}</span>
            </el-form-item>
            <el-form-item label="课程名称">
              <span>{{ props.row.courseName }}</span>
            </el-form-item>
            <el-form-item
              v-for="(score, index) in experimentScoreArr"
              :label="score.name"
              :key="score.score"
            >
              <span>{{ score.score }}</span>
            </el-form-item>
            <el-form-item label="实验总成绩">
              <span>{{ props.row.eTotalScore }}</span>
            </el-form-item>
            <el-form-item label="平时总成绩">
              <span>{{ props.row.uTotalScore }}</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>
      <el-table-column prop="number" label="学号"></el-table-column>
      <el-table-column prop="name" label="姓名" width="180"></el-table-column>
      <el-table-column prop="sex" label="性别"></el-table-column>
      <el-table-column prop="clazzName" label="班级" width="180"></el-table-column>
      <el-table-column fixed="right" label="操作" width="140">
        <template scope="scope">
          <el-button @click="showScoreDialog(scope.row)" type="text" size="small">评分</el-button>
          <el-button type="text" size="small" @click="showEditDialog(scope.$index)">编辑</el-button>
          <el-button type="text" size="small" @click="removeData(scope.$index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="block">
      <!-- <div class="r_btn">
          <el-button type="primary" @click="batchRemove">批量删除</el-button>
      </div>-->
      <div class="r_page">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[10, 20, 30, 40]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
        ></el-pagination>
      </div>
    </div>

    <!-- Form -->
    <el-dialog title="编辑信息" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="姓名" :label-width="formLabelWidth">
          <el-input v-model="form.name" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="性别" :label-width="formLabelWidth">
          <el-select v-model="form.sex" auto-complete="off">
            <el-option
              v-for="item in sexOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="班级" :label-width="formLabelWidth">
          <el-select v-model="form.clazzName">
            <el-option
              v-for="item in clazzOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="update">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog title="评分" :visible.sync="scoreFormVisible">
      <el-form :model="scoreForm">
        <el-form-item label="姓名" :label-width="formLabelWidth">
          <el-input v-model="scoreForm.name" auto-complete="off" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="实验" :label-width="formLabelWidth">
          <el-select v-model="scoreForm.experimentName" auto-complete="off">
            <el-option v-for="item in scoresOptions" :key="item" :label="item" :value="item"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="平时成绩" :label-width="formLabelWidth" v-if="uFlag">
          <el-select v-model="scoreForm.experimentUScore">
            <el-option
              v-for="item in uLevelOptions"
              :key="item.level"
              :label="item.level"
              :value="item.level"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="实验成绩" :label-width="formLabelWidth">
          <el-select v-model="scoreForm.experimentEScore">
            <el-option
              v-for="item in eLevelOptions"
              :key="item.level"
              :label="item.level"
              :value="item.level"
            ></el-option>
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="备注" :label-width="formLabelWidth">
          <el-input type="textarea" :rows="2" placeholder="请输入备注" v-model="scoreForm.remarks"></el-input>
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="scoreFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="updateScore">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<style type="text/css" scoped>
.block {
  margin-top: 20px;
  width: 100%;
}
.block .r_btn {
  float: left;
  width: 90px;
}
.block .r_page {
  float: right;
}
.demo-table-expand {
  font-size: 0;
}
.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}
.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}
</style>
<script type="text/javascript">
import {
  getStudentList,
  getClazzList,
  updateStudent,
  getAllSemester,
  getCourse,
  updateStudentScore,
  exportStudentScore,
  deleteStudentInfo
} from "../../api";

export default {
  data() {
    return {
      semesterOptions: {},
      courseOptions: {},
      tableData: [],
      formInline: {
        semesterId: "",
        courseId: "",
        clazzId: ""
      },
      currentPage: 1,
      total: 0,
      pageSize: 10,
      pickerOptions0: {
        disabledDate(time) {
          return time.getTime() < Date.now() - 8.64e7;
        }
      },
      selectDate: "",
      dialogFormVisible: false,
      scoreFormVisible: false,
      formLabelWidth: "120px",
      form: {
        id: "",
        name: "",
        clazzId: "",
        sex: "",
        clazzName: ""
      },
      loading2: false,
      clazzOptions: [],
      multipleSelection: [],
      sexOptions: [
        {
          value: "男",
          label: "男"
        },
        {
          value: "女",
          label: "女"
        }
      ],
      experimentScoreArr: [],
      expands: [],
      getRowKeys(row) {
        return row.scoreId;
      },
      scoresOptions: [],
      scoreForm: {
        experimentName: "", //实验名称
        experimentEScore: "", //实验成绩
        experimentUScore: "" //平时成绩
      },
      uFlag: false
    };
  },
  mounted() {
    this.$store.dispatch("showHeader");
    this.loadSelectData();
  },
  methods: {
    //加载下拉框数据
    loadSelectData() {
      getAllSemester().then(
        function(result) {
          this.semesterOptions = result.data;
          this.formInline.semesterId = result.data[0].number;
        }.bind(this)
      );
    },
    //加载数据
    loadData() {
      this.loading2 = true;
      var params = {
        pageNum: this.currentPage,
        pageSize: this.pageSize,
        params: {
          semesterId: this.formInline.semesterId,
          courseId: this.formInline.courseId,
          clazzId: this.formInline.clazzId
        }
      };
      getStudentList(params)
        .then(
          function(result) {
            this.tableData = result.data.list;
            this.total = result.data.total;
            this.loading2 = false;
          }.bind(this)
        )
        .catch(
          function(error) {
            this.loading2 = false;
            console.log(error);
          }.bind(this)
        );
    },
    //重置
    resetForm(formName) {
      this.formInline = {
        name: "",
        number: "",
        clazzName: ""
      };
    },
    //查询
    onSubmit() {
      this.loadData();
    },
    //改变分页大小
    handleSizeChange(val) {
      this.pageSize = val;
    },
    //跳转页数
    handleCurrentChange(val) {
      this.currentPage = val;
      this.loadData();
    },
    //打开编辑窗口
    showEditDialog(row) {
      var data = this.tableData[row];
      this.form.id = data.id;
      this.form.name = data.name;
      this.form.sex = data.sex;
      this.form.clazzName = data.clazzName;
      this.form.clazzId = data.clazzId;
      this.dialogFormVisible = true;
    },
    //评分窗口
    showScoreDialog(row) {
      if (row.uLevel) {
        this.uFlag = true;
      }
      this.scoreForm = {
        experimentName: "", //实验名称
        experimentEScore: "", //实验成绩
        experimentUScore: "", //平时成绩
        remarks: "" //备注
      };
      this.scoresOptions = [];
      this.scoreFormVisible = true;
      this.scoreForm.name = row.name;
      this.scoreForm.scoreId = row.scoreId;
      var scores = eval("(" + row.score + ")");
      var len = scores.length;
      for (var i = 0; i < len; i++) {
        if (scores[i].experimentalFlag == "1") {
          var experiment = scores[i].name.substring(
            0,
            scores[i].name.length - 2
          );
          this.scoresOptions.push(experiment);
        }
      }
      this.eLevelOptions = eval("(" + row.eLevel + ")");
      this.uLevelOptions = eval("(" + row.uLevel + ")");
    },
    updateScore() {
      if (this.scoreForm.experimentName == "") {
        this.$message.error("实验不能为空");
        return;
      }
      if (this.scoreForm.experimentEScore == "") {
        this.$message.error("实验成绩不能为空");
        return;
      }
      if (this.uFlag && this.scoreForm.experimentUScore == "") {
        this.$message.error("实验平时成绩不能为空");
        return;
      }
      updateStudentScore(this.scoreForm).then(
        function(result) {
          if (result.status) {
            this.$message({
              message: "评分成功",
              type: "success"
            });
            this.scoreFormVisible = false;
            this.loadData();
          } else {
            this.$message({
              message: result.message,
              type: "error"
            });
            this.scoreFormVisible = false;
          }
        }.bind(this)
      );
    },
    update() {
      if (this.form.name == "") {
        this.$message.error("姓名不能为空");
        return;
      }
      var params = {
        id: this.form.id,
        name: this.form.name,
        sex: this.form.sex,
        clazzId: this.form.clazzId
      };
      updateStudent(params)
        .then(
          function(result) {
            if (result.status) {
              this.$message({
                message: "修改成功",
                type: "success"
              });
              this.dialogFormVisible = false;
              this.loadData();
            } else {
              this.$message({
                message: result.message,
                type: "fail"
              });
              this.dialogFormVisible = false;
            }
          }.bind(this)
        )
        .catch(
          function(error) {
            this.loading2 = false;
            console.log(error);
          }.bind(this)
        );
    },
    removeData(row) {
      var data = this.tableData[row];
      var params = {
        id: data.id
      };
      this.$confirm('确定要删除"' + data.name + '"?', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          var params = {
            id: data.id
          };
          deleteStudentInfo(params).then(
            function(result) {
              if (result.status) {
                this.$message({
                  type: "success",
                  message: "删除成功!"
                });
                this.loadData();
              } else {
                this.$message({
                  message: result.message,
                  type: "error"
                });
              }
            }.bind(this)
          );
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除"
          });
        });
    },
    toggleSelection(rows) {
      if (rows) {
        rows.forEach(row => {
          this.$refs.multipleTable.toggleRowSelection(row);
        });
      } else {
        this.$refs.multipleTable.clearSelection();
      }
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    batchRemove() {
      this.multipleSelection.forEach(row => {
        console.log(row.id);
      });
    },
    expand(row, expanded) {
      var that = this;
      if (that.expands.length != 0) {
        that.expands = [];
      }
      if (expanded) {
        that.expands.push(row.scoreId);
      }
      this.experimentScoreArr = eval("(" + row.score + ")");
    },
    exportFile() {
      var params = {
        semesterId: this.formInline.semesterId,
        courseId: this.formInline.courseId,
        clazzId: this.formInline.clazzId
      };
      exportStudentScore(params)
        .then(
          function(result) {
            if (result.status) {
              this.$message({
                message: "导出成功",
                type: "success"
              });
              window.open(result.data, "_blank");
            } else {
              this.$message({
                message: result.message,
                type: "fail"
              });
            }
          }.bind(this)
        )
        .catch(
          function(error) {
            this.loading2 = false;
            console.log(error);
          }.bind(this)
        );
    },
    semesterChanage() {
      var params = { semesterNumber: this.formInline.semesterId };
      getCourse(params).then(
        function(result) {
          this.courseOptions = result.data;
          this.formInline.courseId = result.data[0].id;
        }.bind(this)
      );
    },
    courseChanage() {
      var params = {
        semesterNumber: this.formInline.semesterId,
        courseId: this.formInline.courseId
      };
      getClazzList(params).then(
        function(result) {
          this.clazzOptions = result.data;
          this.formInline.clazzId = result.data[0].id;
        }.bind(this)
      );
    },
    clazzChanage() {
      this.loadData();
    }
  }
};
</script>