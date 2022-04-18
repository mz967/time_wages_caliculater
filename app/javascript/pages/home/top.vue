<template>
  <div class="mx-auto max-w-screen-xl md:px-24 lg:px-8 lg:py-8">
    <div class="max-w-4xl">
      <div class="flex flex-col mb-16">
        <!-- ログイン前 -->
        <template v-if="!authUser">
          <transition
            name="introduction"
          >
            <!-- 最初のタイトル画面 -->
            <div v-if="introduction_start">
              <img
              src="../../images/TimeWagesCalculator.jpg"
              alt=""
              class="h-full w-full mx-auto"
              >
            </div>

            <!-- フェード後 -->
            <div v-if="introduction_end">
              <div class="font-mono text-shadow mx-auto my-20 text-center">
                <h1 class="text-6xl leading-none tracking-tight font-extrabold">
                  時間賃金換算機
                </h1>
                <h2 class="text-3xl mt-14 font-bold text-shadow">
                  あなたの時間をお金に換算します
                </h2>
              </div>
              <div class="justify-center xl:text-xl text-3xl">
                <div class="xl:flex xl:flex-wrap mb-32 text-center">
                  <div class="p-4 h-64 w-96 mx-auto mb-10">
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
                  <div class="p-4 h-64 w-96 mx-auto mb-10">
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
                  </div>
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

        <!-- ログイン後 -->
        <template v-else>
          <div class="justify-center xl:text-xl text-3xl">
            <div class="xl:flex xl:flex-wrap mb-32 text-center">
              <div class="p-4 h-64 w-96 mx-auto mb-5">
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
              <div class="p-4 h-64 w-96 mx-auto mb-5">
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
              </div>
              <div class="p-4 h-64 w-96 mx-auto mb-5">
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
        </template>
      </div>
    </div>
  </div>
</template>


<script>
import { mapGetters } from "vuex"
export default {
  name: "HomeTop",
  data() {
    return {
    introduction_start: true,
    introduction_end: false
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  created() {
    this.changeIntroductionStart()
  },
  methods: {
    // タイトル画面フェード
    changeIntroductionStart() {
      setTimeout(function(){this.introduction_start = false;}.bind(this) , 500);
      this.changeIntroductionEnd()
    },
    changeIntroductionEnd(){
      setTimeout(function(){this.introduction_end = true;}.bind(this) , 1000);
    }
  }
}
</script>

<style scoped>
/* フェード用スタイル */
.introduction-enter-active, .introduction-leave-active{
    transition: opacity 1s
}
.introduction-enter, .introduction-leave-to{
    opacity: 0;
}
</style>
