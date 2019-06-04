<template>
  <div id="index">
    Index
  </div>
</template>
<script type="text/javascript">
  export default {
    mounted() {
      this.open();
    },
    methods: {
       open() {
        const h = this.$createElement;

        this.$notify({
          title: '',
          message: h('i', { style: 'color: teal'}, '欢迎进入实验评分管理系统'),
          offset: 100
        });
      }
    }
  }
</script>