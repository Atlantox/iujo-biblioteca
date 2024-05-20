import { createRouter, createWebHistory } from 'vue-router'

import useSessionStore from '@/stores/session.js'

import HomeView from '../views/HomeView.vue'
import SearchBooksView from '../views/tables/SearchBooksView.vue'
import SeeBookView from '../views/SeeBookView.vue'
import BookFormView from '../views/forms/BookFormView.vue'
import LoanFormView from '../views/forms/LoanFormView.vue'
import SearchLoanView from '../views/tables/SearchLoanView.vue'
import SeeLoanView from '../views/SeeLoanView.vue'
import ReaderFormView from '../views/forms/ReaderFormView.vue'
import SearchReadersView from '../views/tables/SearchReadersView.vue'
import SeeReaderView from '../views/SeeReaderView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
      meta:{ requireAuthentication: false }
    },
    {
      path: '/books',
      name: 'search_books',
      component: SearchBooksView,
      meta:{ requireAuthentication: false }
    },
    {
      path: '/books/:id',
      name: 'see_book',
      component: SeeBookView,
      meta:{ requireAuthentication: false }
    },
    {
      path: '/add_book/:id?',
      name: 'add_book',
      component: BookFormView,
      meta:{ requireAuthentication: true, permisson: 'Libros' }
    },
    {
      path: '/add_loan/:id?',
      name: 'add_loan',
      component: LoanFormView,
      meta:{ requireAuthentication: true, permisson: 'Préstamos' }
    },
    {
      path: '/search_loans',
      name: 'search_loans',
      component: SearchLoanView,
      meta:{ requireAuthentication: true, permisson: 'Préstamos' }
    },
    {
      path: '/see_loan/:id',
      name: 'see_loan',
      component: SeeLoanView,
      meta:{ requireAuthentication: true, permisson: 'Préstamos' }
    },
    {
      path: '/add_reader/:id?',
      name: 'add_reader',
      meta:{ requireAuthentication: true, permisson: 'Lectores' }
    },
    {
      path: '/search_readers',
      name: 'search_readers',
      meta:{ requireAuthentication: true, permisson: 'Lectores' }
    },
    {
      path: '/see_reader/:id',
      name: 'see_reader',
      component: SeeReaderView,
      meta:{ requireAuthentication: true, permisson: 'Lectores' }
    },
  ]
})

export default router
