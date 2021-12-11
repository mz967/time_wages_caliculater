<template>
  <header class="text-white body-font bg-blue-500">
    <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
      <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0">
        <span class="ml-3 text-xl">時間賃金換算機</span>
      </a>
      <nav class="md:mr-auto md:ml-4 md:py-1 md:pl-4 md:border-l md:border-gray-400	flex flex-wrap items-center text-base justify-center">
        <template v-if="!authUser">
          <router-link
            :to="{ name: 'Login' }"
            class="mr-5 hover:text-gray-900"
          >
            ログイン
          </router-link>
          <router-link
            :to="{ name: 'RegisterNew' }"
            class="mr-5 hover:text-gray-900"
          >
            新規登録
          </router-link>
        </template>
        <template v-else>
          <router-link
            :to="{ name: 'HomeTop' }"
            class="mr-5 hover:text-gray-900"
          >
            使用方法
          </router-link>
          <router-link
            :to="{ name: 'TaskIndex' }"
            class="mr-5 hover:text-gray-900"
          >
            タスク一覧
          </router-link>
          <router-link
            :to="{ name: 'RegisterWage' }"
            class="mr-5 hover:text-gray-900"
          >
            時給変更
          </router-link>
          <router-link
            to="#"
            class="mr-5 hover:text-gray-900"
            @click.native="handleLogout"
          >
            ログアウト
          </router-link>
        </template>
      </nav>
      <!-- <button class="inline-flex items-center bg-gray-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 md:mt-0">
        ここにスライダー
      </button> -->
    </div>
  </header>
</template>

<script>
import { mapGetters, mapActions } from "vuex"

export default {
  name: 'TheHeader',
  data() {
    return {
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  methods: {
    ...mapActions("users", ["logoutUser"]),
    async handleLogout() {
      try {
        await this.logoutUser()
        this.$router.push({name: 'HomeTop'})
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>
