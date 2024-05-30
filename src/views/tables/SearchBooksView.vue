<script setup>
import { onMounted } from 'vue'

import useBookStore from '@/stores/books.js'
import useSessionStore from '@/stores/session'

import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import BooksTable from '@/components/tables/BooksTable.vue'
import PageTitleView from '@/components/PageTitle.vue'

import OnAppearAnimation from '@/utils/ElegantDisplayer.js'

const bookStore = useBookStore()
const sessionStore = useSessionStore()
const books = bookStore.books

onMounted(async ()  => {
  await bookStore.FetchBooks()   
  
  if (bookStore.errorMessage !== '')
    sessionStore.ShowModal('Error', bookStore.errorMessage, 'error')
  else
  OnAppearAnimation('table-container', 'hide-up') 
})

</script>

<template>
  <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
      <BackButtonGadget :back_to="'dashboard'"/>
  </div>
  <PageTitleView
  :title="'Nuestros libros'"
  />
  <div class="row m-0 p-0 col-12 py-4 shadowed-l rounded lb-bg-terciary-ul">
    <template
    v-if="books.value === undefined">
      <LoadingGadget/>
    </template>
    <template v-else>
      <div class="w-100 m-0 p-3 px-2 px-lg-5 table-container hide-up" id="table-container">
        <BooksTable
          :books="books.value"/>
      </div>
    </template>
  </div>

</template>