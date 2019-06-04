import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      redirect: '/login'
    },
    {
      path: '/login',
      component: resolve => require(['../components/teacher/Login.vue'], resolve)
    },
    {
      path: '/home',
      component: resolve => require(['../components/Home.vue'], resolve),
      children:[
        {
          path: '/',
          component: resolve => require(['../components/Index.vue'], resolve)
        },
        {
          path: '/teachers',
          component: resolve => require(['../components/teacher/Teachers.vue'], resolve)
        },
        {
          path: '/upload',
          component: resolve => require(['../components/experiment/Upload.vue'], resolve)
        }
      ]
    }
  ]
})