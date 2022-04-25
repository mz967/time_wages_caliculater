<template>
  <div
    v-show="message"
    class="text-green-600 text-xl mt-5"
  >
    {{ message }}
  </div>
</template>

<script>
  import { mapState } from 'vuex'
  export default {
    computed: {
      ...mapState({
        message: state => state.message.content
      })
    }
  }
</script>
