<script setup>
import { ref, onMounted, inject } from 'vue'
import { Modal } from 'bootstrap'
import useBookStore from '@/stores/books.js'

import BooksTable from '@/components/tables/BooksTable.vue'

const myModal = ref('')
const swal = inject('$swal')

const bookStore = useBookStore()
const books = bookStore.books

onMounted(()  => {
  bookStore.FetchActiveBooks()
})




/*
//myModal.value = new Modal('#exampleModalLong')
const ShowModal = (() => {
  swal.fire({
    title: 'Titulaso',
    icon:'warning'
  })
  //myModal.value.show()
})

const HideModal = (() => {
  myModal.value.hide()
})
*/
</script>

<template>
  <BooksTable
    v-if="books.value !== undefined"
    :books="books.value"/>

</template>
