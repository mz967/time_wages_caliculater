<template>
  <div>
    <h3>平均時給を参照する</h3>
    <h4>働いていない方やお手軽に使用してみたい方、SNSなどに投稿したい方はこちらでの登録がおすすめ!</h4>
    <p>厚生労働省のデータを参考にしています</p>
    <a href="https://www.mhlw.go.jp/toukei/itiran/roudou/chingin/kouzou/z2020/dl/02.pdf">参考</a>
    <br>
    <form class="m-5">
      <h5>あなたの性別を選択してください</h5>
      <input
        id="1"
        v-model="picked"
        type="radio"
        value="1"
      >
      <label for="1">男性</label>
      <br>
      <input
        id="2"
        v-model="picked"
        type="radio"
        value="2"
      >
      <label for="2">女性</label>
      <br>
      <br>
      <label for="age">現在の年齢を教えてください</label>
      <br>
      <select
        id="age"
        v-model="selectedAge"
        class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none"
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
          :value="item.id"
        >
          {{ item.label }}
        </option>
      </select>
    </form>
    <button
      type="button"
      class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
      @click="handleSearchAverageHourlyWage"
    >
      計算
    </button>
  </div>
</template>

<script>

export default {
  name: "AverageWageSearch",
    data() {
      return {
        current_hourly_wage: "",
      picked: "",
      ageLists: [
        { id: 1, label: "〜19歳" },
        { id: 2, label: "20〜24歳" },
        { id: 3, label: "25〜29歳" },
        { id: 4, label: "30〜34歳" },
        { id: 5, label: "35〜39歳" },
        { id: 6, label: "40〜44歳" },
        { id: 7, label: "45〜49歳" },
        { id: 8, label: "50〜54歳" },
        { id: 9, label: "55〜59歳" },
        { id: 10, label: "60〜64歳" },
        { id: 11, label: "65〜69歳" },
        { id: 12, label: "70歳〜" },
      ],
      selectedAge: 0,
    }
  },
  methods: {
    // 男女と年齢を絞ってRailsで検索してそれをemit
    handleSearchAverageHourlyWage() {
      // this.$axios(),this.ageLists (res => this.current_hourly_wage = res.data) みたいな感じでDBに保管した年齢別の賃金から登録できるようにする
      this.$emit('caliculate-wage', this.current_hourly_wage)
    },
  }
}
</script>

<style scoped>
</style>