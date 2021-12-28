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
        <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
          <div class="sm:flex sm:items-start">
            <div
              v-if="editor"
              class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left"
            >
              <h3
                id="modal-title"
                class="text-lg leading-6 font-medium text-gray-900"
              >
                編集したい事項の入力をしてください
              </h3>
              <br>
              <div>
                <h3>タスク名を変更する</h3>
                <ValidationObserver v-slot="{ handleSubmit }">
                  <div class="mb-4">
                    <ValidationProvider
                      v-slot="{ errors }"
                      rules="required|max:30"
                    >
                      <label
                        class="block text-gray-700 text-sm font-bold mb-2"
                        for="title"
                      >
                        更新するタスク名を入力してください。
                      </label>
                      <input
                        id="title"
                        v-model="task.title"
                        class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none"
                        type="text"
                        name="タスク名"
                      >
                      <span class="text-red-700 px-4 py-3 rounded relative">{{ errors[0] }}</span>
                    </ValidationProvider>
                  </div>
                  <button
                    type="button"
                    class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"

                    @click="handleSubmit(handleUpdateTaskTitle)"
                  >
                    変更
                  </button>
                </ValidationObserver>
              </div>
              <br>
              <div>
                <h3>数値をリセットする</h3>
                <button
                  type="button"
                  class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                  @click="handleResetConfirm"
                >
                  リセットする
                </button>
              </div>
              <br>
              <div>
                <h3>タスクを削除する</h3>
                <button
                  type="button"
                  class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-800 text-base font-medium text-white hover:bg-red-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                  @click="handleDeleteConfirm"
                >
                  削除する
                </button>
              </div>
            </div>

            <!-- 確認モーダル 数値リセット -->
            <div
              v-if="resetConfirm"
              class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left"
            >
              <h3
                id="modal-title"
                class="text-lg leading-6 font-medium text-gray-900"
              >
                本当に数値をリセットしてもよろしいですか?
              </h3>
              <br>
              <button
                type="button"
                class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-gray-400 text-base font-medium text-white hover:bg-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                @click="handleResetCancel"
              >
                やめる
              </button>
              <button
                type="button"
                class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                @click="handleResetTask"
              >
                リセットする
              </button>
            </div>

            <!-- 確認モーダル データ削除 -->
            <div
              v-if="deleteConfirm"
              class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left"
            >
              <h3
                id="modal-title"
                class="text-lg leading-6 font-medium text-gray-900"
              >
                本当にこのタスクを削除してもよろしいですか?
              </h3>
              <br>
              <button
                type="button"
                class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-gray-400 text-base font-medium text-white hover:bg-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                @click="handleDeleteCancel"
              >
                やめる
              </button>
              <button
                type="button"
                class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                @click="handleDeleteTask"
              >
                削除する
              </button>
            </div>
          </div>
        </div>
        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
          <button
            type="button"
            class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
            @click="handleCloseModal"
          >
            閉じる
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: "TaskEditModal",
  props: {
    task: {
      type: Object,
      required: true,
      id: {
        type: Number,
        required: true
      },
      title: {
        type: String,
        required: true
      },
      total_wage: {
        type: Number,
        required: true
      },
      total_time: {
        type: Number,
        required: true
      },
      user_id: {
        type: Number,
        required: true
      }
    }
  },
  data() {
    return {
      editor: true,
      resetConfirm: false,
      deleteConfirm: false
    }
  },
  methods: {
    handleCloseModal() {
      this.$emit('close-task-edit-modal')
    },
    handleUpdateTaskTitle() {
      this.$emit('update-task', this.task)
    },
    handleResetTask() {
      this.$set(this.task, 'total_time', "0")
      this.$set(this.task, 'total_wage', "0")
      this.$emit('update-task', this.task)
    },
    handleDeleteTask() {
      this.$emit('delete-task', this.task)
    },
    handleResetConfirm() {
      this.editor = false
      this.resetConfirm = true
    },
    handleDeleteConfirm() {
      this.editor = false
      this.deleteConfirm = true
    },
    handleResetCancel() {
      this.resetConfirm = false
      this.editor = true
    },
    handleDeleteCancel() {
      this.deleteConfirm = false
      this.editor = true
    }
  }
}
</script>

<style scoped>
</style>