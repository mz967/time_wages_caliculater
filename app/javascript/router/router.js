import Vue from "vue";
import Router from "vue-router";
import store from '../store/store';
import HomeTop from "../pages/home/top";
import HomeIntroduction from "../pages/home/introduction";
import HomeExplanation from "../pages/home/explanation";
import HomeNavigation from "../pages/home/navigation";
import TaskIndex from "../pages/task/index";
import TaskDetail from "../pages/task/detail";
import TaskResult from "../pages/task/result";
import RegisterNew from "../pages/register/new";
import RegisterWage from "../pages/register/wage";
import Login from "../pages/login/login";

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
      path: "/introduction",
      component: HomeIntroduction,
      name: "HomeIntroduction",
    },
    {
      path: "/explanation",
      component: HomeExplanation,
      name: "HomeExplanation",
    },
    {
      path: "/navigation",
      component: HomeNavigation,
      name: "HomeNavigation",
    },
    {
      path: "/tasks",
      component: TaskIndex,
      name: "TaskIndex",
      meta: { requiredAuth: true },
    },
    {
      path: "/task/:id",
      component: TaskDetail,
      name: "TaskDetail",
      meta: { requiredAuth: true },
    },
    {
      path: "/task/:id/result",
      component: TaskResult,
      name: "TaskResult",
      meta: { requiredAuth: true },
    },
    {
      path: "/register",
      component: RegisterNew,
      name: "RegisterNew",
    },
    {
      path: "/wage_register",
      component: RegisterWage,
      name: "RegisterWage",
    },
    {
      path: "/login",
      component: Login,
      name: "Login",
    },
  ]
})

// router.beforeEach((to, from, next) => {
//   if (!localStorage.auth_token) return null
//   if (state.authUser) return state.authUser

//   const userResponse = this.$axios.get('users/me')
//     .then((authUser) => {
//       if (to.matched.some(record => record.meta.requiredAuth) && !authUser) {
//         next({ name: 'Login' });
//       } else {
//         next();
//       }
//     })
//     .catch((err) => {
//       return null
//     })
//   if (!userResponse) return null

//   const authUser = userResponse.data
//   if (authUser) {
//     commit('setUser', authUser)
//     return authUser
//   } else {
//     commit('setUser', null)
//     return null
//   }
// });

router.beforeEach((to, from, next) => {
  store.dispatch('users/fetchAuthUser').then((authUser) => {
    if (to.matched.some(record => record.meta.requiredAuth) && !authUser) {
      next({ name: 'Login' });
    } else {
      next();
    }
  })
});

export default router