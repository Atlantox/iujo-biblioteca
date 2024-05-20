import { createRouter, createWebHistory } from 'vue-router'

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
      component: HomeView
    },
    {
      path: '/books',
      name: 'search_books',
      component: SearchBooksView
    },
    {
      path: '/books/:id',
      name: 'see_book',
      component: SeeBookView
    },
    {
      path: '/add_book/:id?',
      name: 'add_book',
      component: BookFormView
    },
    {
      path: '/add_loan/:id?',
      name: 'add_loan',
      component: LoanFormView
    },
    {
      path: '/search_loans',
      name: 'search_loans',
      component: SearchLoanView
    },
    {
      path: '/see_loan/:id',
      name: 'see_loan',
      component: SeeLoanView
    },
    {
      path: '/add_reader/:id?',
      name: 'add_reader',
      component: ReaderFormView
    },
    {
      path: '/search_readers',
      name: 'search_readers',
      component: SearchReadersView
    },
    {
      path: '/see_reader/:id',
      name: 'see_reader',
      component: SeeReaderView
    },
  ]
})

export default router
