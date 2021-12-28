<template>
  <div class="text-center">
    <ValidationObserver v-slot="{ handleSubmit }">
      <div class="mt-10 mb-4">
        <ValidationProvider
          v-slot="{ errors }"
          rules="required|numeric"
        >
          <label
            class="block text-gray-700 text-sm font-bold mb-2"
            for="current_hourly_wage"
          >
            現在の時給をお教えください!
          </label>
          <input
            id="current_hourly_wage"
            v-model="user.current_hourly_wage"
            class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="text"
            name="時給"
          >
          <br>
          <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>
      <h4
        class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800 mb-3"
        @click="handleShowWageCaliculatorModal"
      >
        現在の時給を計算する
      </h4>
      <br>
      <button
        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
        type="button"
        @click="handleSubmit(registerWage)"
      >
        時給変更
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
      // this.$axios.post('users', { user: this.user })
      // authUser.current_hourly_wage = this.user.current_hourly_wage
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
</style>