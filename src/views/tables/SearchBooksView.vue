<script setup>
import { ref, onMounted, inject } from 'vue'

import useBookStore from '@/stores/books.js'
import useSessionStore from '@/stores/session'

import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import BooksTable from '@/components/tables/BooksTable.vue'
import PageTitleView from '@/components/PageTitle.vue'

const bookStore = useBookStore()
const sessionStore = useSessionStore()
const books = bookStore.books

onMounted(async ()  => {
  await bookStore.FetchBooks()

  if (bookStore.errorMessage !== ''){
    sessionStore.ShowModal('Error', bookStore.errorMessage, 'error')
  }
})

</script>

<template>
  <PageTitleView
  :title="'Nuestros libros'"
  />
  <div class="row m-0 p-0 col-12 py-4 shadowed-l rounded lb-bg-terciary-dark">
    <template
    v-if="books.value === undefined">
      <LoadingGadget/>
    </template>
    <template v-else>
        <BooksTable
          :books="books.value"/>
    </template>
  </div>

</template>