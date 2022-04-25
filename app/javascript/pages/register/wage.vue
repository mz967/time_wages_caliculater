<template>
  <div class="mx-auto sm:max-w-xl md:max-w-full lg:max-w-screen-xl md:px-24 lg:px-8 lg:py-8">
    <div class="max-w-xl sm:mx-auto lg:max-w-2xl text-center">
      <h1 class="text-center font-bold lg:text-2xl text-6xl mb-20">
        時給変更
      </h1>
      <ValidationObserver v-slot="{ handleSubmit }">
        <div class="mt-10 mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block font-bold mb-6 lg:text-sm text-4xl"
              for="current_hourly_wage"
            >
              現在の時給をお教えください
            </label>
            <input
              id="current_hourly_wage"
              v-model="user.current_hourly_wage"
              class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-3"
              type="text"
              name="時給"
            >
            <br>
            <h4
              class="inline-block align-baseline font-bold lg:text-sm text-3xl hover:text-blue-600 mb-3 underline text-blue-500"
              @click="handleShowWageCaliculatorModal"
            >
              現在の時給を計算する
            </h4>
            <br>
            <span class="text-red-400 px-4 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <br>
        <button
          type="button"
          class="w-48 inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 lg:text-sm text-4xl"
          @click="handleSubmit(registerWage)"
        >
          変更
        </button>
      </ValidationObserver>

      <transition name="fade">
        <WageCaliculatorModal
          v-if="isVisibleWageCaliculatorModal"
          @close-wage-caliculator-modal="CloseWageCaliculatorModal"
          @caliculate-wage="handleCaliculateWage"
        />
      </transition>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex"
import WageCaliculatorModal from "./components/WageCaliculatorModal"
export default {
  name: "RegisterWage",
  components: {
    WageCaliculatorModal
  },
  data() {
    return {
      user: {
        current_hourly_wage: '',
      },
      isVisibleWageCaliculatorModal: false
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    registerWage() {
      this.$axios.patch(`users/${this.authUser.id}`, {user: this.user})
        .then(res => {
          this.$router.push({ name: 'TaskIndex' })
          this.$store.commit(`message/setContent`,{
            content: '時給を変更しました!',
            timeout: 6000
          })
        })
        .catch(err => {
          console.log(err)
        })
    },
    // 計算ロジック
    handleShowWageCaliculatorModal() {
      this.isVisibleWageCaliculatorModal = true
    },
    CloseWageCaliculatorModal() {
      this.isVisibleWageCaliculatorModal = false
    },
    handleCaliculateWage(current_hourly_wage) {
      this.user.current_hourly_wage = current_hourly_wage
      this.isVisibleWageCaliculatorModal = false
    }
  }
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
</style>