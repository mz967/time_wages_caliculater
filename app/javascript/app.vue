<template>
  <div id="app">
    <TheHeader />
    <main class="container mx-auto mt-28 px-5 flex flex-col min-h-screen">
      <Message />
      <router-view />
    </main>
    <TheFooter />
  </div>
</template>

<script>
import TheHeader from "components/TheHeader"
import TheFooter from "components/TheFooter"
import Message from "components/Message.vue"
// import Mixin from 'mixins/mixin.js'

export default {
  components: {
    TheHeader,
    TheFooter,
    Message
  },
  // mixins : [Mixin]
}
</script>


<style scoped>
</style>

