<template>
  <transition
    name="pagefade"
    appear
  >
    <div class="mx-auto container px-8 py-20 text-center w-4/5">
      <div class="mb-20 lg:text-xl text-3xl">
        <div class="mb-16">
          <div class="lg:text-xl text-3xl">
            <div class="mb-10 text-center">
              <h1 class="mb-20 lg:text-2xl text-6xl font-bold">
                アプリの使い方
              </h1>
              <h2 class="font-semibold mb-2">
                STEP-1
              </h2>
              <p class="mb-10">
                ユーザー登録にて現在の時給を登録しましょう。
              </p>
              <img
                src="../../images/Registar.jpeg"
                alt=""
                class="w-96 h-96 mb-24 border-4 mx-auto"
              >
              <h2 class="font-semibold mb-2">
                STEP-2
              </h2>
              <p class="mb-10 text-center">
                ログインをして取り組むタスクを登録しましょう。
              </p>
              <img
                src="../../images/Login.jpeg"
                alt=""
                class="w-96 h-96 mb-24 border-4 mx-auto"
              >
              <img
                src="../../images/TaskCreate.jpeg"
                alt=""
                class="w-96 h-96 mb-24 border-4 mx-auto"
              >
              <img
                src="../../images/TaskCreateModal.jpeg"
                alt=""
                class="w-96 h-96 mb-24 border-4 mx-auto"
              >
              <h2 class="font-semibold mb-2">
                STEP-3
              </h2>
              <p class="mb-10">
                タスクの詳細画面のストップウォッチで取組時間を計測してみましょう。
              </p>
              <img
                src="../../images/Start.png"
                alt=""
                class="w-96 h-96 mb-24 border-4 mx-auto"
              >
              <img
                src="../../images/Stop.png"
                alt=""
                class="w-96 h-96 mb-24 border-4 mx-auto"
              >
              <img
                src="../../images/Evaluate.png"
                alt=""
                class="w-96 h-96 mb-24 border-4 mx-auto"
              >
              <h2 class="font-semibold mb-2">
                STEP-4
              </h2>
              <p class="mb-10 text-left lg:text-center">
                これまでに取り組んだタスクの取組状況はグラフで確認できます。
              </p>
              <img
                src="../../images/Graph.png"
                alt=""
                class="w-96 h-96 mb-24 border-4 mx-auto"
              >
              <h2 class="font-semibold mb-2">
                STEP-5
              </h2>
              <p class="mb-10 text-left lg:text-center">
                タスク一覧画面ではどのタスクにどのくらいの労力を費やしたか相対的に確認できます。
              </p>
              <img
                src="../../images/TaskIndex.png"
                alt=""
                class="w-96 h-96 mb-48 border-4 mx-auto"
              >
            </div>
          </div>
        </div>
      </div>

      <!-- リンク -->
      <div class="justify-center lg:text-xl text-3xl">
        <div class="lg:flex lg:flex-wrap mb-32 text-center">
          <div
            v-if="!authUser"
            class="p-4 h-64 w-96 mx-auto mb-10"
          >
            <router-link :to="{ name: 'RegisterNew' }">
              <div class="h-full w-full  px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl bg-white border-2 ">
                <h1 class="font-bold mb-6">
                  ユーザー登録
                </h1>
                <div class="h-36 w-36 opacity-75 mx-auto mb-6">
                  <img
                    src="../../images/User.jpg"
                    alt=""
                  >
                </div>
              </div>
            </router-link>
          </div>
          <div class="p-4 h-64 w-96 mx-auto mb-10">
            <router-link :to="{ name: 'HomeExplanation' }">
              <div class="h-full w-full px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative  shadow-xl bg-white border-2">
                <h1 class="font-bold mb-6">
                  時給換算とは？
                </h1>
                <div class="h-36 w-36 mx-auto mb-6">
                  <img
                    src="../../images/Question.jpg"
                    alt=""
                  >
                </div>
              </div>
            </router-link>
          </div>
          <!-- <div class="p-4 h-64 w-96 mx-auto mb-10">
            <router-link :to="{ name: 'HomeIntroduction' }">
              <div class="h-full w-full px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl bg-white border-2">
                <h1 class="font-bold mb-6">
                  アプリの使い方
                </h1>
                <div class="h-36 w-36 mx-auto mb-6">
                  <img
                    src="../../images/Work.jpg"
                    alt=""
                  >
                </div>
              </div>
            </router-link>
          </div> -->
          <div class="p-4 h-64 w-96 mx-auto mb-10">
            <router-link :to="{ name: 'HomeNavigation' }">
              <div class="h-full w-full px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl bg-white border-2">
                <h1 class="font-bold mb-6">
                  使用例の紹介
                </h1>
                <div class="flex h-36 w-full mb-6">
                  <img
                    src="../../images/Business.jpg"
                    alt=""
                    class="w-1/3"
                  >
                  <img
                    src="../../images/Studying.jpg"
                    alt=""
                    class="w-1/3"
                  >
                  <img
                    src="../../images/Housework.jpg"
                    alt=""
                    class="w-1/3"
                  >
                </div>
              </div>
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import { mapGetters } from "vuex"
export default {
  name: "HomeIntroduction",
  computed: {
    ...mapGetters("users", ["authUser"])
  },
}
</script>

<style scoped>
/* ページフェード */
.pagefade-enter-active{
  transition: opacity 1s
}
.pagefade-enter{
  opacity: 0;
}
</style>