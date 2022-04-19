<template>
  <div class="mx-auto container px-8 py-20 text-center w-4/5">
    <div class="mb-20 md:text-xl text-3xl">
      <div class="mb-16">
        <div class="md:text-xl text-3xl">
          <div class="mb-10 text-left xl:text-center">
            <h1 class="mb-20 md:text-2xl text-6xl font-bold text-center">
              アプリの使い方
            </h1>
            <h2 class="text-center font-semibold mb-2">
              STEP-1
            </h2>
            <p class="mb-4 text-center">
              ユーザー登録にて現在の時給を登録しましょう。
            </p>
            <img
              src="../../images/User.jpg"
              alt=""
              class="w-full h-full mb-10"
            >
            <h2 class="text-center font-semibold mb-2">
              STEP-2
            </h2>
            <p class="mb-4 text-center">
              ログインをして取り組むタスクを登録しましょう。
            </p>
            <img
              src="../../images/User.jpg"
              alt=""
              class="w-full h-full mb-10"
            >
            <h2 class="text-center font-semibold mb-2">
              STEP-3
            </h2>
            <p class="mb-4">
              タスクの詳細画面のストップウォッチで取組時間を計測してみましょう。
            </p>
            <img
              src="../../images/User.jpg"
              alt=""
              class="w-full h-full mb-10"
            >
            <h2 class="text-center font-semibold mb-2">
              STEP-4
            </h2>
            <p class="mb-4">
              これまでに取り組んだタスクの取組状況はグラフで確認できます。
            </p>
            <img
              src="../../images/User.jpg"
              alt=""
              class="w-full h-full mb-10"
            >
            <h2 class="text-center font-semibold mb-2">
              STEP-5
            </h2>
            <p class="mb-4">
              タスク一覧画面ではどのタスクにどのくらいの労力を費やしたか相対的に確認できます。
            </p>
            <img
              src="../../images/User.jpg"
              alt=""
              class="w-full h-full mb-10"
            >
          </div>
        </div>
      </div>
    </div>

    <!-- リンク -->
    <div class="justify-center md:text-xl text-3xl">
      <div class="md:flex md:flex-wrap mb-32 text-center">
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