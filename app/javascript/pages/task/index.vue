<template>
  <div>
    <h1 class="text-center text-lg">
      タスク一覧
    </h1>

    <div v-if="tasks.length">
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
                    <div class="h-full bg-gray-300 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative ">
                      <h1 class="tracking-widest text-gray-700 mb-1">
                        {{ task.title }}
                      </h1>
                      <div class="p-10 m-4 bg-white">
                        ここにグラフをいれる
                      </div>
                      <h2 class="m-4">
                        現在までの累計金額
                      </h2>
                      <p>{{ task.total_wage }}円</p>
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
                  class="h-full bg-gray-300 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative "
                  @click="handleShowTaskCreateModal"
                >
                  <i class="las la-plus text-6xl pt-20 " />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div v-else>
      <div class="text-gray-600 body-font">
        <div class="container px-5 py-24 mx-auto">
          <div class="flex flex-nowrap -m-4">
            <div class="p-4 h-96 w-96">
              <div
                class="h-full bg-gray-300 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative "
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
      isVisibleTaskCreateModal: false
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
      this.handlecloseTaskCreateModal();
    },
  }
}
</script>
