<template>
  <div class="container">
    <NavbarComponent />
    <ChatWindow @connectCable="connectCable" :messages="formattedMessages" ref="chatWindow" />
    <NewChatForm @connectCable="connectCable" />
  </div>
</template>

<script>
import NavbarComponent from '../components/NavbarComponent.vue'
import ChatWindow from '../components/ChatWindow.vue'
import NewChatForm from '../components/NewChatForm.vue'
import ActionCable from 'actioncable'
import { formatDistanceToNow } from 'date-fns'
import { ja } from 'date-fns/locale'
import { useQuery } from "@vue/apollo-composable"
import GET_MESSAGES from '../graphql/GetMessages.gql'

export default {
  components: { NavbarComponent, ChatWindow, NewChatForm },
  data () {
    return {
      messages: []
    }
  },
  computed: {
    formattedMessages () {
      if (!this.messages.length) { return [] }
      return this.messages.map(message => {
        let time = formatDistanceToNow(new Date(message.createdAt), { locale: ja })
        return { ...message, created_at: time }
      })
    }
  },
  methods: {
    async getMessages () {
      try {
        const { onResult, onError } = await useQuery(GET_MESSAGES)

        onResult((queryResult) => {
          console.log(queryResult.data)
          this.messages = queryResult.data.getMessages
        })

        onError(error => {
          throw error
        })
      } catch (err) {
        console.log(err)
      }
    },
    connectCable (message) {
      this.messageChannel.perform('receive', {
        message: message,
        email: window.localStorage.getItem('uid')
      })
    }
  },
  mounted() {
    const cable = ActionCable.createConsumer('ws://localhost:3000/cable')
    this.room = localStorage.getItem('uid')
    this.messageChannel = cable.subscriptions.create({ channel: 'RoomChannel', room: this.room }, {
      connected: () => {
        this.getMessages().then(() => {
          this.$refs.chatWindow.scrollToBottom()
        })
      },
      received: () => {
        this.getMessages().then(() => {
          this.$refs.chatWindow.scrollToBottom()
        })
      }
    })
  },
  beforeUnmount () {
    this.messageChannel.unsubscribe()
  }
}
</script>

<style scoped>

</style>
