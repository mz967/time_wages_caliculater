<template>
  <transition
    name="pagefade"
    appear
  >
    <div class="px-5 py-24 mx-auto">
      <!-- 仕事での使用法 -->
      <div
        class="flex items-center w-4/5 mx-auto lg:flex-row flex-col bg-blue-200"
        @click="openWorkDetail()"
      >
        <img
          src="../../images/Business.jpg"
          alt=""
          class="w-1/3 h-1/3 py-10 lg:pl-20"
        >
        <div class="flex-grow text-center mt-6">
          <h1 class="mb-2 font-bold lg:text-4xl text-5xl">
            仕事で使う
          </h1>
          <h2
            v-if="workDetail===false"
            class="lg:pb-0 pb-10"
          >
            Click here!
          </h2>
        </div>
      </div>
      <!-- クリックしたら表示↓ -->
      <transition name="work">
        <div
          v-if="workDetail===true"
          class="items-center w-4/5 mx-auto bg-blue-200 text-center lg:text-xl text-2xl py-20 xl:py-0"
        >
          <div class="py-10 leading-loose">
            <h1 class="lg:text-2xl text-3xl mb-10 font-semibold">
              仕事で行うタスクを登録してみましょう！
            </h1>
            <div class="w-4/6 mx-auto text-left">
              <h2 class="mb-6">
                「事務作業」「A社へ営業」「電話で新規工作」など...
              </h2>
              <h2 class="mb-6">
                時間賃金換算機を使用して実際にこれから仕事で取り組みたいタスクを登録してみましょう！
              </h2>
              <h2 class="mb-6">
                「事務作業」などをダラダラと行なってしまいいつのまにか膨大な時間を費やしていることはありませんか?
              </h2>
              <h2 class="mb-10">
                自分が思っている以上に大きな金額分の作業になっているかもしれません。
              </h2>
              <h2 class="mb-6">
                「A社へ営業」「電話で新規工作」は本当に効率的な仕事ですか?
              </h2>
              <h2 class="mb-6">
                実際に時間を計測し時給換算をすることで費やしている時間を金額に換算してみましょう。
              </h2>
              <h2 class="mb-6">
                もしもタスクに費やした金額よりも獲得した収益が低い場合はもっと効率的な営業をする必要があるでしょう。
              </h2>
              <img
                src="../../images/Dash.jpg"
                alt=""
                class="w-1/3 h-1/3 py-10 ml-auto"
              >
            </div>
          </div>
          <div class="py-10 leading-loose">
            <h1 class="lg:text-2xl text-3xl mb-10 font-semibold">
              部下の労働管理に使用してみましょう！
            </h1>
            <div class="w-4/6 mx-auto text-left">
              <h2 class="mb-6">
                あなたの管理するチームは全員効率的に行動しているでしょうか？
              </h2>
              <h2 class="mb-6">
                A君は営業車で業務中に寝てはいないでしょうか？
              </h2>
              <h2 class="mb-6">
                Bさんはテレワークの際にサボってはいないでしょうか？
              </h2>
              <h2 class="mb-10">
                チーム全員で時間賃金換算機を使用すれば一人一人が時給を意識することで緊張感を持って行動するきっかけになります。
              </h2>
              <h2 class="mb-6">
                またチーム全体でどのくらいの時間価値を費やして収益が獲得できているかを管理するのはなかなか面倒くさいものです。
              </h2>
              <h2 class="mb-6">
                時間賃金換算機を使用すれば管理者はチームでの時間価値を可視化することができるため収益との比較も簡単になります。
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
        class="flex lg:flex-row-reverse items-center w-4/5 mx-auto flex-col bg-green-200 mt-20"
        @click="openWasteDetail()"
      >
        <img
          src="../../images/Studying.jpg"
          alt=""
          class="w-1/3 h-1/3 py-10 lg:pr-20"
        >
        <div class="flex-grow text-center mt-6">
          <h1 class="mb-2 font-bold lg:text-4xl text-5xl">
            余暇時間で使う
          </h1>
          <h2
            v-if="wasteDetail===false"
            class="lg:pb-0 pb-10"
          >
            Click here!
          </h2>
        </div>
      </div>
      <!-- クリックしたら表示↓ -->
      <transition name="waste">
        <div
          v-if="wasteDetail===true"
          class="items-center w-4/5 mx-auto bg-green-200 text-center lg:text-xl text-2xl py-20 lg:py-0"
        >
          <div class="py-10 leading-loose">
            <h1 class="lg:text-2xl text-3xl mb-10 font-semibold">
              自己啓発の励みにつながります！
            </h1>
            <div class="w-4/6 mx-auto text-left">
              <h2 class="mb-6">
                「資格試験」「語学学習」「筋トレ」など...
              </h2>
              <h2 class="mb-6">
                何か自己啓発に取り組む時になんとなくただ続けているだけだとすぐにマンネリ化してしまいモチベーションを保つのが難しいです。
              </h2>
              <h2 class="mb-6">
                時間賃金換算機を使用すれば取り組んだ学習に費やした時間を金額としてを可視化できます。
              </h2>
              <h2 class="mb-6">
                可視化された金額はこれまでの努力の証となりこれからも頑張り続ける励みになるでしょう。
              </h2>
              <h2 class="mb-6">
                積み重ねてきた金額に対して実力が伴っていなかった場合は改めて効率的な学習方法を考えるきっかけにもなります。
              </h2>
              <img
                src="../../images/Studying2.jpg"
                alt=""
                class="w-1/3 h-1/3 py-10 ml-auto"
              >
            </div>
          </div>
          <div class="py-10 leading-loose">
            <h1 class="lg:text-2xl text-3xl mb-10 font-semibold">
              より有意義な時間を過ごすきっかけに！
            </h1>
            <div class="w-4/6 mx-auto text-left">
              <h2 class="mb-6">
                「ランニング」「飲み会」など...
              </h2>
              <h2 class="mb-6">
                趣味に時間を費やす際にもより楽しめているかを振り返るために使用してみましょう。
              </h2>
              <h2 class="mb-6">
                道具などを揃えてしまったためそんなにハマっていないけれどダラダラと惰性で続けている趣味はありませんか？
              </h2>
              <h2 class="mb-6">
                人付き合いで別に対して行きたくないけれど断りない約束はありませんか?
              </h2>
              <h2 class="mb-6">
                それらの時間は自分の大切な余暇時間を使ってでもする必要があることでしょうか?
              </h2>
              <h2 class="mb-6">
                時間賃金換算機でそういった遊びの時間も記録してみましょう！
              </h2>
              <h2 class="mb-6">
                自分が一番楽しめる時間を改めて知ることで有意義な余暇時間を楽しみましょう。
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
        class="flex items-center w-4/5 mx-auto lg:flex-row flex-col bg-yellow-200 mt-20"
        @click="openValueDetail()"
      >
        <img
          src="../../images/Housework.jpg"
          alt=""
          class="w-1/3 h-1/3 py-10 lg:pl-20"
        >
        <div class="flex-grow text-center mt-6">
          <h1 class="mb-2 font-bold lg:text-4xl text-5xl">
            価値の比較をする
          </h1>
          <h2
            v-if="valueDetail===false"
            class="lg:pb-0 pb-10"
          >
            Click here!
          </h2>
        </div>
      </div>
      <!-- クリックしたら表示↓ -->
      <transition name="value">
        <div
          v-if="valueDetail===true"
          class="items-center w-4/5 mx-auto bg-yellow-200 text-center lg:text-xl text-2xl py-20 lg:py-0"
        >
          <div class="py-10 leading-loose">
            <h1 class="lg:text-2xl text-3xl mb-10 font-semibold">
              アウトソーシングを考える基準にしてみましょう！
            </h1>
            <div class="w-4/6 mx-auto text-left">
              <h2 class="mb-6">
                例えば「家事」をタスクとして登録してみましょう。
              </h2>
              <h2 class="mb-6">
                掃除や洗濯は思ったよりも時間がかかっているケースがあります。
              </h2>
              <h2 class="mb-6">
                一方で今は家事代行サービスが安価で利用できます。
              </h2>
              <h2 class="mb-6">
                時間賃金換算機を使用すれば時給計算してみた金額と比較して家事代行を検討する判断基準にもなります。
              </h2>
              <img
                src="../../images/Clean.jpg"
                alt=""
                class="w-1/3 h-1/3 py-10 ml-auto"
              >
            </div>
          </div>
          <div class="py-10 leading-loose">
            <h1 class="lg:text-2xl text-3xl mb-10 font-semibold">
              商品を買う際の参考にしてみましょう！
            </h1>
            <div class="w-4/6 mx-auto text-left">
              <h2 class="mb-6">
                「乾燥機付洗濯機」などの時間効率化するためのアイテムを買う際の判断基準にも時間賃金換算機は一役買います。
              </h2>
              <h2 class="mb-6">
                洗濯を干す時間を計測してみてどのくらいの金額が発生しているかを知ることができます。
              </h2>
              <h2 class="mb-6">
                その金額と商品の値段を比較することでどのくらいその商品を使用することで元が取れるかを把握することができます。
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

      <div class="items-center w-4/5 mx-auto text-4xl lg:text-2xl text-center my-20">
        <h1 class="mb-10">
          時間の使い方はあなた次第！
        </h1>
        <h1>あなたなりの時給換算を考えてみましょう！</h1>
      </div>

      <!-- リンク -->
      <div class="justify-center lg:text-xl text-3xl w-4/5 mx-auto">
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
  </transition>
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
/* 各フェード */
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
/* ページフェード */
.pagefade-enter-active{
  transition: opacity 1s
}
.pagefade-enter{
  opacity: 0;
}
</style>
