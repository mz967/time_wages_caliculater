<template>
  <div class="mx-auto sm:max-w-xl md:max-w-full lg:max-w-screen-xl md:px-24 lg:px-8 lg:py-8">
    <div class="max-w-xl sm:mx-auto lg:max-w-2xl">
      <div class="flex flex-col mb-16">
        <div class="max-w-xl md:mx-auto sm:text-center lg:max-w-2xl">
          <template v-if="!authUser">
            <transition
              name="introduction"
            >
              <div v-if="introduction_start">
                <!-- <img src="../../images/Moneytimer.jpg" alt="" class="bg-gradient-to-t"> -->
                <div class="background"></div>
                <h1 class="max-w-lg mt-20 font-mono text-xl leading-none tracking-tight sm:text-6xl md:mx-auto font-extrabold text-shadow-2xl">
                  時間賃金換算機
                </h1>
              </div>

              <div v-if="introduction_end">
                <div class="text-left text-lg">
                  <!-- <h1 class="text-3xl mb-20 font-bold">時間 ⇄ お金</h1> -->
                  <p class="mb-10">
                    時間賃金換算機ではあなたのタスクに取り組む時間を時給換算いたします。
                  </p>
                  <p class="mb-20">
                    あなたもより緊張感を持った効率的な時間を過ごしませんか？
                  </p>
                  <div class="justify-center mb-32">
                    <div class="text-center">
                      <div class="container py-4">
                        <!-- <div class="flex flex-nowrap m-4"> -->
                          <div class="p-4 h-64 w-96 mx-auto">
                            <router-link  :to="{ name: 'RegisterNew' }">
                              <div class="h-full w-full  px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl bg-white border-2 ">
                                <h1 class="font-bold text-xl mb-6">ユーザー登録</h1>
                                <div class="h-36 w-36 opacity-75 mx-auto mb-6">
                                  <img src="../../images/User.jpg" alt="">
                                </div>
                              </div>
                            </router-link>
                          </div>
                        <!-- </div> -->
                      </div>
                    </div>
                    <div class="text-center">
                      <div class="container py-4">
                        <!-- <div class="flex flex-nowrap m-4"> -->
                          <div class="p-4 h-64 w-96 mx-auto">
                            <router-link  :to="{ name: 'HomeExplanation' }">
                              <div class="h-full w-full px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative  shadow-xl bg-white border-2">
                                <h1 class="font-bold text-xl mb-6">時給換算とは？</h1>
                                <div class="h-36 w-36 mx-auto mb-6">
                                  <img src="../../images/Question.jpg" alt="">
                                </div>
                              </div>
                            </router-link>
                          </div>
                        <!-- </div> -->
                      </div>
                    </div>
                    <div>
                      <div class="text-center">
                        <div class="container py-4">
                          <!-- <div class="flex flex-nowrap m-4"> -->
                            <div class="p-4 h-64 w-96 mx-auto">
                              <router-link  :to="{ name: 'HomeIntroduction' }" >
                                <div class="h-full w-full px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl bg-white border-2">
                                  <h1 class="font-bold text-xl mb-6">このアプリの使い方</h1>
                                  <div class="h-36 w-36 mx-auto mb-6">
                                    <img src="../../images/Work.jpg" alt="">
                                  </div>
                                </div>
                              </router-link>
                            </div>
                          <!-- </div> -->
                        </div>
                      </div>
                    </div>
                    <div>
                      <div class="text-center">
                        <div class="container py-4">
                          <!-- <div class="flex flex-nowrap m-4"> -->
                            <div class="p-4 h-64 w-96 mx-auto">
                              <router-link  :to="{ name: 'HomeNavigation' }">
                                <div class="h-full w-full px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl bg-white border-2">
                                  <h1 class="font-bold text-xl mb-6">様々な使用例の紹介</h1>
                                  <div class="flex h-36 w-24 mb-6">
                                    <img src="../../images/Business.jpg" alt="" class="
                                    ">
                                    <img src="../../images/Studying.jpg" alt="" class="
                                    ">
                                    <img src="../../images/Housework.jpg" alt="" class="">
                                  </div>
                                </div>
                              </router-link>
                            </div>
                          <!-- </div> -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </transition>
          </template>

          <template v-else>
            <div class="justify-center mb-32">
              <div class="text-center">
                <div class="container py-4">
                  <!-- <div class="flex flex-nowrap m-4"> -->
                    <div class="p-4 h-64 w-96 mx-auto">
                      <router-link  :to="{ name: 'HomeExplanation' }">
                        <div class="h-full w-full px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative  shadow-xl bg-white border-2">
                          <h1 class="font-bold text-xl mb-6">時給換算とは？</h1>
                          <div class="h-36 w-36 mx-auto mb-6">
                            <img src="../../images/Question.jpg" alt="">
                          </div>
                        </div>
                      </router-link>
                    </div>
                  <!-- </div> -->
                </div>
              </div>
              <div>
                <div class="text-center">
                  <div class="container py-4">
                    <!-- <div class="flex flex-nowrap m-4"> -->
                      <div class="p-4 h-64 w-96 mx-auto">
                        <router-link  :to="{ name: 'HomeIntroduction' }" >
                          <div class="h-full w-full px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl bg-white border-2">
                            <h1 class="font-bold text-xl mb-6">このアプリの使い方</h1>
                            <div class="h-36 w-36 mx-auto mb-6">
                              <img src="../../images/Work.jpg" alt="">
                            </div>
                          </div>
                        </router-link>
                      </div>
                    <!-- </div> -->
                  </div>
                </div>
              </div>
              <div>
                <div class="text-center">
                  <div class="container py-4">
                    <!-- <div class="flex flex-nowrap m-4"> -->
                      <div class="p-4 h-64 w-96 mx-auto">
                        <router-link  :to="{ name: 'HomeNavigation' }">
                          <div class="h-full w-full px-8 pt-6 pb-24 rounded-lg overflow-hidden text-center relative shadow-xl bg-white border-2">
                            <h1 class="font-bold text-xl mb-6">様々な使用例の紹介</h1>
                            <div class="flex h-36 w-24 mb-6">
                              <img src="../../images/Business.jpg" alt="" class="
                              ">
                              <img src="../../images/Studying.jpg" alt="" class="
                              ">
                              <img src="../../images/Housework.jpg" alt="" class="">
                            </div>
                          </div>
                        </router-link>
                      </div>
                    <!-- </div> -->
                  </div>
                </div>
              </div>
            </div>
          </template>
        </div>
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
    changeIntroductionStart() {
      setTimeout(function(){this.introduction_start = false;}.bind(this) , 1000);
      this.changeIntroductionEnd()
    },

    changeIntroductionEnd(){
      setTimeout(function(){this.introduction_end = true;}.bind(this) , 3000);
    }
  }
}
</script>

<style scoped>
.introduction-enter-active, .introduction-leave-active{
    transition: opacity 1s
}

.introduction-enter, .introduction-leave-to{
    opacity: 0;
}

.introduction-leave-active, .introduction-enter-active{
    transition: opacity 2s
}

.introduction-enter-to, .introduction-leave{
    opacity: 1;
}

/* .introduction-leave-to, .introduction-enter{
    opacity: 0;
} */


/* .link-leave-to, .link-enter{
    opacity: 1;
} */
.background{
  background-image: url("../../images/Moneytimer.jpg");
}

</style>
