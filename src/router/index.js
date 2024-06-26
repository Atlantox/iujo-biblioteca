import { createRouter, createWebHistory } from 'vue-router'

import useSessionStore from '@/stores/session.js'

import HomeView from '../views/HomeView.vue'
import DashboardView from '../views/DashboardView.vue'

import LoginFormView from '../views/forms/LoginFormView.vue'
import BookFormView from '../views/forms/BookFormView.vue'
import LoanFormView from '../views/forms/LoanFormView.vue'
import ReaderFormView from '../views/forms/ReaderFormView.vue'
import EditorialFormView from '../views/forms/EditorialFormView.vue'
import AuthorFormView from '@/views/forms/AuthorFormView.vue'
import UserFormView from '@/views/forms/UserFormView.vue'

import SearchBooksView from '../views/tables/SearchBooksView.vue'
import SearchLoanView from '../views/tables/SearchLoanView.vue'
import SearchReadersView from '../views/tables/SearchReadersView.vue'
import SearchCategoryView from '@/views/tables/SearchCategoryView.vue'
import SearchAuthorsView from '@/views/tables/SearchAuthorsView.vue'
import SearchEditorialsView from '@/views/tables/SearchEditorialsView.vue'
import SearchUsersView from '@/views/tables/SearchUsersView.vue'

import SeeBookView from '../views/SeeBookView.vue'
import SeeLoanView from '../views/SeeLoanView.vue'
import SeeReaderView from '../views/SeeReaderView.vue'
import SeeUserView from '../views/SeeUserView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/admin_login',
      name: 'admin_login',
      component: LoginFormView,
      meta:{ requireNotAuth: true }
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: DashboardView,
      meta:{ requireAuth: true }
    },

    // BOOKS
    {
      path: '/search_books',
      name: 'books',
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
      component: BookFormView,
      meta:{ requireAuth: true, bookPermisson: true }
    },

    // EDITORIALS
    {
      path: '/add_editorial/:id?',
      name: 'add_editorial',
      component: EditorialFormView
    },
    {
      path: '/search_editorials',
      name: 'editorials',
      component: SearchEditorialsView
    },

    // AUTHORS
    {
      path: '/add_author/:id?',
      name: 'add_author',
      component: AuthorFormView
    },
    {
      path: '/search_authors',
      name: 'authors',
      component: SearchAuthorsView
    },

    // CATEGORIES
    {
      path: '/search_categories',
      name: 'categories',
      component: SearchCategoryView,
      meta:{ requireAuth: true, categoryPermisson: true }
    },
    
    // LOANS
    {
      path: '/add_loan/:id?',
      name: 'add_loan',
      component: LoanFormView,
      meta:{ requireAuth: true, loanPermisson: true }
    },
    {
      path: '/search_loans',
      name: 'loans',
      component: SearchLoanView,
      meta:{ requireAuth: true, loanPermisson: true }
    },
    {
      path: '/see_loan/:id',
      name: 'see_loan',
      component: SeeLoanView,
      meta:{ requireAuth: true, loanPermisson: true }
    },

    // READERS
    {
      path: '/add_reader/:id?',
      name: 'add_reader',
      component: ReaderFormView,
      meta:{ requireAuth: true, readerPermisson: true }
    },
    {
      path: '/search_readers',
      name: 'readers',
      component: SearchReadersView,
      meta:{ requireAuth: true, readerPermisson: true }
    },
    {
      path: '/see_reader/:id',
      name: 'see_reader',
      component: SeeReaderView,
      meta:{ requireAuth: true, readerPermisson: true }
    },

    // USERS
    {
      path: '/add_user/:id?',
      name: 'add_user',
      component: UserFormView,
      meta:{ requireAuth: true, editorPermisson: true }
    },
    {
      path: '/search_users',
      name: 'users',
      component: SearchUsersView,
      meta:{ requireAuth: true, editorPermisson: true }
    },
    {
      path: '/see_user/:id',
      name: 'see_user',
      component: SeeUserView,
      meta:{ requireAuth: true, editorPermisson: true }
    },
  ]
})

router.beforeEach((to, from, next) => {
  
  const sessionStore = useSessionStore()
  var routeOk = true

  if(to.meta.requireAuth){
    if(!sessionStore.authenticated)
      routeOk = false
    else{
      if(to.meta.bookPermisson && !(sessionStore.userData.permissons.includes('Libros'))){
        routeOk = false
      }

      if(to.meta.loanPermisson && !(sessionStore.userData.permissons.includes('Préstamos'))){
        routeOk = false
      }

      if(to.meta.readerPermisson && !(sessionStore.userData.permissons.includes('Lectores'))){
        routeOk = false
      }

      if(to.meta.categoryPermisson && !(sessionStore.userData.permissons.includes('Categorías'))){
        routeOk = false
      }

      if(to.meta.editorPermisson && !(sessionStore.userData.permissons.includes('Editor'))){
        routeOk = false
      }
    }
  }
  else{
    if(sessionStore.authenticated){
      if(to.meta.requireNotAuth)
        routeOk = false
    }
  }

  if(routeOk === true)
    next()
  else
    next('/')

})

export default router
