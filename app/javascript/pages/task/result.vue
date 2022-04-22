<template>
  <div>
    <!-- 共通画面 -->
    <!-- <h1 class="text-center mb-20 font-bold xl:text-2xl text-6xl">
      <span>{{ task.title }}</span>の推移表
    </h1> -->
    <transition
      name="pagefade"
      appear
    >
      <div class="text-center">
        <h2 class="mb-4 lg:text-base text-3xl">
          期間を選択してください
        </h2>
        <select
          id="dating"
          v-model="selectedDating"
          class="appearance-none border rounded w-48 py-2 px-3 leading-tight focus:outline-none shadow text-gray-700 text-center"
          @change="monthlyDataFilter()"
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
          class="hover:text-blue-500 ml-3 lg:text-base text-3xl underline"
        >
          一覧へ戻る
        </router-link>
      </div>
    </transition>

    <!-- 日別or月別グラフ表示 -->
    <div
      v-if="selectedDating===1 || selectedDating===2"
      class="w-5/6 lg:w-4/6 mx-auto my-20 p-10 shadow text-center"
    >
      <!-- 日別グラフ -->
      <div v-if="selectedDating===1">
        <select
          id="selected_month"
          v-model="selected_month"
          class="appearance-none border rounded w-48 py-2 px-3 leading-tight focus:outline-none shadow text-gray-700 lg:text-base text-4xl text-center mb-4"
          @change="dailyDataFilter()"
        >
          <option
            v-for="month in recent_months" 
            :key="month.id" 
            :value="month"
          >
            <span>{{ month }}</span>
          </option>
        </select> 
        <div
          v-if="selected_month.length===0"
          class="m-20 lg:text-base text-4xl"
        >
          <h1>月を選択してください</h1>
        </div>
        <div v-else>
          <h1
            v-if="work_days.length===0"
            class="m-20 lg:text-base text-4xl"
          >
            No Data
          </h1>
          <div v-else>
            <Chart
              :chart-data="dataCollection"
            />
          </div>
        </div>
      </div>

      <!-- 月別グラフ(現在は2022年のみ) -->
      <div v-if="selectedDating===2">
        <h1 class="text-center mb-10 text-gray-700 lg:text-base text-4xl">
          2022
        </h1>
        <h1
          v-if="work_months.length===0"
          class="m-20 lg:text-base text-4xl"
        >
          No Data
        </h1>
        <Chart
          v-else
          :chart-data="dataCollection"
        />
      </div>
    </div>
  </div>
</template>

<script>
import Chart from './components/Chart';
import moment from 'moment';

export default {
  name: "TaskResult",
  components: {
    Chart,
  },

  data() {
    return {
      task: [],

      // グラフ選択
      dataCollection: [],
      selectedDating: [], 
      optionDating: [ 
          { id: 1, name: '日別' }, 
          { id: 2, name: '月別' },
      ],

      // 日別
      daily_works: [],
      selected_month: [],
      recent_months: [],
      work_days: [],
      daily_wages: [],
      daily_evaluated_wages: [],

      // 月別
      monthly_works: [],
      work_months: [],
      monthly_wages: [],
      monthly_evaluated_wages: [],
    }
  },

  computed: {
    // 累計時間の表示
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
    this.dataSelected();
  },

  methods: {
    // Task取得
    fetchDetailTask() {
      this.$axios.get( `${process.env.VUE_BASE_API}/tasks/${this.$route.params.id}`)
        .then(res => this.task = res.data)
        .catch(err => console.log(err.status));
    },

    // Works取得
    fetchWorks() {
      this.$axios.get( `${process.env.VUE_BASE_API}/tasks/${this.$route.params.id}/works`)
        .then(res => {
          this.daily_works = res.data.daily_works,
          this.monthly_works = res.data.monthly_works
          })
        .catch(err => console.log(err.status));
    },

    // 日別と月別を選択した際の動作
    dataSelected(){
      if (this.selectedDating === 1) { return this.dailyChart(), this.monthlySelect(); } 
      else if (this.selectedDating === 2) { return this.montlyChart(), this.monthlyDataFilter(); }
    },

    // 日別の月選択データ作成
    monthlySelect(){
      var arr = [];
      var i = 0;
      var start = moment().add(-0, 'years').startOf('year');
      //とりあえず現状では2022年からなので-0となる
      var end = moment().startOf('month');
      var diffmonthes = end.diff(start, 'months');
      for(; i <= diffmonthes; i++) {
        arr.push(start.clone().add(i, 'months').startOf('month').format('YYYY/M'));
      }
      this.recent_months = arr.reverse();
    },

    // 日別データのグラフ
    dailyChart() {
      this.dataCollection = {
        labels: this.work_days,
        datasets: [
          {
            label: "労働金額",
            data: this.daily_wages,
            backgroundColor : [
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[0]/10/this.daily_wages[0]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[1]/10/this.daily_wages[1]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[2]/10/this.daily_wages[2]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[3]/10/this.daily_wages[3]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[4]/10/this.daily_wages[4]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[5]/10/this.daily_wages[5]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[6]/10/this.daily_wages[6]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[7]/10/this.daily_wages[7]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[8]/10/this.daily_wages[8]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[9]/10/this.daily_wages[9]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[10]/10/this.daily_wages[10]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[11]/10/this.daily_wages[11]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[12]/10/this.daily_wages[12]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[13]/10/this.daily_wages[13]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[14]/10/this.daily_wages[14]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[15]/10/this.daily_wages[15]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[16]/10/this.daily_wages[16]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[17]/10/this.daily_wages[17]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[18]/10/this.daily_wages[18]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[19]/10/this.daily_wages[19]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[20]/10/this.daily_wages[20]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[21]/10/this.daily_wages[21]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[22]/10/this.daily_wages[22]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[23]/10/this.daily_wages[23]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[24]/10/this.daily_wages[24]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[25]/10/this.daily_wages[25]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[26]/10/this.daily_wages[26]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[27]/10/this.daily_wages[27]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[28]/10/this.daily_wages[28]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[29]/10/this.daily_wages[29]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.daily_evaluated_wages[30]/10/this.daily_wages[30]*100))/100 } )`,
            ]
          },
        ]
      };
    },

    // Worksを月毎の日別データに選別
    dailyDataFilter() {
      this.daily_wages = [];
      this.work_days = [];
      this.daily_evaluated_wages = [];
      var fromDate = moment(this.selected_month).startOf('month').toISOString();
      var endDate = moment(this.selected_month).endOf('month').toISOString();
      var daily_works = this.daily_works.filter(function(item, index){
        if ( item[0] <= endDate && item[0] >= fromDate ) return true;
      });
      for( var i = 0; i < daily_works.length; i++ ){
        this.work_days.push(`${Number(daily_works[i][0].slice(-2))}日`);
        this.daily_wages.push(daily_works[i][1]);
        this.daily_evaluated_wages.push(daily_works[i][2]);
      }
    },

    // 月別のデータのグラフ
    montlyChart() {
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
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[6]/10/this.monthly_wages[6]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[7]/10/this.monthly_wages[7]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[8]/10/this.monthly_wages[8]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[9]/10/this.monthly_wages[9]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[10]/10/this.monthly_wages[10]*100))/100 } )`,
              `rgba(0,0,225,${ (Math.floor(this.monthly_evaluated_wages[11]/10/this.monthly_wages[11]*100))/100 } )`,
            ]
          },
        ]
      };
    },

    // worksを年毎の月別データに選別
    // 月別のデータについては2022年からなので今年のデータのみ取得
    // 来年以降daily_logと同じ構造にする
    monthlyDataFilter() {
      this.monthly_wages = [];
      this.work_months = [];
      this.monthly_evaluated_wages = [];
      var fromMonth = moment().startOf('year').toISOString();
      var endMonth = moment().endOf('year').toISOString();
      var monthly_works = this.monthly_works.filter(function(item, index){
        if ( item[0] <= endMonth && item[0] >= fromMonth) return true;
      });
      for( var i = 0; i < monthly_works.length; i++ ){
        this.work_months.push(`${Number(monthly_works[i][0].slice(-2))}月`);
        this.monthly_wages.push(monthly_works[i][1]);
        this.monthly_evaluated_wages.push(monthly_works[i][2]);
      }
    },
  },
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
/* ページフェード */
.pagefade-enter-active{
  transition: opacity 1s
}
.pagefade-enter{
  opacity: 0;
}
</style>
