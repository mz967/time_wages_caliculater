<template>
  <div>
    <div class="flex flex-wrap">
      <div
        v-for="task in tasks"
        :key="task.id"
      >
        <div class="text-gray-600 body-font">
          <div class="container px-5 py-24 mx-auto">
            <div class="flex flex-nowrap -m-4">
              <div class="p-4 h-96 w-96">
                <router-link :to="{name: 'TaskDetail', params: {id: task.id}}">
                  <div class="h-full w-full bg-gray-300 bg-opacity-75 px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative ">
                    <h1 class="tracking-widest text-gray-700 mb-1">
                      {{ task.title }}
                    </h1>
                    <div class="h-56 w-64 m-4 bg-white justify-center flex">
                      <div
                        class="w-24 bg-red-900 self-end"
                        :style="{height: Math.floor(task.total_wage / 500000 * 100) + '%'}"
                      />
                    </div>
                    <h2 class="m-4">
                      累計金額 <span class="text-xl">{{ task.total_wage }}</span> 円
                    </h2>
                  </div>
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="text-gray-600 body-font">
        <div class="container px-5 py-24 mx-auto">
          <div class="flex flex-nowrap -m-4">
            <div class="p-4 h-96 w-96">
              <div
                id="create_task"
                class="h-full bg-gray-300 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative"
                @click="handleShowTaskCreateModal"
              >
                <i class="las la-plus text-6xl pt-20 " />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <transition name="fade">
      <TaskCreateModal
        v-if="isVisibleTaskCreateModal"
        @close-task-create-modal="handlecloseTaskCreateModal"
        @create-task="handleCreateTask"
      />
    </transition>
  </div>
</template>

<script>
import TaskCreateModal from "./components/TaskCreateModal"

export default {
  name: "TaskIndex",
  components: {
    TaskCreateModal
  },
  data() {
    return {
      tasks: [],
      isVisibleTaskCreateModal: false,
    }
  },

  created() {
    this.fetchtasks();
  },

  methods: {
    fetchtasks() {
      this.$axios.get("tasks")
        .then(res => this.tasks = res.data)
        .catch(err => console.log(err.status));
    },

    handleShowTaskCreateModal() {
      this.isVisibleTaskCreateModal = true;
    },

    handlecloseTaskCreateModal() {
      this.isVisibleTaskCreateModal = false;
    },

    handleCreateTask(task) {
      this.$axios.post("tasks", task)
        .then(res => this.tasks.push(task))
        .catch(err => console.log(err.status));
      // this.handlecloseTaskCreateModal();
      this.$router.go({path: this.$router.currentRoute.path, force: true})
    },
    // graphHeight(task) {
    //   Math.floor(task.total_wage / 500000 * 100)
    // }
  }
}

// プラスでタスク足したあとにそのタスク詳細にいくとなぜかtaskが受信されない
</script>

<style scoped>
</style>