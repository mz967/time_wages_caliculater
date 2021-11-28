import Vue from "vue";
import Router from "vue-router";
import HomeTop from "../pages/home/top";
import HomeIntroduction from "../pages/home/introduction";
import TaskIndex from "../pages/task/index";
import TaskDetail from "../pages/task/detail";

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: HomeTop,
      name: "HomeTop",
    },
    {
      path: "/",
      component: HomeIntroduction,
      name: "HomeIntroduction",
    },
    {
      path: "/tasks",
      component: TaskIndex,
      name: "TaskIndex",
    },
    {
      path: "/task/:id",
      component: TaskDetail,
      name: "TaskDetail",
      props: true
    },
  ]
})

export default router