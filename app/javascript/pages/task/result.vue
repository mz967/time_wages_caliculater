<template>
  <div>
    <h1 class="text-center mb-10 text-2xl">
      <span>{{ task.title }}</span>の推移表
    </h1>
    <select
      id="dating"
      v-model="selectedDating"
      class="appearance-none border rounded py-2 px-3 text-gray-700 leading-tight focus:outline-none"
    >
      <option
        disabled
        value=""
      >
        選択してください
      </option>
      <option
        v-for="dating in optionDating" 
        :key="dating.id" 
        :value="dating.id"
      >
        {{ dating.name }}
      </option>
    </select>

    <Chart
      v-if="selectedDating===1 || selectedDating===2"
      :chart-data="dataCollection"
    />

    <div>
      <router-link
        :to="{ name: 'TaskIndex' }"
        class="inline-flex items-center bg-blue-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 my-40"
      >
        一覧へ戻る
      </router-link>
    </div>
  </div>
</template>

<script>
import Chart from './components/Chart';

export default {
  name: "TaskResult",
  components: {
    Chart,
  },
  data() {
    return {
      task: {},

      work_days: [],
      daily_wages: [],
      daily_evaluated_wages: [],

      work_months: [],
      monthly_wages: [],
      monthly_evaluated_wages: [],

      dataCollection: [],
      selectedDating: [], 
      optionDating: [ 
          { id: 1, name: '日別' }, 
          { id: 2, name: '月別' },
      ], 

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
  },

  created() {
    this.fetchDetailTask();
    this.fetchWorks()
  },

  beforeUpdate() {
    this.selected();
  },

  methods: {
    fetchDetailTask() {
      this.$axios.get(`http://localhost:3000/api/v1/tasks/${this.$route.params.id}`)
        .then(res => this.task = res.data)
        .catch(err => console.log(err.status));
    },

    fetchWorks() {
      this.$axios.get(`http://localhost:3000/api/v1/tasks/${this.$route.params.id}/works`)
        .then(res => {
          this.daily_wages = res.data.daily_wages, 
          this.work_days = res.data.work_days, 
          this.daily_evaluated_wages = res.data.daily_evaluated_wages 
          this.monthly_wages = res.data.monthly_wages, 
          this.work_months = res.data.work_months, 
          this.monthly_evaluated_wages = res.data.monthly_evaluated_wages})
        .catch(err => console.log(err.status));
    },

    dailyData() {
      this.dataCollection = {
        labels: this.work_days,
        datasets: [
          {
            label: "労働金額",
            data: this.daily_wages,
            // fillColor: 'rgba(0,0,225,0.5)',//塗りつぶす色
            // strokeColor: 'rgba(0,0,225,0.5)',//線の色
            backgroundColor : [
            //   `rgba(0,0,225,${Math.floor(this.daily_evaluated_wages[0]/this.daily_wages[0]*10)/10 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[0]/5/this.daily_wages[0]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[1]/5/this.daily_wages[1]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[2]/5/this.daily_wages[2]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[3]/5/this.daily_wages[3]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[4]/5/this.daily_wages[4]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[5]/5/this.daily_wages[5]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[6]/5/this.daily_wages[6]*100))/100 } )`,
              // `rgba(0,0,225,${Math.floor((this.daily_evaluated_wages[3]/this.daily_wages[3]*10)/10)})`,
              // `rgba(0,0,225,${Math.floor(this.daily_evaluated_wages[4]/this.daily_wages[4])})`,
              // `rgba(0,0,225,${Math.floor(this.daily_evaluated_wages[5]/this.daily_wages[5])})`,
              // `rgba(0,0,225,${Math.floor(this.daily_evaluated_wages[6]/this.daily_wages[6])})`,
              ]
          },
        ]
      };
    },

    montlyData() {
      this.dataCollection = {
        labels: this.work_months,
        datasets: [
          {
            label: "労働金額",
            data: this.monthly_wages,
            backgroundColor : [
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[0]/5/this.monthly_wages[0]*100))/100 } )`,
            ]
          },
        ]
      };
    },

    selected(){
      if (this.selectedDating === 1) { return this.dailyData();} 
      else if (this.selectedDating === 2) {return this.montlyData();}
    }

  },
}
</script>
