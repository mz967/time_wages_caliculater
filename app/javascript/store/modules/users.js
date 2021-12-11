import axios from '../../plugins/axios'

const state = {
  authUser: null
}

const getters =  {
  authUser: state => state.authUser
}

const mutations = {
  setUser: (state, user) => {
    state.authUser = user
  }
}

const actions = {
  // 2ログイン
  async loginUser({ commit }, user) {
    const sessionsResponse = await axios.post('user_sessions', user)
    // 3 /sessionsにuserを引数で情報を獲得したresponceを格納する
    // (→sessions_controller)
    // 6 jsonで返されたトークンをsessionResponseに格納
    localStorage.auth_token = sessionsResponse.data.token
    // 7 そのなかのトークンをlocalStorage.auth_tokenとういう特定の場所に代入
    axios.defaults.headers.common['Authorization'] = `Bearer ${localStorage.auth_token}`
    // 8 デフォルトヘッダーにそのトークンをBearer化して入れてapi通信をするたびに毎回トークンを設定しなくても良くしている

    const userResponse = await axios.get('users/me')
    commit('setUser', userResponse.data)
    // ログインユーザー情報の取得
    // 9 →users_controller
    //  10 current_userとしてjsonで帰ってきたのをauthUserとして登録する
  },
  logoutUser({ commit }) {
    // ログアウト
    localStorage.removeItem('auth_token')
    axios.defaults.headers.common['Authorization'] = ''
    commit('setUser', null)
  },
  async fetchAuthUser({ commit, state }) {
    if (!localStorage.auth_token) return null
    if (state.authUser) return state.authUser
    // authUserで確認できなかったらlogin解除

    const userResponse = await axios.get('users/me')
      .catch((err) => {
        return null
      })
    if (!userResponse) return null
    // アクセスしてレスポンスエラーやデータなしの場合はlogin解除

    const authUser = userResponse.data
    if (authUser) {
      commit('setUser', authUser)
      return authUser
    } else {
      commit('setUser', null)
      return null
    }
    // responceがあり正常にsetuserできたらloginのまま
  },

  // registerWage({ commit }, user) {
  //   // this.$axios.post('users', { user: this.user })
  //   user.current_hourly_wage = 
  //   axios.patch(`users/${user.id}`, user)
  //     .then(res => {
  //       this.$router.push({ name: 'TaskIndex' })
  //     })
  //     .catch(err => {
  //       console.log(err)
  //     })
  //   }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}