<template>
  <div class="text-center bg-gradient-to-b hover:bg-gradient-to-t from-black to-blue-900 shadow h-96 w-4/5 mx-auto border-8 border-gray-500 rounded-sm	 md:mb-0 mb-32">
    <div class="pt-32">
      <p class="text-7xl md:mb-10 mb-36 clock tracking-widest h-full w-full">
        <span class="">{{ timerH }}</span> : <span class="">{{ timerM }}</span> : <span class="">{{ timerS }}</span>
      </p>
    </div>
    <div>
      <a
        v-show="watch"
        class="items-center border-0 py-1 px-3 focus:outline-none text-white md:text-2xl text-6xl rounded mt-4 my-40 font-bold  bg-gradient-to-b hover:bg-gradient-to-t from-gray-400 via-gray-500 to-gray-400"
        @click="handleStart()"
      >
        START
      </a>
      <a
        v-show="!watch"
        class="items-center border-0 py-1 px-3 focus:outline-none text-white md:text-2xl text-6xl rounded mt-4 my-40 font-bold  bg-gradient-to-b hover:bg-gradient-to-t from-gray-400 via-gray-500 to-gray-400"
        @click="handleEnd()"
      >
        STOP
      </a>
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
      doingTime: 0 ,
      timerObject: null,
      work :{
        start_at :'',
        end_at :'',
        task_id :''
      },
      watch: true
    }
  },

  computed: {
    timerH(){
      var timerH = Math.floor( this.doingTime / 3600000 % 60 )
      return ( '0' + timerH ).slice(-2)
    },
    timerM(){
      var timerM = Math.floor( this.doingTime / 60000 % 60 )
      return ( '0' + timerM ).slice(-2)
    },
    timerS(){
      var timerS = Math.floor( this.doingTime / 1000 % 60 )
      return ( '0' + timerS ).slice(-2)
    },
  },

  methods: {
    countUp(){
      return this.doingTime = Date.now() - this.startTime
    },
    handleStart(){
      this.startTime = Date.now()
      this.$set(this.work, 'start_at', Date())
      var self = this

      this.timerObject = setInterval(function(){
        self.countUp()
      },10)
      this.watch = false
    },

    handleEnd(){
      clearInterval( this.timerObject )
      this.$set(this.work, 'end_at', Date())
      this.$set(this.work, 'task_id', this.task.id)
      this.startTime = 0
      this.doingTime = 0
      this.timerObject = null
      this.watch = true
      this.$emit('create-work', this.work, this.task)
    },
  }
}
</script>

<style scoped>
.container {
  width: 100%;
  height: 100vh;
  background-color: #15151e;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
}

/* 時計の共通スタイル */
.clock {
  color: white;
  /* text-shadow: 0 0 20px #0aafe6; */
  line-height: 1.2;
  text-align: center;
}

</style>
