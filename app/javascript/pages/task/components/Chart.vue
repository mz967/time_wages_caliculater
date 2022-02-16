<script>
import { Bar, mixins } from 'vue-chartjs';
const { reactiveProp } = mixins

export default {
  name: 'Chart',
  mixins: [Bar,reactiveProp],
  props: {
    chartData: {
      type: null,
      required: true,
    }
  },
  data () {
    return {
      options: {
        legend: {//凡例設定
          display: false //表示設定
        },
        scales: {
          xAxes: [{
            scaleLabel: {
              // display: true,
              // labelString: ''
            },
            barPercentage: 0.4
          }],
          yAxes: [{
            ticks: {
              beginAtZero: true,
              stepSize: 10000,
            }
          }],
          // y: {
          //     ticks: {
          //         // Include a dollar sign in the ticks
          //         callback: function(value, index, ticks) {
          //             return '$' + value;
          //         }
          //     }
          // }

        }
      }
    }
  },
  mounted() {
    this.renderChart(this.chartData, this.options)
  },
  methods: {
  }
}

</script>