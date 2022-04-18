<template>
  <div class="fixed z-10 inset-0 overflow-y-auto">
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div
        class="fixed inset-0 bg-blue-200 bg-opacity-75 transition-opacity"
        @click.self="handleCloseModal"
      />
      <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
        <div class="bg-white p-10">
          <div class="text-left xl:text-sm text-3xl">
            <!-- 初期説明のモーダル -->
            <div v-if="modal==='entrance'">
              <h3
                id="modal-title"
                class="leading-6 font-bold xl:text-2xl text-6xl xl:my-2 my-10"
              >
                ◎時給計算
              </h3>
              <br>
              <div class="mb-10">
                <p class="mb-2">
                  現在お仕事をされている方は源泉徴収票より金額と就業時間より時給を換算いたします。
                </p>
                <p class="xl:text-xs text-lg mb-6">
                  ※ 税金などの差し引きは致しません。税金控除後の金額で計算されたい場合は手取り額を月収や年収で登録してください。
                </p>
                <p class="mb-6">
                  アルバイトをされている方はアルバイト先の時給を登録してください。
                </p>
                <p class="mb-6">
                  現在お仕事をされていない方は平均時給から登録するか、以前の職場の給料を参考に登録することを推奨しています。
                </p>
                <p>その他のケースの場合はお手数ですが、各々で計算をしていただき時給の欄に入力をしてください。</p>
              </div>
              <br>
              <button
                type="button"
                class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 xl:text-sm text-4xl"
                @click="handleShowSalaryBase"
              >
                現在お仕事をされている方はこちら
              </button>
              <br>
              <br>
              <button
                type="button"
                class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 xl:text-sm text-4xl"
                @click="handleShowAverageWageBase"
              >
                平均時給で登録したい方はこちら
              </button>
            </div>

            <!-- サラリーベースでのモーダル表示 -->
            <div v-else-if="modal==='salaly_base'">
              <SalaryBaseCaliculator @caliculate-wage="handleCaliculate" />
            </div>

            <!-- 平均賃金ベースのモーダル表示 -->
            <div v-else-if="modal==='average_wage_base'">
              <AverageWageSearch @caliculate-wage="handleCaliculate" />
            </div>
          </div>
        </div>
              
        <div class="px-4 py-3 text-center">
          <button
            type="button"
            class="mt-3 w-48 inline-flex justify-center rounded-md border border-gray-300 shadow px-4 py-2 bg-white font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 xl:text-sm text-4xl"
            @click="handleCloseModal"
          >
            閉じる
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SalaryBaseCaliculator from "./SalaryBaseCaliculator"
import AverageWageSearch from "./AverageWageSearch"

export default {
  name: "WageCaliculatorModal",
  components: {
    SalaryBaseCaliculator,
    AverageWageSearch
  },
  data() {
    return {
      average_hourly_wage: "",
      current_hourly_wage: "",
      modal: "entrance",
    }
  },
  methods: {
    handleCloseModal() {
      this.$emit('close-wage-caliculator-modal')
    },
    // サラリーベースor平均賃金ベースでのフォーム切り替え
    handleShowSalaryBase() {
      this.modal = "salaly_base"
    },
    handleShowAverageWageBase() {
      this.modal = "average_wage_base"
    },
    // サラリーにせよ平均賃金にせよ共通でcurrent_hourly_wageに収納してemit
    handleCaliculate(current_hourly_wage) {
      this.current_hourly_wage = current_hourly_wage
      this.$emit('caliculate-wage', this.current_hourly_wage)
    }
  }
}
</script>

<style scoped>
</style>