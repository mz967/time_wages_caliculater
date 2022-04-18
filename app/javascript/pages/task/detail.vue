<template>
  <transition name="pagefade">
    <div class="w-full mb-20">
      <h1 class="text-center mb-10 font-bold xl:text-2xl text-6xl">
        {{ task.title }}
      </h1>
      <StopWatchFunction
        :task="task"
        @create-work="handleCreateWork"
      />
      <div class="text-center mb-20 pt-10 xl:pt-0">
        <h2 class="mt-10 xl:text-xl text-4xl">
          これまでの合計時間
          <span class="xl:text-5xl text-6xl">{{ total_timeH }}</span>時間
          <span class="xl:text-5xl text-6xl">{{ total_timeM }}</span>分
          <span class="xl:text-5xl text-6xl">{{ total_timeS }}</span>秒
        </h2>
        <h2 class="mt-10 xl:text-xl text-4xl">
          これまでの合計金額
          <span class="xl:text-5xl text-6xl">{{ task.total_wage.toLocaleString() }}</span>
          円
        </h2>
      </div>
      <div class="text-center underline  xl:text-base text-3xl pt-10 xl:pt-0">
        <div class="mb-6">
          <router-link
            :to="{name: 'TaskResult', params: {id: task.id}}"
            class="hover:text-blue-500"
          >
            タスクの取組状況
          </router-link>
        </div>
        <h1
          class="hover:text-blue-500 mb-6"
          @click="handleShowTaskEditModal"
        >
          タスクを編集する
        </h1>
        <div class="mb-6">
          <router-link
            :to="{ name: 'TaskIndex' }"
            class="hover:text-blue-500"
          >
            一覧へ戻る
          </router-link>
        </div>
      </div>

      <transition name="fade">
        <TaskEditModal
          v-if="isVisibleTaskEditModal"
          :task="taskEdit"
          @close-task-edit-modal="CloseTaskEditModal"
          @update-task="handleUpdateTask"
          @delete-task="handleDeleteTask"
          @reset-task="handleResetTask"
        />
      </transition>

      <transition name="fade">
        <TaskFinishModal
          v-if="isVisibleTaskFinishModal"
          :work="work"
          :task="task"
          @close-modal="handlecloseTaskFinishModal"
          @evaluation-work-index="handleEvaluateWorkIndex"
          @evaluation-work-close="handleEvaluateWorkClose"
          @delete-work="handleDeleteWork"
        />
      </transition>
    </div>
  </transition>
</template>

<script>
import TaskEditModal from "./components/TaskEditModal"
import StopWatchFunction from "./components/StopWatchFunction"
import TaskFinishModal from "./components/TaskFinishModal"

export default {
  name: "TaskDetail",
  components: {
    TaskEditModal,
    StopWatchFunction,
    TaskFinishModal
  },
  data() {
    return {
      isVisibleTaskEditModal: false,
      taskEdit: {},
      task: {},
      work: {},
      isVisibleTaskFinishModal: false,
    }
  },

  computed: {
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
    // initialEvaluation(){
    //   this.work.evaluation = 5;
    // }
  },

  created() {
    this.fetchDetail();
  },

  methods: {
    // task取得
    fetchDetail() {
      this.$axios.get( `${process.env.VUE_BASE_API}/tasks/${this.$route.params.id}`)
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
        await this.$axios.patch( `${process.env.VUE_BASE_API}/tasks/${task.id}`, task)
        .then(res => this.data = res.data)
        this.CloseTaskEditModal();
        this.$store.commit(`message/setContent`,{
          content: 'タスク名を変更しました!',
          timeout: 6000
        })
      } catch (error) {
        console.log(error);
      }
    },

    async handleResetTask(task) {
      try {
        await this.$axios.patch( `${process.env.VUE_BASE_API}/tasks/${task.id}/reset`, task)
        // .then(res => this.data = res.data)
        this.CloseTaskEditModal();
        this.$router.go({path: this.$router.currentRoute.path, force: true})
        this.$store.commit(`message/setContent`,{
          content: 'タスクの値をリセットしました!',
          timeout: 6000
        })
      } catch (error) {
        console.log(error);
      }
    },

    // タスク削除
    async handleDeleteTask(task) {
      try {
        // await this.deleteTask(task);
        await this.$axios.delete( `${process.env.VUE_BASE_API}/tasks/${task.id}`, task)
        this.$router.push({ name: 'TaskIndex' })
        this.$store.commit(`message/setContent`,{
          content: 'タスクを破棄しました!',
          timeout: 6000
        })
      } catch (error) {
        console.log(error);
      }
    },

    handleCreateWork(work, task) {
      this.$axios.post( `${process.env.VUE_BASE_API}/tasks/${task.id}/works`, {work, task})
        .then(res => {this.work = res.data.work, this.task = res.data.task})
      this.handleshowTaskFinishModal();
    },

    handleshowTaskFinishModal() {
      this.isVisibleTaskFinishModal = true;
    },

    handlecloseTaskFinishModal() {
      this.isVisibleTaskFinishModal = false;
    },

    async handleEvaluateWorkIndex(work, task) {
      try {
        await this.$axios.patch( `${process.env.VUE_BASE_API}/tasks/${task.id}/works/${work.id}`, {work, task})
        .then(res => this.data = res.data)
        this.$router.push('/tasks')
        this.$store.commit(`message/setContent`,{
          content: `評価${work.evaluation}点にて今回のタスクを登録しました!`,
          timeout: 6000
        })
      } catch (error) {
        console.log(error);
      }
    },

    async handleEvaluateWorkClose(work, task) {
      try {
        await this.$axios.patch( `${process.env.VUE_BASE_API}/tasks/${task.id}/works/${work.id}`, {work, task})
        .then(res => this.data = res.data)
        this.isVisibleTaskFinishModal = false;
        this.$store.commit(`message/setContent`,{
          content: `評価${work.evaluation}点にて今回のタスクを登録しました!`,
          timeout: 6000
        })
      } catch (error) {
        console.log(error);
      }
    },

    async handleDeleteWork(work, task) {
      try {
        await this.$axios.delete( `${process.env.VUE_BASE_API}/tasks/${task.id}/works/${work.id}`, {work, task})
        this.isVisibleTaskFinishModal = false;
        this.$router.go({path: this.$router.currentRoute.path, force: true})
        this.$store.commit(`message/setContent`,{
          content: '今回のタスクを無しにしました!',
          timeout: 6000
        })
      } catch (error) {
        console.log(error);
      }
    },
  }
}
</script>

<style scoped>
/* フェード */
.fade-enter-active, .fade-leave-active{
  transition: opacity 0.5s
}
.fade-enter, .fade-leave-to{
  opacity: 0;
}

.pagefade-enter-active{
  transition: opacity 1s
}
.pagefade-enter{
  opacity: 0;
}
</style>