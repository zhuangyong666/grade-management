<template>
  <div id="courses">
    <el-form :model="formInline" ref="formInline" class="demo-ruleForm" :inline="true">
      <el-form-item label="班级">
        <el-select v-model="formInline.clazzName" placeholder="请选择">
          <el-option
            v-for="item in clazzOptions"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="学号">
        <el-input v-model="formInline.number" placeholder="学号"></el-input>
      </el-form-item>

      <el-form-item label="姓名">
        <el-input v-model="formInline.name" placeholder="姓名"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="onSubmit">查询</el-button>
        <el-button @click="resetForm('formInline')">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table
      :data="tableData"
      style="width: 100%"
      v-loading="loading2"
      element-loading-text="拼命加载中"
      @selection-change="handleSelectionChange"
    >
      <!-- <el-table-column type="selection" width="55"></el-table-column> -->
      <el-table-column prop="number" label="学号"></el-table-column>
      <el-table-column prop="name" label="姓名" width="180"></el-table-column>
      <el-table-column prop="sex" label="性别"></el-table-column>
      <el-table-column prop="clazzName" label="班级" width="180"></el-table-column>
      <el-table-column fixed="right" label="操作" width="140">
        <template scope="scope">
          <!-- <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button> -->
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
</style>
<script type="text/javascript">
import { getStudentList, getClazzList, updateStudent } from "../../api";

export default {
  data() {
    return {
      tableData: [],
      formInline: {
        name: "",
        number: "",
        clazzName: ""
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
      ]
    };
  },
  mounted() {
    this.$store.dispatch("showHeader");
    this.loadData();
  },
  methods: {
    //加载数据
    loadData() {
      this.loading2 = true;
      getAllClazzList().then(
        function(result) {
          this.clazzOptions = result.data;
        }.bind(this)
      );
      var params = {
        pageNum: this.currentPage,
        pageSize: this.pageSize,
        params: {
          name: this.formInline.name,
          number: this.formInline.number,
          clazzName: this.formInline.clazzName
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
    update() {
      if (this.form.name == "") {
        this.$message.error("姓名不能为空");
        return;
      }
      var params = {
        id: this.form.id,
        name: this.form.name,
        sex:this.form.sex,
        clazzId:this.form.clazzId
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
      this.$confirm('确定要删除"' + data.name + '"?', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.$message({
            type: "success",
            message: "删除成功!"
          });
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
    }
  }
};
</script>