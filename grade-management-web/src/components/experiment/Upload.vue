<template>
<!-- <el-upload
  class="upload-demo"
  action=""
  :before-remove="beforeRemove"
  :before-upload="beforeAvatarUpload"
  multiple>
  <el-button size="small" type="primary">点击导入</el-button>
  <div slot="tip" class="el-upload__tip">只能上传xls/xlsx文件</div>
</el-upload> -->
<el-upload
  class="upload-demo"
  :action="uploadUrl"
  name="file"
  :before-upload="beforeAvatarUpload"
  :file-list="fileList"
  :on-success="onSuccess"
  multiple>
  <el-button size="small" type="primary">点击导入</el-button>
  <div slot="tip" class="el-upload__tip">只能上传xls/xlsx文件</div>
</el-upload>
</template>
<script type="text/javascript">
  import {uploadFile} from '../../api'

  export default {
    data() {
      return {
        fileList: []
      };
    },
    computed:{
      uploadUrl() {
        return uploadFile;
      }
    },
    mounted() {
      this.$store.dispatch('hideHeader');
    },
    methods: {
      beforeAvatarUpload(file) {
        const isEXCEL = (file.type === 'application/vnd.ms-excel') || file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
        if (!isEXCEL) {
          this.$message.error('导入的文件只能是 xls或xlsx 格式!');
        }
        return isEXCEL;
      },
      onSuccess(response){
        if(response.status){

        }else{
          this.$message.error(response.message);
        }
      }
    }
  }
</script>