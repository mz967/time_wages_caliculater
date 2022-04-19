<template>
  <div class="text-left md:text-sm text-3xl">
    <h1 class="leading-6 font-bold md:text-2xl text-6xl md:my-2 my-10">
      ◎平均時給を参照
    </h1>
    <h2 class="mb-4">
      <span>
        <a
          href="https://www.mhlw.go.jp/toukei/itiran/roudou/chingin/kouzou/z2020/dl/13.pdf"
          target="_blank"
          class="underline"
        >
          令和2年賃金構造基本統計調査(厚生労働省)
        </a>
      </span>
      をもとに男女年齢別の平均時給を計算します。
    </h2>
    <p class="md:text-xs text-xl mb-6">
      Ex. 〜19歳男性の場合
      <br>
      183,200円(*)÷30.24日(**)÷7時間(***)=860円(****)
      <br>
      (*)平均月収
      <br>
      (**)1ヶ月あたりの平均日数(365日÷12ヶ月=30.416…日を四捨五入して30.42日とする)
      <br>
      (***)1日の労働時間(9時〜17時の8時間-1時間休憩=7時間労働にて換算)
      <br>
      (****)小数点を四捨五入
    </p>
    <br>
    <ValidationObserver v-slot="{ handleSubmit }">
      <div class="mb-4">
        <h2 class="mb-2">
          あなたの性別を選択してください
        </h2>
        <ValidationProvider
          v-slot="{ errors }"
          rules="required"
          name="性別"
        >
          <label>
            <input
              v-model="selectedSex"
              type="radio"
              value="1"
              @change="averageWageCaliculate"
            >
            男性
          </label>
          <label>
            <input
              v-model="selectedSex"
              type="radio"
              value="2"
              @change="averageWageCaliculate"
            >
            女性
          </label>
          <br>
          <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>
      <div class="mb-4">
        <ValidationProvider
          v-slot="{ errors }"
          rules="required"
          name="年齢"
        >
          <h2 class="mb-2">
            あなたの現在の年齢をお教えください
          </h2>
          <select
            v-model="selectedAge"
            class="appearance-none border rounded w-full py-2 px-3 leading-tight focus:outline-none shadow text-gray-700"
            @change="averageWageCaliculate"
          >
            <option
              disabled
              value=""
            >
              年齢を選択してください
            </option>
            <option
              v-for="item in ageLists"
              :key="item.id"
              :value="item"
            >
              <span>{{ item.label }}</span>
            </option>
          </select>
          <br>
          <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>
      <div class="mt-10 text-center">
        <button
          type="button"
          class="w-48 inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 md:text-sm text-4xl"
          @click="handleSubmit(handleSearchAverageHourlyWage)"
        >
          計算
        </button>
      </div>
    </ValidationObserver>
  </div>
</template>

<script>

export default {
  name: "AverageWageSearch",
  data() {
    return {
      current_hourly_wage: [],
      selectedSex: [],
      selectedAge: [],
      ageLists: [
        { id: 1, label: "〜19歳", male: 860, female: 816 },
        { id: 2, label: "20〜24歳", male: 1008, female: 982 },
        { id: 3, label: "25〜29歳", male: 1186, female: 1096 },
        { id: 4, label: "30〜34歳", male: 1358, female: 1159 },
        { id: 5, label: "35〜39歳", male: 1542, female: 1214 },
        { id: 6, label: "40〜44歳", male: 1694, female: 1260},
        { id: 7, label: "45〜49歳", male: 1822, female: 1273 },
        { id: 8, label: "50〜54歳", male: 1971, female: 1290 },
        { id: 9, label: "55〜59歳", male: 1973, female: 1273 },
        { id: 10, label: "60〜64歳", male: 1476, female: 1090 },
        { id: 11, label: "65〜69歳", male: 1291, female: 1012 },
        { id: 12, label: "70歳〜", male: 1223, female: 1020 },
      ],
    }
  },
  methods: {
    handleSearchAverageHourlyWage() {
      this.$emit('caliculate-wage', this.current_hourly_wage)
    },
    averageWageCaliculate(){
      if (this.selectedSex === '1') { return this.current_hourly_wage = this.selectedAge.male; }
      else if (this.selectedSex === '2') { return this.current_hourly_wage = this.selectedAge.female; }
    }
  }
}
</script>

<style scoped>
</style>