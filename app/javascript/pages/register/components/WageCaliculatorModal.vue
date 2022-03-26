<template>
  <div
    class="fixed z-10 inset-0 overflow-y-auto"
    aria-labelledby="modal-title"
    role="dialog"
    aria-modal="true"
  >
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div
        class="fixed inset-0 bg-blue-200 bg-opacity-75 transition-opacity"
        aria-hidden="true"
      />
      <span
        class="hidden sm:inline-block sm:align-middle sm:h-screen"
        aria-hidden="true"
      >&#8203;</span>
      <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
        <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
          <div class="sm:flex sm:items-start">
            <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
              <div v-if="show==='entrance'">
                <h3
                  id="modal-title"
                  class="text-lg leading-6 font-bold"
                >
                  ◎時給の計算を行います
                </h3>
                <br>
                <p class="mb-2">
                  お仕事をされている方は源泉徴収票より金額と就業時間より時給を換算します。
                </p>
                <p class="text-xs mb-6">
                  ※ 税金などの差し引きは致しません。税金控除後の金額で計算されたい場合は手取り額を月収や年収で登録してください。
                </p>
                <p class="mb-6">
                  アルバイトをされている方はアルバイト先の時給を登録してください。
                </p>
                <p class="mb-6">
                  現在お仕事をされていない方は平均時給から登録するか、もしくは前の職場の給料を参考に登録することを推奨しています。
                </p>
                <p>その他のケースの場合はお手数ですが、各々で計算をしていただき時給の欄に入力をしてください。</p>
                <br>
                <button
                  type="button"
                  class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                  @click="handleShowSalaryBase"
                >
                  現在お仕事をされている方はこちら→
                </button>
                <br>
                <br>

                <button
                  type="button"
                  class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                  @click="handleShowAverageWageBase"
                >
                  平均時給で登録したい方はこちら→
                </button>
              </div>

              <div v-else-if="show==='salaly_base'">
                <SalaryBaseCaliculator @caliculate-wage="handleCaliculate" />
              </div>

              <div v-else-if="show==='average_wage_base'">
                <AverageWageSearch @caliculate-wage="handleCaliculate" />
              </div>
            </div>
          </div>
        </div>
              
        <div class="px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
          <button
            type="button"
            class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
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
      show: "entrance",
    }
  },
  methods: {
    handleCloseModal() {
      this.$emit('close-wage-caliculator-modal')
    },
    // サラリーベースor平均賃金ベースでのフォーム切り替え
    handleShowSalaryBase() {
      this.show = "salaly_base"
    },
    handleShowAverageWageBase() {
      this.show = "average_wage_base"
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