<template>
  <div class="text-center">
    <form class="bg-white rounded px-8 pt-6 pb-8 mb-4">
      <h1 class="text-center font-bold">
        ユーザー登録画面
      </h1>
      <div class="mt-10 mb-4">
        <label
          class="block text-gray-700 text-sm font-bold mb-2"
          for="username"
        >
          ニックネーム
        </label>
        <input
          id="name"
          v-model="user.name"
          class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          type="text"
          placeholder=""
        >
      </div>
      <div class="mb-4">
        <label
          class="block text-gray-700 text-sm font-bold mb-2"
          for="username"
        >
          メールアドレス
        </label>
        <input
          id="email"
          v-model="user.email"
          class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          type="text"
          placeholder=""
        >
      </div>
      <div class="mb-6">
        <label
          class="block text-gray-700 text-sm font-bold mb-2"
          for="password"
        >
          パスワード
        </label>
        <input
          id="password"
          v-model="user.password"
          class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
          type="password"
          placeholder=""
        >
      </div>
      <div class="mb-6">
        <label
          class="block text-gray-700 text-sm font-bold mb-2"
          for="password"
        >
          パスワード確認
        </label>
        <input
          id="password_confirmation"
          v-model="user.password_confirmation"
          class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
          type="password"
          placeholder=""
        >
      </div>
      <div class="mt-10 mb-4">
        <label
          class="block text-gray-700 text-sm font-bold mb-2"
          for="current_hourly_wage"
        >
          現在の時給をお教えください
        </label>
        <input
          id="name"
          v-model="user.current_hourly_wage"
          class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          type="text"
          placeholder=""
        >
        <br>
        <h4
          class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800 mb-3"
          href="#"
          @click="handleShowWageCaliculatorModal"
        >
          現在の時給計算をする
        </h4>
      </div>
      <button
        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
        type="button"
        @click="register"
      >
        登録
      </button>
    </form>
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
import WageCaliculatorModal from "./components/WageCaliculatorModal"
export default {
  name: "RegisterNew",
  components: {
    WageCaliculatorModal
  },
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
        current_hourly_wage: ''
      },
      isVisibleWageCaliculatorModal: false,

    }
  },
  methods: {
    register() {
      this.$axios.post('users', { user: this.user })
        .then(res => {
          this.$router.push({ name: 'Login' })
        })
        .catch(err => {
          console.log(err)
        })
    },

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