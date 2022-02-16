<template>
  <div class="mx-auto sm:max-w-xl md:max-w-full lg:max-w-screen-xl md:px-24 lg:px-8 lg:py-8">
    <div class="max-w-xl sm:mx-auto lg:max-w-2xl text-center">
      <h1 class="text-center font-bold text-2xl mb-6">
        ユーザー登録
      </h1>
      <form class="rounded px-8 pt-6 pb-8">
        <ValidationObserver v-slot="{ handleSubmit }">
          <div class="mt-10 mb-4">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required|max:20"
            >
              <label
                class="block text-sm font-bold mb-2"
                for="name"
              >
                ニックネーム
              </label>
              <input
                id="name"
                v-model="user.name"
                class="shadow appearance-none border rounded w-64 py-2 mb-3 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                type="text"
                name="ニックネーム"
              >
              <br>
              <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
            </ValidationProvider>
          </div>
          <div class="mb-4">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required|email"
            >
              <label
                class="block text-sm font-bold mb-2"
                for="email"
              >
                メールアドレス
              </label>
              <input
                id="email"
                v-model="user.email"
                class="shadow appearance-none border rounded w-64 py-2 px-3 mb-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                type="text"
                name="メールアドレス"
              >
              <br>
              <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
            </ValidationProvider>
          </div>
          <div class="mb-6">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required|min:6|max:10"
              vid="password"
            >
              <label
                class="block  text-sm font-bold mb-2"
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
          <div class="mb-6">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required|min:6||max:10|password_confirmed:@password"
            >
              <label
                class="block text-sm font-bold mb-2"
                for="password_confirmation"
              >
                パスワード確認
              </label>
              <input
                id="password_confirmation"
                v-model="user.password_confirmation"
                class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                type="password"
                name="パスワード確認"
              >
              <br>
              <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
            </ValidationProvider>
          </div>
          <div class="mt-10 mb-4">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required|numeric"
            >
              <label
                class="block text-sm font-bold mb-2"
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
                class="inline-block align-baseline font-bold text-sm hover:text-blue-600 mb-3 underline text-blue-500"
                @click="handleShowWageCaliculatorModal"
              >
                現在の時給を計算する
              </h4>
              <br>
              <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
            </ValidationProvider>
          </div>
          <button
            type="button"
            class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
            @click="handleSubmit(register)"
          >
            登録
          </button>
        </ValidationObserver>
      </form>
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
          this.$store.commit(`message/setContent`,{
          content: 'ユーザーが登録されました!',
          timeout: 6000
        }),
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