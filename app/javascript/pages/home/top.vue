<template>
  <div class="px-4 py-16 mx-auto sm:max-w-xl md:max-w-full lg:max-w-screen-xl md:px-24 lg:px-8 lg:py-20">
    <div class="max-w-xl sm:mx-auto lg:max-w-2xl">
      <div class="flex flex-col mb-16 sm:text-center">
        <div class="max-w-xl md:mx-auto sm:text-center lg:max-w-2xl">
          <template v-if="!authUser">
            <transition
              v-if="homeIntroduction"
              name="introduction"
            >
              <div>
                <h2 class="max-w-lg mb-6 font-sans text-3xl font-bold leading-none tracking-tight text-gray-900 sm:text-4xl md:mx-auto">
                  時間 × 時給
                </h2>
                <p class="text-base text-gray-700 md:text-lg">
                  あなたの時間をお金に換算してみませんか？
                </p>
              </div>
            </transition>

            <transition
              v-if="homeLink"
              name="link"
            >
              <div>
                <h4 class="max-w-lg mb-6 font-sans text-lg font-bold leading-none tracking-tight text-gray-900 sm:text-4xl md:mx-auto">
                  時給換算とは...??
                </h4>
                <p class="text-base text-gray-700 md:text-lg">
                  時給計算のメリット的なものを書く
                  <br>
                  「時給換算」と聞くとあまり聞き馴染みのない方がほとんどだと思います。
                  <br>
                  「時給換算」は自分の時間に金銭的価値を想定することで緊張感を持ってタスクに取り組むことができ、効率の良い時間の使い方を考えるきっかけを与えます。
                  <br>
                  時間賃金換算機ではそんな「時給換算」を効率的に行うお手伝いをします!
                  <br>
                  実際に「時給換算」を体験してみましょう!
                </p>
                <ul>
                  <li>
                    <router-link
                      :to="{ name: 'TaskIndex' }"
                      class="inline-flex items-center bg-blue-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-20"
                    >
                      試してみる!
                    </router-link>
                  </li>
                  <li>
                    <router-link
                      :to="{ name: 'HomeIntroduction' }"
                      class="inline-flex items-center bg-green-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-20 mb-10"
                    >
                      このアプリケーションをもっと知りたい...→
                    </router-link>
                  </li>
                  <li>
                    <router-link
                      :to="{ name: 'HomeNavigation' }"
                      class="inline-flex items-center bg-red-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mb-10"
                    >
                      さまざまな使い方の紹介→
                    </router-link>
                  </li>
                </ul>
              </div>
            </transition>
          </template>

          <template v-else>
            <div>
              <h2 class="max-w-lg mb-6 font-sans text-3xl font-bold leading-none tracking-tight text-gray-900 sm:text-4xl md:mx-auto">
                時間 × 時給
              </h2>
              <p class="text-base text-gray-700 md:text-lg">
                あなたならではの時給換算をしましょう!!
              </p>
              <ul>
                <li>
                  <router-link
                    :to="{ name: 'HomeIntroduction' }"
                    class="inline-flex items-center bg-green-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-20 mb-10"
                  >
                    このアプリケーションをもっと知りたい→
                  </router-link>
                </li>
                <li>
                  <router-link
                    :to="{ name: 'HomeNavigation' }"
                    class="inline-flex items-center bg-red-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mb-10"
                  >
                    さまざまな使い方の紹介→
                  </router-link>
                </li>
              </ul>
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
    homeIntroduction: true,
    homeLink: false
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  created() {
    this.changeHome()
    // setTimeout(function(){this.changeHome = false}, 2000);
  },
  methods: {
    changeHome() {
      // const self = this;
      setTimeout(function(){this.homeIntroduction = false;}.bind(this) , 1000);
      // this.homeIntroduction = false
      // this.homeIntroduction = setTimeout(function(){false},10)
      this.change()
    },
    change(){
      setTimeout(function(){this.homeLink = true;}.bind(this) , 3000);
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

.link-enter-active, .link-leave-active{
    transition: opacity 2s
}

.link-enter, .link-leave-to{
    opacity: 0;
}

</style>
