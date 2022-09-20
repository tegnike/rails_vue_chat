import { createRouter, createWebHistory } from 'vue-router'
import Welcome from '../views/WelcomePage'
import Chatroom from '../views/ChatroomPage'

const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: Welcome
  },
  {
    path: '/chatroom',
    name: 'Chatroom',
    component: Chatroom
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
