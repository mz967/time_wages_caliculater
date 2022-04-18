<template>
  <div
    class="fixed z-10 inset-0 overflow-y-auto"
  >
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div
        class="fixed inset-0 bg-blue-200 bg-opacity-75 transition-opacity"
        @click.self="handleCloseModal"
      />
      <div class="inline-block align-bottom bg-white rounded-lg overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
        <ValidationObserver v-slot="{ handleSubmit }">
          <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4 text-center">
            <div class="">
              <div class="mt-3">
                <div class="mt-10 mb-4">
                  <ValidationProvider
                    v-slot="{ errors }"
                    rules="required|max:30"
                  >
                    <label
                      class="block mb-10 xl:text-xl text-4xl font-bold"
                      for="title"
                    >
                      取り組みたいタスクの名称を入力してください。
                    </label>
                    <input
                      id="title"
                      v-model="task.title"
                      class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none shadow mb-6"
                      type="text"
                      name="タイトル"
                    >
                    <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
                  </ValidationProvider>
                </div>
              </div>
            </div>
          </div>
          <div class="px-4 py-3 text-center">
            <button
              type="button"
              class="xl:w-48 w-56 inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 xl:text-sm text-4xl mb-10"
              @click="handleSubmit(handleCreateTask)"
            >
              タスク作成
            </button>
            <br>
            <button
              type="button"
              class="mt-3 w-48 inline-flex justify-center rounded-md border border-gray-300 shadow px-4 py-2 bg-white font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 xl:text-sm text-4xl"
              @click="handleCloseModal"
            >
              閉じる
            </button>
          </div>
        </ValidationObserver>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: "TaskCreateModal",
  data() {
    return {
      task: {
        title: ''
      }
    }
  },

  methods: {
    handleCreateTask() {
      this.$emit('create-task', this.task)
    },
    handleCloseModal() {
      this.$emit('close-task-create-modal')
    },
  }
}
</script>

<style scoped>
</style>