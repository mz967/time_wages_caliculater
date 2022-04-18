<template>
  <header class="text-white bg-gradient-to-b hover:bg-gradient-to-t from-blue-700 to-blue-400 text-center">
    <div class="container mx-auto xl:flex xl:flex-wrap p-10">
      <router-link
        :to="{ name: 'HomeTop' }"
        class="title-font font-medium items-center text-white xl:ml-3 mx-auto text-5xl "
      >
        <span class="text-gray-100 font-mono hover:text-blue-200">時間賃金換算機</span>
      </router-link>
      <nav class="text-4xl flex flex-wrap items-center justify-center xl:ml-auto xl:mr-5 xl:text-lg mx-auto mt-5 xl:mt-0">
        <template v-if="!authUser">
          <router-link
            :to="{ name: 'HomeTop' }"
            class="mr-8 hover:text-blue-200"
          >
            使用方法
          </router-link>
          <router-link
            :to="{ name: 'Login' }"
            class="mr-8 hover:text-blue-200"
          >
            ログイン
          </router-link>
          <router-link
            :to="{ name: 'RegisterNew' }"
            class="xl:mr-8 hover:text-blue-200"
          >
            新規登録
          </router-link>
        </template>
        <template v-else>
          <router-link
            :to="{ name: 'HomeTop' }"
            class="mr-8 hover:text-blue-200"
          >
            使用方法
          </router-link>
          <router-link
            :to="{ name: 'TaskIndex' }"
            class="mr-8 hover:text-blue-200"
          >
            タスク一覧
          </router-link>
          <router-link
            :to="{ name: 'RegisterWage' }"
            class="mr-8 hover:text-blue-200"
          >
            時給変更
          </router-link>
          <router-link
            to="#"
            class="xl:mr-8 hover:text-blue-200"
            @click.native="handleLogout"
          >
            ログアウト
          </router-link>
        </template>
      </nav>
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

<style scoped>

</style>