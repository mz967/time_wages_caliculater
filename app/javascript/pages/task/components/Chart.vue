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
        legend: {
          display: false
        },
        scales: {
          xAxes: [{
            scaleLabel: {
            },
            barPercentage: 0.4
          }],
          yAxes: [{
            ticks: {
              beginAtZero: true,
              stepSize: 10000,
              callback: (value) => `${value}円`,
            }
          }],
        },
        tooltips: {
          callbacks: {
            title: (tooltipItem, data) => {
              return tooltipItem[0].xLabel;
            },
            label: (tooltipItem, data) => {
              return tooltipItem.yLabel + '円';
            }
          }
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