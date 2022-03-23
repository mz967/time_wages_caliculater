<template>
  <div id="app">
    <div class="text-shadow  content-center text-blue-700">
      <TheHeader class=""/>
      <main class="container mx-auto px-5 flex flex-col min-h-screen">
        <div  class="w-full h-24">
          <Message class="ml-20"/>
        </div>
        <router-view />
      </main>
      <TheFooter class=""/>
    </div>
  </div>
</template>

<script>
import TheHeader from "components/TheHeader"
import TheFooter from "components/TheFooter"
import Message from "components/Message.vue"

export default {
  components: {
    TheHeader,
    TheFooter,
    Message
  },
}
</script>


<style scoped>
/* .slanted {
  padding: 70px 0;
  position: relative;
  margin: 0 auto 20px;
}

.slanted:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 0;
  height: 0;
  border-style: solid;
}

.slanted:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 0;
  border-style: solid;
}

.slant {
  padding: 60px 0;
  position: relative;
  margin: 20px auto 0;
}

.slant:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 0;
  height: 0;
  border-style: solid;
}

.slant:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 0;
  border-style: solid;
}


.type1:after {
  border-width: 100px 100vw 0 0;
  border-color: transparent #fff transparent transparent;
}

.type2:before {
  border-width: 0 0 100px 100vw;
  border-color: transparent transparent transparent #fff;
} */

</style>

