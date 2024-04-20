import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import BookView from '../views/BookView.vue'
import BookFormView from '../views/BookFormView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/book/:bookId',
      name: 'see_book',
      component: BookView
    },
    {
      path: '/add_book/:bookId?',
      name: 'add_book',
      component: BookFormView
    },
  ]
})

export default router
