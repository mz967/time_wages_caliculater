<template>
  <div class="text-center">
    <form class="bg-white rounded px-8 pt-6 pb-8 mb-4">
      <h1 class="text-center font-bold">
        ログイン画面
      </h1>
      <ValidationObserver v-slot="{ handleSubmit }">
        <div class="mt-10 mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|email"
          >
            <label
              class="block text-gray-700 text-sm font-bold mb-2"
              for="email"
            >
              メールアドレス
            </label>
            <input
              id="email"
              v-model="user.email"
              class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
              type="text"
              name="メールアドレス"
            >
            <br>
            <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|min:6|max:20"
          >
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
              name="パスワード"
            >
            <br>
            <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <button
          class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          type="button"
          @click="handleSubmit(login)"
        >
          ログイン
        </button>
      </ValidationObserver>
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
    ...mapActions("users", [
      "loginUser",
      "fetchUser",
    ]),
    async login() {
      try {
        await this.loginUser(this.user);
        this.$store.commit(`message/setContent`,{
          content: 'ログインしました!',
          timeout: 6000
        }),
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


