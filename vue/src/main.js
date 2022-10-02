import { createApp, h } from 'vue'
import App from './App.vue'
import router from './router'
import './assets/main.css'
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"
import { library } from "@fortawesome/fontawesome-svg-core"
import { faHeart } from "@fortawesome/free-solid-svg-icons"
import { provideApolloClient } from '@vue/apollo-composable'
import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client/core'
import { setContext } from '@apollo/client/link/context';

library.add(faHeart)

const httpLink = createHttpLink({
  uri: 'http://localhost:3000/graphql',
});

const authLink = setContext((_, { headers }) => {
  return {
    headers: {
      ...headers,
      uid: window.localStorage.getItem('uid'),
      "access-token": window.localStorage.getItem('access-token'),
      client: window.localStorage.getItem('client')
    }
  }
});

const cache = new InMemoryCache()
const apolloClient = new ApolloClient({
  cache,
  link: authLink.concat(httpLink)
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
