<template>
  <div>
    <h1 class="text-center mb-10 text-2xl">
      {{ task.title }}
    </h1>
    <StopWatchFunction
      :task="task"
      @create-work="handleCreateWork"
    />
    <div class="relative shadow bg-gray-300 h-96 mt-10 pt-10 ">
      <div class="static h-2/3 w-5/6 bg-white mx-auto px-8 pt-16">
        <div
          class="shadow bg-red-900 h-2/3 text-white text-center"
          :style="{width: Math.floor(task.total_wage / 500000 * 100) + '%'}"
        >
          <h1>{{ task.total_wage }}</h1>
        </div>
      </div>
      <div class="static h-4/1 w-5/6 pt-10 text-center" />
      <p>
        これまでの合計時間
        <span>{{ total_timeH }}</span>時間
        <span>{{ total_timeM }}</span>分
        <span>{{ total_timeS }}</span>秒
      </p>
      <p>
        これまでの合計金額
        <span>{{ task.total_wage }}</span>
        円
      </p>
    </div>
    <div>
      <button
        class="inline-flex items-center bg-green-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 my-40"
        @click="handleShowTaskEditModal"
      >
        編集する
      </button>
      <router-link
        :to="{ name: 'TaskIndex' }"
        class="inline-flex items-center bg-blue-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 my-40"
      >
        一覧へ戻る
      </router-link>
    </div>

    <transition name="fade">
      <TaskEditModal
        v-if="isVisibleTaskEditModal"
        :task="taskEdit"
        @close-task-edit-modal="CloseTaskEditModal"
        @update-task="handleUpdateTask"
        @delete-task="handleDeleteTask"
      />
    </transition>
    <transition name="fade">
      <TaskFinishModal
        v-if="isVisibleTaskFinishModal"
        :work="work"
        :task="task"
        @close-modal="handlecloseTaskFinishModal"
      />
    </transition>
  </div>
</template>

<script>
import TaskEditModal from "./components/TaskEditModal"
import StopWatchFunction from "./components/StopWatchFunction"
import TaskFinishModal from "./components/TaskFinishModal"
// import { mapGetters, mapActions, mapState } from "vuex"

export default {
  name: "TaskDetail",
  components: {
    TaskEditModal,
    StopWatchFunction,
    TaskFinishModal
  },
  data() {
    return {
      // ...mapState("tasks", [
      // "task"
      // ]),
      isVisibleTaskEditModal: false,
      taskEdit: {},
      task: {},
      work: {},
      isVisibleTaskFinishModal: false,
    }
  },

  computed: {
    // ...mapGetters("tasks", [
    //   "task",
    //   "total_timeH",
    //   "total_timeM",
    //   "total_timeS",

    // ]),
    total_timeH() {
      var total_timeH = Math.floor(this.task.total_time % (24 * 60 * 60) / (60 * 60));
      return total_timeH
    },
    total_timeM() {
      var total_timeM = Math.floor(this.task.total_time % (24 * 60 * 60) % (60 * 60) / 60);
      return total_timeM
    },
    total_timeS() {
      var total_timeS = this.task.total_time % (24 * 60 * 60) % (60 * 60) % 60;
      return total_timeS
    },

    // graph_width() {
    //   var graph_width = Math.floor(task.total_wage / 500000 * 100);
    //   return graph_width
    // }
  },

  created() {
    this.fetchDetail();
  },

  methods: {
    // ...mapActions(
    //   "tasks", [
    //   "fetchDetail",
    //   "updateTask",
    //   // "deleteTask",
    //   "setTask",
    //   ],
    //   "works", [
    //     "setWork",
    //     // "createWork"
    //   ]
    // ),
    
    // task取得
    fetchDetail() {
      this.$axios.get(`http://localhost:3000/api/v1/tasks/${this.$route.params.id}`)
        // ここはなぜかフルで書かないと機能しない後で調べる
        .then(res => this.task = res.data)
        .catch(err => console.log(err.status));
    },

    // タスク編集関連
    // モーダル出現系
    handleShowTaskEditModal() {
      this.isVisibleTaskEditModal = true;
      this.taskEdit = this.task;
    },
    CloseTaskEditModal() {
      this.isVisibleTaskEditModal = false;
      this.taskEdit = {};
    },
    // タイトル変更
    async handleUpdateTask(task) {
      try {
        await this.$axios.patch(`http://localhost:3000/api/v1/tasks/${task.id}`, task)
        .then(res => this.data = res.data)
        this.CloseTaskEditModal();
      } catch (error) {
        console.log(error);
      }
    },

    // ChangeTaskTitle(task) {
    //   this.$axios.patch(`http://localhost:3000/api/v1/tasks/${task.id}`, task)
    //     .then(res => this.data = res.data)
    //   this.CloseTaskEditModal();
    // },

    // ResetTask(task) {
    //   this.$axios.patch(`http://localhost:3000/api/v1/tasks/${task.id}`, task)
    //     .then(res => this.data = res.data)
    //   this.CloseTaskEditModal();
    // },

    // タスク削除
    async handleDeleteTask(task) {
      try {
        // await this.deleteTask(task);
        await this.$axios.delete(`http://localhost:3000/api/v1/tasks/${task.id}`, task)
        this.$router.push({ name: 'TaskIndex' })
      } catch (error) {
        console.log(error);
      }
    },

    // handleDeleteTask(task) {
    //   this.$axios.delete(`http://localhost:3000/api/v1/tasks/${task.id}`)
    //     .then(res => this.$router.push({ name: 'TaskIndex' }))
    // },

    // タイマー関連
    // handleCreateWork(work, task) {
    //   this.$axios.post('http://localhost:3000/api/v1/works', {work, task})
    //   .then(res => {
    //     this.work = res.data.work, this.task = res.data.task})
    //   // this.setTask (updateTask)
    //   this.handleshowTaskFinishModal();
    // },

    handleCreateWork(work, task) {
      this.$axios.post('http://localhost:3000/api/v1/works', {work, task})
        .then(res => {this.work = res.data.work, this.task = res.data.task})
      this.handleshowTaskFinishModal();
    },

    //  async handleCreateWork(work) {
    //   try {
    //     await this.createWork(work)
    //     // $axios.post('http://localhost:3000/api/v1/works', {work, task})
    //     //   .then(res => {('setWork', res.data.work), ('setTask',res.data.task)})
    //     this.handleshowTaskFinishModal();
    //   } catch (error) {
    //     console.log(error);
    //   }
    // },

    // ("setTask",res.data.task)

    // CreateWork(work, task) {
    //   this.$axios.post('http://localhost:3000/api/v1/works', {work, task})
    //   .then(res => {commit('setWork', res.data.work) , commit('setTask',res.data.task) })
    //   this.handleshowTaskFinishModal();
    // },

    handleshowTaskFinishModal() {
      this.isVisibleTaskFinishModal = true;
      // this.workDetail = this.work;
      // this.taskFinishDetail = this.task;
    },

    handlecloseTaskFinishModal() {
      this.isVisibleTaskFinishModal = false;
      // this.workDetail = {};
      // this.taskFinishDetail = {};
    },

  }
}
</script>
