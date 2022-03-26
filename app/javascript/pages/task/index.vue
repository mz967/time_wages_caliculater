<template>
  <div>
    <div class="flex flex-wrap  justify-center mb-32 ">
      <div
        v-for="task in tasks"
        :key="task.id"
        class=""
      >
        <div class="text-white body-font text-center">
          <div class="container py-4 mx-auto">
            <!-- <div class="flex flex-nowrap m-4"> -->
            <div class="p-4 h-96 w-96">
              <router-link :to="{name: 'TaskDetail', params: {id: task.id}}">
                <div class="h-full w-full bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl border-2">
                  <h1 class="tracking-widest mb-1 text-xl">
                    {{ task.title }}
                  </h1>
                  <div class="h-56 w-64 m-4 bg-white  border-2 border-blue-200 justify-center rounded-lg flex">
                    <div
                      class="w-24 bg-gradient-to-b hover:bg-gradient-to-t from-yellow-200 via-yellow-500 to-yellow-300 shadow border-yellow-200 self-end rounded-lg"
                      :style="{height: Math.floor(task.total_wage / 100000 * 100) + '%'}"
                    />
                  </div>
                  <h2 class="m-4">
                    累計 <span class="text-3xl">{{ task.total_wage }}</span> 円
                  </h2>
                </div>
              </router-link>
            </div>
            <!-- </div> -->
          </div>
        </div>
      </div>
      <div class="text-white body-font">
        <div class="container py-4 mx-auto">
          <!-- <div class="flex flex-nowrap -m-4"> -->
          <div class="p-4 h-96 w-96">
            <div
              id="create_task"
              class="h-full bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl border-2"
              @click="handleShowTaskCreateModal"
            >
              <p class="text-6xl pt-20 ">
                ＋
              </p>
            </div>
          </div>
          <!-- </div> -->
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
import { mapGetters } from "vuex"

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

  computed: {
    // ...mapGetters("tasks", ["tasks"]),
    ...mapGetters("users", ["authUser"]),
  },

  created() {
    this.fetchTasks();
  },

  methods: {
    // ...mapActions("tasks", [
    //   "fetchTasks",
    //   "createTask",
    // ]),
    fetchTasks() {
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
      // this.fetchTasks()
      this.handlecloseTaskCreateModal()
      this.$store.commit(`message/setContent`,{
        content: 'タスクを作成しました!',
        timeout: 6000
      })
    },

    // async handleCreateTask(task) {
    //   try {
    //     await this.createTask(task);
    //     this.handlecloseTaskCreateModal();
    //   } catch (error) {
    //     console.log(error);
    //   }
    // },
      //  なぜかmodalがcloseしない

    // graphHeight(task) {
    //   Math.floor(task.total_wage / 500000 * 100)
    // }
  }
}

// プラスでタスク足したあとにそのタスク詳細にいくとなぜかtaskが受信されない
</script>

<style scoped>

</style>