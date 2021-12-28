<template>
  <div>
    <div v-if="style==='select'">
      <button
        type="button"
        class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
        @click="handleShowMonthlyIncome"
      >
        月収から計算する
      </button>
      <br>
      <br>
      <button
        type="button"
        class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
        @click="handleShowAnnualIncome"
      >
        年収から計算する
      </button>
    </div>

    <div v-else-if="style==='monthly_income'">
      <h3>月収より計算する</h3>
      <ValidationObserver v-slot="{ handleSubmit }">
        <div class="mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block text-gray-700 text-sm font-bold mb-2"
              for="monthly_income"
            >
              直近月の月収を入力してください
            </label>
            <input
              id="monthly_income"
              v-model="monthly_income"
              class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none"
              type="text"
              name="月収"
            >
            <br>
            <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block text-gray-700 text-sm font-bold mb-2"
              for="working_time"
            >
              労働時間を記入してください。<br>
              単位は時間です。分については四捨五入をして時間に変換してください。
            </label>
            <input
              id="working_time"
              v-model="working_time"
              class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none"
              type="text"
              name="労働時間"
            >
            <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <button
          type="button"
          class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"

          @click="handleSubmit(handleCaliculateMontlyIncome)"
        >
          計算
        </button>
      </ValidationObserver>
    </div>

    <div v-else-if="style==='annual_income'">
      <h3>年収より計算する</h3>
      <ValidationObserver v-slot="{ handleSubmit }">
        <div class="mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block text-gray-700 text-sm font-bold mb-2"
              for="annual_income"
            >
              昨年の年収を入力してください
            </label>
            <input
              id="annual_income"
              v-model="annual_income"
              class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none"
              type="text"
              name="年収"
            >
            <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>

        <div class="mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block text-gray-700 text-sm font-bold mb-2"
              for="working_time"
            >
              労働時間を記入してください。<br>
              単位は時間です。分については四捨五入をして時間に変換してください。
            </label>
            <input
              id="working_time"
              v-model="working_time"
              class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none"
              type="text"
              name="労働時間"
            >
            <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <button
          type="button"
          class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
          @click="handleSubmit(handleCaliculateAnnualIncome)"
        >
          計算
        </button>
      </ValidationObserver>
    </div>
  </div>
</template>

<script>

export default {
  name: "SalaryBaseCaliculator",
    data() {
    return {
      monthly_income: "",
      annual_income: "",
      working_time: "",
      style: "select",
      current_hourly_wage: ""
    }
  },
  computed: {
  },
  methods: {
    // 切り捨て計算をして、emit
    handleCaliculateMontlyIncome(){
      this.current_hourly_wage = Math.floor(this.monthly_income / this.working_time)
      this.$emit('caliculate-wage', this.current_hourly_wage)
    },
    handleCaliculateAnnualIncome(){
      this.current_hourly_wage =  Math.floor(this.annual_income / this.working_time)
      this.$emit('caliculate-wage', this.current_hourly_wage)
    },

    // 計算するフォーマット表示
    handleShowMonthlyIncome() {
      this.style = "monthly_income"
    },
    handleShowAnnualIncome() {
      this.style = "annual_income"
    },
  }
}
</script>

<style scoped>
</style>