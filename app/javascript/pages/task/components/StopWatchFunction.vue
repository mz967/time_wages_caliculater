<template>
  <!-- <div class="flex "></div> -->
  <div class="text-center bg-gray-100 shadow h-96 w-96 mx-auto rounded-full">
    <div class="pt-32">
      <p class="text-6xl mb-10">
        {{ timerH }} : {{ timerM }} : {{ timerS }}
      </p>
      <!-- <h1>{{work.start_at}}</h1>
      <h1>{{work.end_at}}</h1> -->
      <button
        v-show="watch"
        class="inline-flex items-center bg-blue-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 my-40"
        @click="handleStart()"
      >
        計測スタート
      </button>
      <button
        v-show="!watch"
        class="inline-flex items-center bg-blue-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 my-40"
        @click="handleEnd()"
      >
        計測ストップ
      </button>
    </div>
  </div>
</template>

<script>
// import { mapGetters, mapMutations, mapState } from "vuex"

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
      // ...mapState("works", [
      // "work",
      // ]),
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
    // ...mapGetters("works", [
    //   // "work",
    //   "timerH",
    //   "timerM",
    //   "timerS",
    //   ]),
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
      }
  },

  methods: {
    // ...mapMutations("works", [
    //   "timerStart",
    //   "timerEnd",
    // ]),
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

    // async handleStart(work) {
    //   try {
    //     await this.timerStart(work);
    //     this.watch = false
    //   } catch (error) {
    //     console.log(error);
    //   }
    // },
    // async handleEnd({task, work}) {
    //   try {
    //     await this.timerEnd({task, work});
    //     this.$emit('create-work', this.work)
    //     this.watch = true
    //   } catch (error) {
    //     console.log(error);
    //   }
    // },
    // async handleStart() {
    //   try {
    //     await this.timerStart();
    //     this.watch = false
    //   } catch (error) {
    //     console.log(error);
    //   }
    // },
    // async handleEnd(task) {
    //   try {
    //     await this.timerEnd(task);
    //     this.$emit('create-work', this.work, this.task)
    //     this.watch = true
    //   } catch (error) {
    //     console.log(error);
    //   }
    // },
  }
}
</script>

<style scoped>
</style>
