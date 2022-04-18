<template>
  <div class="mx-auto sm:max-w-xl md:max-w-full lg:max-w-screen-xl md:px-24 lg:px-8 lg:py-8">
    <div class="max-w-xl sm:mx-auto lg:max-w-2xl text-center">
      <h1 class="font-bold mb-6 xl:text-2xl text-6xl">
        ログイン
      </h1>
      <form class="rounded px-8 pt-6 pb-8 mb-4">
        <ValidationObserver v-slot="{ handleSubmit }">
          <div class="mt-10 mb-4">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required|email"
            >
              <label
                class="block font-bold mb-2 xl:text-sm text-4xl"
                for="email"
              >
                メールアドレス
              </label>
              <input
                id="email"
                v-model="user.email"
                class="shadow appearance-none border rounded w-64 py-2 mb-3 px-3 leading-tight focus:outline-none focus:shadow-outline text-gray-700"
                type="text"
                name="メールアドレス"
              >
              <br>
              <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
            </ValidationProvider>
          </div>
          <div class="mb-20">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required|min:6|max:20"
            >
              <label
                class="block font-bold mb-2 xl:text-sm text-4xl"
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
              <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
            </ValidationProvider>
          </div>
          <button
            type="button"
            class="w-48 inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 xl:text-sm text-4xl"
            @click="handleSubmit(login)"
          >
            ログイン
          </button>
        </ValidationObserver>
      </form>
    </div>
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


