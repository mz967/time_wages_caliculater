<template>
  <div
    v-show="message"
    class="text-green-500"
  >
    {{ message }}
  </div>
</template>

<script>
  import { mapState } from 'vuex'
  export default {
    // data: {
    //     success: true,
    //     alert: false
    // },
    computed: {
      ...mapState({
        message: state => state.message.content
      })
    }
  }
</script>
