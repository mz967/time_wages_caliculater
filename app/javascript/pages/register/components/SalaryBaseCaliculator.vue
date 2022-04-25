<template>
  <div>
    <div
      v-if="style==='select'"
    >
      <button
        type="button"
        class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 lg:text-sm md:text-2xl text-4xl mb-10"
        @click="handleShowMonthlyIncome"
      >
        月収から計算する
      </button>
      <button
        type="button"
        class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 lg:text-sm md:text-2xl text-4xl"
        @click="handleShowAnnualIncome"
      >
        年収から計算する
      </button>
    </div>

    <div v-else-if="style==='monthly_income'">
      <h3 class="leading-6 font-bold lg:text-2xl text-5xl lg:my-2 my-10">
        ◎月収より計算
      </h3>
      <br>
      <ValidationObserver v-slot="{ handleSubmit }">
        <div class="mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block mb-2"
              for="monthly_income"
            >
              直近月の月収を入力してください
            </label>
            <input
              id="monthly_income"
              v-model="monthly_income"
              class="appearance-none border rounded w-full py-2 px-3 leading-tight focus:outline-none shadow text-gray-700"
              type="text"
              name="月収"
            >
            <br>
            <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="mb-6">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block mb-2"
              for="working_time"
            >
              労働時間を記入してください。<br>
              <span class="lg:text-xs text-lg">※単位は時間です。分については四捨五入をして時間に変換してください。</span>
            </label>
            <input
              id="working_time"
              v-model="working_time"
              class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none shadow"
              type="text"
              name="労働時間"
            >
            <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="mt-10 text-center">
          <button
            type="button"
            class="w-48 inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 lg:text-sm text-4xl"
            @click="handleSubmit(handleCaliculateMontlyIncome)"
          >
            計算
          </button>
        </div>
      </ValidationObserver>
    </div>

    <div v-else-if="style==='annual_income'">
      <h3 class="leading-6 font-bold lg:text-2xl text-5xl lg:my-2 my-10">
        ◎年収より計算
      </h3>
      <br>
      <ValidationObserver v-slot="{ handleSubmit }">
        <div class="mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block mb-2"
              for="annual_income"
            >
              昨年の年収を入力してください
            </label>
            <input
              id="annual_income"
              v-model="annual_income"
              class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none shadow"
              type="text"
              name="年収"
            >
            <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <br>
        <div class="mb-6">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block mb-2"
              for="working_time"
            >
              労働時間を記入してください。<br>
              <span class="lg:text-xs text-lg">※単位は時間です。分については四捨五入をして時間に変換してください。</span>
            </label>
            <input
              id="working_time"
              v-model="working_time"
              class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none shadow"
              type="text"
              name="労働時間"
            >
            <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="mt-10 text-center">
          <button
            type="button"
            class="w-48 inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 lg:text-sm text-4xl"
            @click="handleSubmit(handleCaliculateAnnualIncome)"
          >
            計算
          </button>
        </div>
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