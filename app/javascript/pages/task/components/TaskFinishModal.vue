<template>
  <div
    class="fixed z-10 inset-0 overflow-y-auto"
    aria-labelledby="modal-title"
    role="dialog"
    aria-modal="true"
  >
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div
        class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
        aria-hidden="true"
      />
      <span
        class="hidden sm:inline-block sm:align-middle sm:h-screen"
        aria-hidden="true"
      >&#8203;</span>
      <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
        <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
          <div class="sm:flex sm:items-start">
            <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
              <h3
                id="modal-title"
                class="text-lg leading-6 font-medium text-gray-900"
              >
                お疲れさまでした!!
              </h3>
              <div class="mt-2">
                <p class="text-sm text-gray-800">
                  今回は
                  <span>{{ work_timeH }}</span>時間
                  <span>{{ work_timeM }}</span>分
                  <span>{{ work_timeS }}</span>秒で
                  <br>
                  <span>{{ this_task_wage }}</span>円分の働きとなりました!
                </p>
                <br>
                <p class="text-sm text-gray-800">
                  これまでの累計時間は
                  <span>{{ total_timeH }}</span>時間
                  <span>{{ total_timeM }}</span>分
                  <span>{{ total_timeS }}</span>秒
                  となり
                  <br>
                  累計の金額は<span>{{ task.total_wage }}</span>円となりました!
                </p>
              </div>
              <h3
                class="text-lg leading-6 font-medium text-gray-900 mt-10"
              >
                今回のタスクの取り組みを評価してみましょう!
              </h3>
              <div class="flex">
                <p>低</p>
                <input
                  id="range"
                  v-model="work.evaluation"
                  type="range"
                  min="0"
                  max="10"
                  class="w-full"
                  step="1"
                  value="5"
                  list="tickmarks"
                >
                <datalist id="tickmarks">
                  <option value="0" />
                  <option value="1" />
                  <option value="2" />
                  <option value="3" />
                  <option value="4" />
                  <option value="5" />
                  <option value="6" />
                  <option value="7" />
                  <option value="8" />
                  <option value="9" />
                  <option value="10" />
                </datalist>
                <p>高</p>
              </div>
              <h1><span>{{ work.evaluation }}</span>点</h1>
            </div>
          </div>
        </div>
        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
          <button
            type="button"
            class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm"
            @click="handleDeleteWork"
          >
            今回は登録しない
          </button>
          <button
            type="button"
            class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
            @click="handleEvaluationWork"
          >
            評価してタスクを終了する
          </button>
          <!-- <router-link
            :to="{ name: 'TaskIndex' }"
            type="button"
            class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm"
          >
            タスク一覧へ
          </router-link> -->
          <button
            type="button"
            class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
            @click="handleCloseModal"
          >
            評価してタスクをもう一度計測する
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: "TaskFinishModal",
  props: {
    work: {
      type: Object,
      required: true,
      id: {
        type: Number,
        required: true
      },
      work_time: {
        type: Number,
        required: true
      },
      hourly_wage: {
        type: Number,
        required: true
      },
      evaluation: {
        type: Number
      }
    },
    task: {
      type: Object,
      required: true,
      id: {
        type: Number,
        required: true
      },
      total_time: {
        type: Number,
        required: true
      },
      total_wage: {
        type: Number,
        required: true
      },
    }
  },

  data() {
    return {
    }
  },

  computed: {
    // ...mapGetters("tasks", ["tasks"]),
    this_task_wage(){
      var this_task_wage = Math.floor(this.work.hourly_wage*this.work.work_time/60/60)
      return this_task_wage
    },

    work_timeH() {
      var work_timeH = Math.floor(this.work.work_time % (24 * 60 * 60) / (60 * 60));
      return work_timeH
    },
    work_timeM() {
      var work_timeM = Math.floor(this.work.work_time % (24 * 60 * 60) % (60 * 60) / 60);
      return work_timeM
    },
    work_timeS() {
      var work_timeS = this.work.work_time % (24 * 60 * 60) % (60 * 60) % 60;
      return work_timeS
    },

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
    }
  },

  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    },
    handleEvaluationWork() {
      this.$emit('evaluation-work', this.work, this.task )
    },
    handleDeleteWork() {
      this.$emit('delete-work', this.work, this.task)
    }
  }
}
</script>

<style scoped>
</style>