<template>
  <div>
    <h1 class="text-center mb-20 text-2xl font-bold">
      <span>{{ task.title }}</span>の推移表
    </h1>
    <div class="text-center">
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
      <router-link
        :to="{ name: 'TaskIndex' }"
        class="hover:text-blue-500 ml-3"
      >
        一覧へ戻る
      </router-link>
    </div>

    <Chart
      v-if="selectedDating===1 || selectedDating===2"
      :chart-data="dataCollection"
    />

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
      this.$axios.get( `${process.env.VUE_BASE_API}/tasks/${this.$route.params.id}`)
        .then(res => this.task = res.data)
        .catch(err => console.log(err.status));
    },

    fetchWorks() {
      this.$axios.get( `${process.env.VUE_BASE_API}/tasks/${this.$route.params.id}/works`)
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
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[0]/10/this.daily_wages[0]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[1]/10/this.daily_wages[1]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[2]/10/this.daily_wages[2]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[3]/10/this.daily_wages[3]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[4]/10/this.daily_wages[4]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[5]/10/this.daily_wages[5]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[6]/10/this.daily_wages[6]*100))/100 } )`,
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
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[0]/10/this.monthly_wages[0]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[1]/10/this.monthly_wages[1]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[2]/10/this.monthly_wages[2]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[3]/10/this.monthly_wages[3]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[4]/10/this.monthly_wages[4]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[5]/10/this.monthly_wages[5]*100))/100 } )`,
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
