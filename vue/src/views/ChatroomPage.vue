<template>
  <div class="container">
    <NavbarComponent />
    <ChatWindow :messages="messages" />
  </div>
</template>

<script>
import NavbarComponent from '../components/NavbarComponent.vue'
import ChatWindow from '../components/ChatWindow.vue'
import axios from 'axios'

export default {
  components: { NavbarComponent, ChatWindow },
  data () {
    return {
      messages: []
    }
  },
  methods: {
    async getMessages () {
      try {
        const res = await axios.get('http://localhost:3000/messages', {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })

        if (!res) {
          throw new Error('メッセージ一覧を取得できませんでした')
        }

        this.messages = res.data
      } catch (err) {
        console.log(err)
      }
    }
  },
  mounted() {
    this.getMessages()
  }
}
</script>

<style scoped>

</style>
