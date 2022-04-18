<template>
  <div class="container px-5 py-24 mx-auto">
    <!-- 仕事での使用法 -->
    <div
    class="flex items-center w-4/5 mx-auto sm:flex-row flex-col bg-blue-200"
    @click="openWorkDetail()"
    >
      <img
        src="../../images/Business.jpg"
        alt=""
        class="w-1/3 h-1/3 py-10 xl:pl-20"
      >
      <div class="flex-grow text-center mt-6">
        <h1 class="mb-2 font-bold xl:text-4xl text-6xl">
          仕事で使う
        </h1>
        <h2 v-if="workDetail===false" class="xl:pb-0 pb-10">Click here!</h2>
      </div>
    </div>
    <!-- クリックしたら表示↓ -->
    <transition name="work">
      <div v-if="workDetail===true" class="items-center w-4/5 mx-auto bg-blue-200 text-center xl:text-xl text-2xl py-20 xl:py-0">
        <div class="py-10">
          <h1 class="xl:text-2xl text-3xl mb-10 font-semibold">
            仕事で行うタスクを登録してみましょう！
          </h1>
          <div class="w-4/6 mx-auto text-left">
            <h2 class="mb-6">
              「事務作業」「A社へ営業」「電話で新規工作」など...
            </h2>
            <h2 class="mb-6">
              実際にこれから仕事で取り組みたいタスクを登録してみましょう！
            </h2>
            <h2 class="mb-6">
              「事務作業」などをダラダラとしていていつのまにか膨大な時間を費やしているかもしれません。
            </h2>
            <h2 class="mb-6">
              「A社へ営業」に費やした時間でそれ以上の収益を獲得できているかどうかを確認できます。
            </h2>
            <h2 class="mb-6">
              もしもタスクに費やした金額よりも収益が低い場合はもっと効率的な営業をする必要があるでしょう。
            </h2>
            <img
              src="../../images/Dash.jpg"
              alt=""
              class="w-1/3 h-1/3 py-10 ml-auto"
            >
          </div>
        </div>
        <div class="py-10">
          <h1 class="xl:text-2xl text-3xl mb-10 font-semibold">
            部下の労働管理に使用してみましょう！
          </h1>
          <div class="w-4/6 mx-auto text-left">
            <h2 class="mb-6">
              あなたの管理するチームはみんな効率的に行動しているでしょうか？
            </h2>
            <h2 class="mb-6">
              営業車で業務中に寝てはいないでしょうか？
            </h2>
            <h2 class="mb-6">
              テレワークの際にサボってはいないでしょうか？
            </h2>
            <h2 class="mb-6">
              時間賃金換算機を使用することで管理者はチームでの収益状況を可視化することができます。
            </h2>
            <h2 class="mb-6">
              またチームの一人一人が時給を意識することで緊張感を持って行動するきっかけになります。
            </h2>
            <img
              src="../../images/Boss.jpg"
              alt=""
              class="w-1/3 h-1/3 mr-auto pt-10"
            >
          </div>
        </div>
      </div>
    </transition>

    <!-- 余暇時間での使用法 -->
    <div
    class="flex lg:flex-row-reverse items-center w-4/5 mx-auto sm:flex-row flex-col bg-green-200 mt-20"
    @click="openWasteDetail()"
    >
      <img
        src="../../images/Studying.jpg"
        alt=""
        class="w-1/3 h-1/3 py-10 xl:pr-20"
      >
      <div class="flex-grow text-center mt-6">
        <h1 class="mb-2 font-bold xl:text-4xl text-6xl">
          余暇時間の無駄を無くす
        </h1>
        <h2 v-if="wasteDetail===false" class="xl:pb-0 pb-10">Click here!</h2>
      </div>
    </div>
    <!-- クリックしたら表示↓ -->
    <transition name="waste">
      <div v-if="wasteDetail===true" class="items-center w-4/5 mx-auto bg-green-200 text-center xl:text-xl text-2xl py-20 xl:py-0">
        <div class="py-10">
          <h1 class="xl:text-2xl text-3xl mb-10 font-semibold">
            自己啓発の励みにつながります！
          </h1>
          <div class="w-4/6 mx-auto text-left">
            <h2 class="mb-6">
              何か自己啓発に取り組む時になんとなくただ続けているだけだと
            </h2>
            <h2 class="mb-6">
              すぐにマンネリ化してしまいモチベーションを保つのが難しいです。
            </h2>
            <h2 class="mb-6">
              時間賃金換算機を使用すれば取り組んだ学習に費やした時間と金額を可視化できるため
            </h2>
            <h2 class="mb-6">
              費やしてきたことが自信になりモチベーションとなります。
            </h2>
            <img
              src="../../images/Studying2.jpg"
              alt=""
              class="w-1/3 h-1/3 py-10 ml-auto"
            >
          </div>
        </div>
        <div class="py-10">
          <h1 class="xl:text-2xl text-3xl mb-10 font-semibold">
            より有意義な時間を過ごすきっかけに！
          </h1>
          <div class="w-4/6 mx-auto text-left">
            <h2 class="mb-6">
              「釣り」「登山」「ランニング」など...
            </h2>
            <h2 class="mb-6">
              趣味に時間を費やす際にもより楽しているかを振り返るために使用してみましょう。
            </h2>
            <h2 class="mb-6">
              より満足できる効率的な休日の使い方につながります！
            </h2>
            <img
              src="../../images/Runner.jpg"
              alt=""
              class="w-1/3 h-1/3 mr-auto pt-10"
            >
          </div>
        </div>
      </div>
    </transition>

    <!-- 価格比較での使用法 -->
    <div
    class="flex items-center w-4/5 mx-auto sm:flex-row flex-col bg-yellow-200 mt-20"
    @click="openValueDetail()"
    >
      <img
        src="../../images/Housework.jpg"
        alt=""
        class="w-1/3 h-1/3 py-10 xl:pl-20"
      >
      <div class="flex-grow text-center mt-6">
        <h1 class="mb-2 font-bold xl:text-4xl text-6xl">
          価値の比較をする
        </h1>
        <h2 v-if="valueDetail===false" class="xl:pb-0 pb-10">Click here!</h2>
      </div>
    </div>
    <!-- クリックしたら表示↓ -->
    <transition name="value">
      <div v-if="valueDetail===true" class="items-center w-4/5 mx-auto bg-yellow-200 text-center xl:text-xl text-2xl py-20 xl:py-0">
        <div class="py-10">
          <h1 class="xl:text-2xl text-3xl mb-10 font-semibold">
            アウトソーシングを考える基準にしてみましょう！
          </h1>
          <div class="w-4/6 mx-auto text-left">
            <h2 class="mb-6">
              例えば「家事」をタスクで登録してみましょう。
            </h2>
            <h2 class="mb-6">
              掃除や洗濯は思ったよりも時間がかかっているケースがあります。
            </h2>
            <h2 class="mb-6">
              一方で今は家事代行サービスが安価で利用できます。
            </h2>
            <h2 class="mb-6">
              時間賃金換算機を使用すればで時給計算してみた金額と比較して
            </h2>
            <h2 class="mb-6">
              家事代行を検討する判断基準にもなります。
            </h2>
            <img
              src="../../images/Clean.jpg"
              alt=""
              class="w-1/3 h-1/3 py-10 ml-auto"
            >
          </div>
        </div>
        <div class="py-10">
          <h1 class="xl:text-2xl text-3xl mb-10 font-semibold">
            商品を買う際の参考にしてみましょう！
          </h1>
          <div class="w-4/6 mx-auto text-left">
            <h2 class="mb-6">
              「乾燥機付洗濯機」などの時間効率化するためのアイテムを買う際に
            </h2>
            <h2 class="mb-6">
              選択を干す時間を計測してみてどのくらいで元が取れるのかを図ることがでます。
            </h2>
            <img
              src="../../images/Dry.jpg"
              alt=""
              class="w-1/3 h-1/3 mr-auto pt-10"
            >
          </div>
        </div>
      </div>
    </transition>

    <div class="items-center w-4/5 mx-auto text-4xl text-center my-20">
      <h1 class="mb-10">時間の使い方はあなた次第！</h1>
      <h1>あなたなりの時給換算を考えてみましょう！</h1>
    </div>

    <!-- リンク -->
    <div class="justify-center xl:text-xl text-3xl w-4/5 mx-auto">
      <div class="xl:flex xl:flex-wrap mb-32 text-center">
        <div v-if="!authUser" class="p-4 h-64 w-96 mx-auto mb-10">
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
      </div>
    </div>
  </div>

</template>

<script>
import { mapGetters } from "vuex"
export default {
  name: "HomeNavigation",
  data() {
    return {
    workDetail: false,
    wasteDetail: false,
    valueDetail: false
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  methods: {
    openWorkDetail(){
      this.workDetail = true;
    },
    openWasteDetail(){
      this.wasteDetail = true;
    },
    openValueDetail(){
      this.valueDetail = true;
    }
  }
}
</script>

<style scoped>
/* フェード用スタイル */
.work-enter-active, .work-leave-active{
  transition: opacity 0.5s
}
.work-enter, .work-leave-to{
  opacity: 0;
}
.waste-enter-active, .waste-leave-active{
  transition: opacity 0.5s
}
.waste-enter, .waste-leave-to{
  opacity: 0;
}
.value-enter-active, .value-leave-active{
  transition: opacity 0.5s
}
.value-enter, .value-leave-to{
  opacity: 0;
}
</style>
