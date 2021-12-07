<template>
  <div id="app">
    <TheHeader />
    <main class="container mx-auto mt-28 px-5 flex flex-col min-h-screen">
      <router-view />
    </main>
    <TheFooter />
  </div>
</template>

<script>
import TheHeader from "components/TheHeader"
import TheFooter from "components/TheFooter"
// import Mixin from 'mixins/mixin.js'

export default {
  components: {
    TheHeader,
    TheFooter
  },
  // mixins : [Mixin]
}
</script>


<style scoped>
</style>

