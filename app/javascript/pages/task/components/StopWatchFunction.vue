<template>
  <!-- <div class="flex "></div> -->
  <div class="text-center bg-gray-100 shadow h-96 w-96 mx-auto rounded-full">
    <div class="pt-32">
      <p class="text-6xl mb-10">
        {{ h }} : {{ m }} : {{ s }}
      </p>
      <button
        v-show="watch"
        class="inline-flex items-center bg-blue-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 my-40"
        @click="start"
      >
        計測スタート
      </button>
      <button
        v-show="!watch"
        class="inline-flex items-center bg-blue-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 my-40"
        @click="end"
      >
        計測ストップ
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'StopWatchFunction',
  props: {
    task: {
      type: Object,
      required: true,
      id: {
        type: Number,
        required: true
      },
      title: {
        type: String,
        required: true
      },
      total_wage: {
        type: Number,
        required: true
      },
      total_time: {
        type: Number,
        required: true
      },
      user_id: {
        type: Number,
        required: true
      }
    }
  },
  data() {
    return {
      startTime: 0 ,
      pastTime: 0 ,
      timerObj: null,
      work :{
        start_at :'',
        end_at :'',
        task_id :''
      },
      watch: true
    }
  },

  computed: {
    h(){
      var h = Math.floor( this.pastTime / 3600000 % 60 )
      return ( '0' + h ).slice(-2)
      },
    m(){
      var m = Math.floor( this.pastTime / 60000 % 60 )
      return ( '0' + m ).slice(-2)
      },
    s(){
      var s = Math.floor( this.pastTime / 1000 % 60 )
      return ( '0' + s ).slice(-2)
      }
  },

  methods: {
    countUp(){
      return this.pastTime = Date.now() - this.startTime
    },
    start(){
      this.startTime = Date.now()
      this.$set(this.work, 'start_at', Date())
      var self = this

      this.timerObj = setInterval(function(){
        self.countUp()
      },10)
      this.watch = false
    },

    end(){
      clearInterval( this.timerObj )
      this.$set(this.work, 'end_at', Date())
      this.$set(this.work, 'task_id', this.task.id)
      this.startTime = 0
      this.pastTime = 0
      this.timerObj = null
      this.watch = true
      this.$emit('create-work', this.work, this.task)
    },
  }
}
</script>

<style scoped>
</style>
