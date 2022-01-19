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
        scales: {
          xAxes: [{
            scaleLabel: {
              display: true,
              labelString: ''
            }
          }],
          yAxes: [{
            ticks: {
              beginAtZero: true,
              stepSize: 10000,
            }
          }]
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