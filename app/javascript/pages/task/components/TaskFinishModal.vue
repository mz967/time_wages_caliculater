<template>
  <div
    class="fixed z-10 inset-0 overflow-y-auto"
  >
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div
        class="fixed inset-0 bg-blue-200 bg-opacity-75 transition-opacity"
      />
      <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
        <div class="bg-white p-10">
          <div class="mt-3 text-left">
            <h3
              id="modal-title"
              class="leading-6 font-bold lg:text-2xl text-5xl lg:mb-10 mb-20 lg:mt-0 mt-10"
            >
              お疲れさまでした!!
            </h3>
            <div class="lg:text-base text-4xl">
              <p class="mb-3">
                今回は
                <span class="lg:text-xl text-5xl">{{ work_timeH }}</span>時間
                <span class="lg:text-xl text-5xl">{{ work_timeM }}</span>分
                <span class="lg:text-xl text-5xl">{{ work_timeS }}</span>秒で
              </p>
              <p class="mb-6">
                <span class="lg:text-2xl text-6xl text-red-500">{{ this_task_wage }}</span>円分の働きとなりました!
              </p>
            </div>
            <h3
              class="mb-3 mt-20 lg:text-base text-4xl"
            >
              今回のタスクの取り組みを評価してみましょう!
            </h3>
            <div class="flex mb-3 lg:text-base text-xl font-bold">
              <p class="m-2">
                低
              </p>
              <input
                id="range"
                v-model="work.evaluation"
                type="range"
                min="1"
                max="10"
                class="w-full"
                step="1"
                list="tickmarks"
                @change="onScole"
              >
              <datalist id="tickmarks">
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
              <p class="m-2">
                高
              </p>
            </div>
            <div class="text-center lg:mb-0 mb-20">
              <h1 v-if="scole===true">
                <span class="lg:text-xl text-5xl">{{ work.evaluation }}</span>点
              </h1> 
              <h1
                v-else
                class="text-red-400 px-4 py-3 rounded relative lg:text-base text-3xl"
              >
                点数を選択してください
              </h1>
            </div>
          </div>
        </div>
        <div class="px-4 py-3 text-center">
          <button
            type="button"
            class="w-4/5 inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-green-400 via-green-500 to-green-400 text-white hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 mb-4 lg:text-sm md:text-2xl  text-4xl"
            @click="handleEvaluationWorksClose"
          >
            評価してタスクをもう一度計測
          </button>
          <button
            type="button"
            class="w-4/5 inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 mb-4 lg:text-sm md:text-2xl text-4xl"
            @click="handleEvaluationWorkIndex"
          >
            評価してタスクを終了
          </button>
          <button
            type="button"
            class="w-4/5 inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-red-400 via-red-500 to-red-400 text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 mb-6 lg:text-sm md:text-2xl text-4xl"
            @click="handleDeleteWork"
          >
            今回は登録しない
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
      scole: []
    }
  },

  // created(){
  //   this.work.evaluation = 5;
  // },

  computed: {
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
    },
  },

  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    },
    handleEvaluationWorksClose() {
      this.$emit('evaluation-work-close', this.work, this.task)
    },
    handleEvaluationWorkIndex() {
      this.$emit('evaluation-work-index', this.work, this.task )
    },
    handleDeleteWork() {
      this.$emit('delete-work', this.work, this.task)
    },

    onScole(){
      this.scole = true;
    }
  }
}
</script>

<style scoped>
</style>