<template>
  <div>
    <h2>ログイン</h2>
    <form @submit.prevent="login">
      <input type="email" required placeholder="メールアドレス" v-model="email">
      <input type="password" required placeholder="パスワード" v-model="password">
      <div class="error">{{ error }}</div>
      <button>ログインする</button>
    </form>
  </div>
</template>

<script>
// import axios from 'axios'
import setItem from '../auth/setItem'
// import gql from "graphql-tag"
import { useMutation } from "@vue/apollo-composable"
import USER_LOGIN from '../graphql/UserLogin.gql'
const LOGIN_MUTATION = useMutation(USER_LOGIN)

export default {
  emits: ['redirectChatroom'],
  data () {
    return {
      email: '',
      password: '',
      error: null
    }
  },
  setup () {
    // console.log("======= self ========")
    // const { mutate: login } = useMutation(POST_LOGIN, () => ({
    //   variables: {
    //     email: "h.hasegawa1010@gmail.com",
    //     password: "password"
    //   },
    // }))
    // console.log(privateTodosQuery)
    // console.log("======= mutate ========")
    // console.log(privateTodosQuery.mutate)
    // console.log("======= end ========")
    // const privateTodos = useResult(privateTodosQuery.result, [], (data) => data?.todos)
    // const privateTodos = compute_
    // console.log("===============")

    // return {
    //   login
    // }
  },
  methods: {
    async login () {
      try {
        this.error = null

        const res = await LOGIN_MUTATION.mutate({
          email: this.email,
          password: this.password,
        })

        if (!res) {
          throw new Error('メールアドレスかパスワードが違います')
        }
        if (!this.error) {
          setItem(res.data)
          this.$emit('redirectToChatroom')
        }

        return res
      } catch (error) {
        console.log("======= ERROR =======")
        console.log({ error })
        console.log("=====================")
        this.error = 'メールアドレスかパスワードが違います'
      }
    }
  }
}
</script>
