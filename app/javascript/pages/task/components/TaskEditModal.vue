<template>
  <div
    class="fixed z-10 inset-0 overflow-y-auto"
    aria-labelledby="modal-title"
    role="dialog"
    aria-modal="true"
  >
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div
        class="fixed inset-0 bg-blue-200 bg-opacity-75 transition-opacity"
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
              <h1
                id="modal-title"
                class="leading-6 text-lg mb-10 font-bold"
              >
                ◎編集したい事項を確認してください。
              </h1>
              <div class="mb-10">
                <ValidationObserver v-slot="{ handleSubmit }">
                  <div class="mb-4">
                    <ValidationProvider
                      v-slot="{ errors }"
                      rules="required|max:30"
                    >
                      <label
                        class="block mb-4"
                        for="title"
                      >
                        ・タスク名を変更
                      </label>
                      <input
                        id="title"
                        v-model="task.title"
                        class="shadow appearance-none border rounded w-full py-2 px-3 mb-3 text-gray-700 leading-tight focus:outline-none"
                        type="text"
                        name="タスク名"
                      >
                      <span class="text-red-400 px-4 py-3 rounded relative">{{ errors[0] }}</span>
                    </ValidationProvider>
                  </div>
                  <button
                    type="button"
                    class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-blue-400 via-blue-500 to-blue-400 text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                    @click="handleSubmit(handleUpdateTaskTitle)"
                  >
                    変更
                  </button>
                </ValidationObserver>
              </div>
              <div class="mb-14">
                <h2 class="mb-4">
                  ・数値をリセット
                </h2>
                <button
                  type="button"
                  class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-red-400 via-red-500 to-red-400 text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm"
                  @click="handleResetConfirm"
                >
                  リセット
                </button>
              </div>
              <div class="mb-14">
                <h2 class="mb-4">
                  ・タスクを削除
                </h2>
                <button
                  type="button"
                  class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-red-500 via-red-700 to-red-500 text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm"
                  @click="handleDeleteConfirm"
                >
                  削除
                </button>
              </div>
            </div>

            <!-- 確認モーダル 数値リセット -->
            <div
              v-if="resetConfirm"
              class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left  text-red-600"
            >
              <h1
                id="modal-title"
                class="leading-6 text-3xl mb-10"
              >
                ☆☆注意☆☆
              </h1> 
              <h2 class="mb-6">
                リセットを押したらこれまで記録してきた<br>
                総合計時間・総合計金額の数値を消去します。<br>
                本当にリセットをしてもよろしいですか？
              </h2>
              <button
                type="button"
                class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-red-400 via-red-500 to-red-400 text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm"
                @click="handleResetTask"
              >
                リセット
              </button>
              <button
                type="button"
                class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
                @click="handleResetCancel"
              >
                戻る
              </button>
            </div>

            <!-- 確認モーダル データ削除 -->
            <div
              v-if="deleteConfirm"
              class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left text-red-600"
            >
              <h1
                id="modal-title" 
                class="leading-6 text-3xl mb-10"
              >
                ☆☆注意☆☆
              </h1>
              <h2 class="mb-6">
                削除を押したらこれまで記録してきたデータを<br>
                タスクごと削除します。<br>
                本当に削除をしてもよろしいですか？
              </h2>
              <br>
              <button
                type="button"
                class="w-full inline-flex justify-center rounded-md border border-transparent shadow px-4 py-2 bg-gradient-to-b hover:bg-gradient-to-t from-red-400 via-red-500 to-red-400 text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm"
                @click="handleDeleteTask"
              >
                削除
              </button>
              <button
                type="button"
                class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
                @click="handleDeleteCancel"
              >
                戻る
              </button>
            </div>
          </div>
        </div>
        <div class="px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
          <button
            type="button"
            class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
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