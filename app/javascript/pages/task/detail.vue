<template>
  <div>
    <h1>タスク詳細</h1>
    <h3>{{ task.title }}</h3>
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
        <span>{{ task.total_time }}</span>
        時間
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
        @update-task-title="ChangeTaskTitle"
        @reset-task="ResetTask"
        @delete-task="DeleteTask"
      />
    </transition>
  </div>
</template>

<script>
import TaskEditModal from "./components/TaskEditModal"


export default {
  name: "TaskDetail",
  components: {
    TaskEditModal
  },
  data() {
    return {
      isVisibleTaskEditModal: false,
      taskEdit: {},
      task: [],
    }
  },

  created() {
    this.getDetail();
  },

  methods: {
    getDetail() {
      this.$axios.get(`http://localhost:3000/api/v1/tasks/${this.$route.params.id}`)
        // ここはなぜかフルで書かないと機能しない後で調べる
        .then(res => this.task = res.data)
        .catch(err => console.log(err.status));
    },

    handleShowTaskEditModal() {
      this.isVisibleTaskEditModal = true;
      this.taskEdit = this.task;
    },

    CloseTaskEditModal() {
      this.isVisibleTaskEditModal = false;
      this.taskEdit = {};
    },

    ChangeTaskTitle(task) {
      this.$axios.patch(`http://localhost:3000/api/v1/tasks/${task.id}`, task)
        .then(res => this.data = res.data)
      this.CloseTaskEditModal();
    },

    ResetTask(task) {
      this.$axios.patch(`http://localhost:3000/api/v1/tasks/${task.id}`, task)
        .then(res => this.data = res.data)
      this.CloseTaskEditModal();
    },

    DeleteTask(task) {
      this.$axios.delete(`http://localhost:3000/api/v1/tasks/${task.id}`)
        .then(res => this.$router.push({ name: 'TaskIndex' }))
    }
  }
}
</script>
