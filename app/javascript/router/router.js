import Vue from "vue";
import Router from "vue-router";
import HomeTop from "../pages/home/top";
import HomeIntroduction from "../pages/home/introduction";

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
  ],
})

export default router