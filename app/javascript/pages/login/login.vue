<template>
  <div class="text-center">
    <form class="bg-white rounded px-8 pt-6 pb-8 mb-4">
      <h1 class="text-center font-bold">
        ログイン画面
      </h1>
      <div class="mt-10 mb-4">
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
      <button
        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
        type="button"
        @click="login"
      >
        ログイン
      </button>
      <!-- <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="#">
        Forgot Password?
      </a> -->
    </form>
  </div>
</template>

<script>
import { mapActions } from "vuex"

export default {
  name: "Login",
  data() {
    return {
      user: {
        email: "",
        password: "",
      }
    }
  },
  methods: {
    // async login() {
    //   try {
    //     const sessionsResponse = await this.$axios.post('user_sessions', this.user)
    //     localStorage.auth_token = sessionsResponse.data.token
    //     this.$axios.defaults.headers.common['Authorization'] = `Bearer ${localStorage.auth_token}`
    //     const userResponse = await this.$axios.get('users/me')
    //     this.user = userResponse.data
    //     // this.loginUser(this.user);
    //     this.$router.push({ name: 'TaskIndex' })
    //   } catch (error) {
    //     console.log(error);
    //   }
    // }

    ...mapActions("users", [
      "loginUser",
      "fetchUser",
    ]),
    async login() {
      try {
        await this.loginUser(this.user);
        this.$router.push({ name: 'TaskIndex' })
      } catch (error) {
        console.log(error);
      }
    }
  }
}
</script>

<style scoped>
</style>


