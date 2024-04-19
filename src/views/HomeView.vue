<script setup>
import { ref, onMounted, inject } from 'vue'
import { Modal } from 'bootstrap'
import BooksTable from '@/components/BooksTable.vue'
import useBookStore from '@/stores/books.js'

const myModal = ref('')
const swal = inject('$swal')

const bookStore = useBookStore()
const books = bookStore.books

onMounted(()  => {
  bookStore.GetActiveBooks()
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
