import Vue from 'vue'
import Vuex from 'vuex'
// import tasks from './modules/tasks'
// import works from './modules/works'
import users from './modules/users'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    // tasks,
    // works,
    users
  }
})