<template>
  <div id="teachers">
    <el-button type="primary" @click="addData">新增</el-button>
    <el-table
      :data="tableData"
      style="width: 100%"
      v-loading="loading2"
      element-loading-text="拼命加载中"
      @selection-change="handleSelectionChange"
    >
      <!-- <el-table-column type="selection" width="55"></el-table-column> -->
      <el-table-column type="index" width="100" label="序号"></el-table-column>
      <el-table-column prop="name" label="等级"></el-table-column>
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
      </div> -->
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
        <el-form-item label="等级" :label-width="formLabelWidth">
          <el-input v-model="form.name" auto-complete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="update">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="新增信息" :visible.sync="dialogAddFormVisible">
      <el-form :model="addForm">
        <el-form-item label="等级" :label-width="formLabelWidth">
          <el-input v-model="addForm.name" auto-complete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogAddFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="add">确 定</el-button>
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
import { getScoreLevelList, updateScoreLevel, deleteScoreLevel,addScoreLevel } from "../../api";

export default {
  data() {
    return {
      tableData: [],
      formInline: {
        name: "",
        number: "",
        id: ""
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
      dialogAddFormVisible:false,
      formLabelWidth: "120px",
      form: {
        name: "",
        number: "",
        id: ""
      },
      addForm: {
        name: "",
        number: ""
      },
      loading2: false,
      selectedOptions: [],
      multipleSelection: []
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
      var params = {
        pageNum: this.currentPage,
        pageSize: this.pageSize,
      };
      getScoreLevelList(params)
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
    //查询
    onSubmit() {
      console.log(this.selectedOptions[1]);
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
      this.form.number = data.number;
      this.dialogFormVisible = true;
    },
    update() {
      if (this.form.name == "") {
        this.$message.error("姓名不能为空");
        return;
      }
      var params = {
        id: this.form.id,
        name: this.form.name
      };
      updateScoreLevel(params)
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
                type: "error"
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
    add() {
      if (this.addForm.name == "") {
        this.$message.error("等级不能为空");
        return;
      }
      var params = {
        name: this.addForm.name
      };
      addScoreLevel(params)
        .then(
          function(result) {
            if (result.status) {
              this.$message({
                message: "添加成功",
                type: "success"
              });
              this.dialogAddFormVisible = false;
              this.loadData();
            } else {
              this.$message({
                message: result.message,
                type: "error"
              });
              //this.dialogAddFormVisible = false;
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
          var params = {
            id: data.id
          };
          deleteScoreLevel(params).then(function(result) {
            if (result.status) {
              this.$message({
                type: "success",
                message: "删除成功!"
              });
              this.loadData();
            }else{
              this.$message({
                message: result.message,
                type: "error"
              });
            }
          }.bind(this));
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
    addData(){
      this.addForm={
        "name":""
      }
      this.dialogAddFormVisible = true;
    }
  }
};
</script>