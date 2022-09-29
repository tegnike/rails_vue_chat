import { createApp, h } from 'vue'
import App from './App.vue'
import router from './router'
import './assets/main.css'
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"
import { library } from "@fortawesome/fontawesome-svg-core"
import { faHeart } from "@fortawesome/free-solid-svg-icons"
import { provideApolloClient } from '@vue/apollo-composable'
import { ApolloClient, InMemoryCache } from '@apollo/client/core'

library.add(faHeart)

const cache = new InMemoryCache()
const apolloClient = new ApolloClient({
  cache,
  uri: 'http://localhost:3000/graphql_auth',
})

const app = createApp({
  setup () {
    provideApolloClient(apolloClient)
  },

  render: () => h(App),
})

app.use(router)
app.component("font-awesome-icon", FontAwesomeIcon)
app.mount('#app')
