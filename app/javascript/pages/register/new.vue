<template>
  <div class="text-center">
    <form class="bg-white rounded px-8 pt-6 pb-8 mb-4">
      <h1 class="text-center font-bold">
        ユーザー登録画面
      </h1>
      <ValidationObserver v-slot="{ handleSubmit }">
        <div class="mt-10 mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|max:20"
          >
            <label
              class="block text-gray-700 text-sm font-bold mb-2"
              for="name"
            >
              ニックネーム
            </label>
            <input
              id="name"
              v-model="user.name"
              class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
              type="text"
              name="ニックネーム"
            >
            <br>
            <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="mb-4">
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
        <div class="mb-6">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|min:6|max:10"
            vid="password"
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
        <div class="mb-6">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|min:6||max:10|password_confirmed:@password"
          >
            <label
              class="block text-gray-700 text-sm font-bold mb-2"
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
            <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="mt-10 mb-4">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required|numeric"
          >
            <label
              class="block text-gray-700 text-sm font-bold mb-2"
              for="current_hourly_wage"
            >
              現在の時給をお教えください
            </label>
            <input
              id="current_hourly_wage"
              v-model="user.current_hourly_wage"
              class="shadow appearance-none border rounded w-64 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
              type="text"
              name="時給"
            >
            <br>
            <h4
              class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800 mb-3"
              href="#"
              @click="handleShowWageCaliculatorModal"
            >
              現在の時給を計算する
            </h4>
            <br>
            <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <button
          class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          type="button"
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