<script setup>
import { onMounted } from 'vue'
import LoanForm from '@/components/forms/LoanForm.vue'

import useBookStore from '@/stores/books.js'
import useReaderStore from '@/stores/readers.js'

const bookStore = useBookStore()
const readerStore = useReaderStore()

const books = bookStore.books
const readers = readerStore.readers

onMounted(() => {
  bookStore.FetchActiveBooks()
  readerStore.FetchReaders()
})
</script>

<template>
  <LoanForm
  :books="books"
  :readers="readers"
  />
</template>

<style scoped>

</style>
