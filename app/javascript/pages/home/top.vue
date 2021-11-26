<template>
  <div class="px-4 py-16 mx-auto sm:max-w-xl md:max-w-full lg:max-w-screen-xl md:px-24 lg:px-8 lg:py-20">
    <div class="max-w-xl sm:mx-auto lg:max-w-2xl">
      <div class="flex flex-col mb-16 sm:text-center">
        <div class="max-w-xl md:mx-auto sm:text-center lg:max-w-2xl">
          <h2 class="max-w-lg mb-6 font-sans text-3xl font-bold leading-none tracking-tight text-gray-900 sm:text-4xl md:mx-auto">
            Welcome to<br>
            Time Wages Calulator!!
          </h2>
          <p class="text-base text-gray-700 md:text-lg">
            あなたの大切な時間をお金に換算いたします。
          </p>
          <br>
          <router-link
            :to="{ name: 'HomeIntroduction' }"
            class="inline-flex items-center bg-green-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 my-40"
          >
            Time Wages Calculatorとは？
          </router-link>
          <br>
          <router-link
            :to="{ name: 'TaskIndex' }"
            class="inline-flex items-center bg-blue-400 border-0 py-1 px-3 focus:outline-none hover:bg-gray-500 rounded text-base mt-4 my-40"
          >
            Let's try!!
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
export default {
  name: "HomeTop"
}
</script>
