<template>
  <div
    class="fixed z-10 inset-0 overflow-y-auto"
    aria-labelledby="modal-title"
    role="dialog"
    aria-modal="true"
  >
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div
        class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
        aria-hidden="true"
      />
      <span
        class="hidden sm:inline-block sm:align-middle sm:h-screen"
        aria-hidden="true"
      >&#8203;</span>
      <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
        <ValidationObserver v-slot="{ handleSubmit }">
          <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
            <div class="sm:flex sm:items-start">
              <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                <div class="mt-10 mb-4">
                  <ValidationProvider
                    v-slot="{ errors }"
                    rules="required|max:30"
                  >
                    <label
                      class="block text-gray-700 text-sm font-bold mb-2"
                      for="title"
                    >
                      取り組みたいタスクの名称を入力してください
                    </label>
                    <input
                      id="title"
                      v-model="task.title"
                      class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none"
                      type="text"
                      name="タイトル"
                    >
                    <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
                  </ValidationProvider>
                </div>
              </div>
            </div>
          </div>
          <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
            <button
              type="button"
              class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
              @click="handleSubmit(handleCreateTask)"
            >
              タスク作成
            </button>
            <button
              type="button"
              class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
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