<script setup>
import { ref, onMounted, inject } from 'vue'
import { Modal } from 'bootstrap'
import useBookStore from '@/stores/books.js'

import BooksTable from '@/components/BooksTable.vue'
import BookForm from '@/components/BookForm.vue'

const myModal = ref('')
const swal = inject('$swal')

const bookStore = useBookStore()
const books = bookStore.books

onMounted(()  => {
  bookStore.GetActiveBooks()
})

</script>

<template>

  <BookForm/>
</template>

<style scoped>

</style>
