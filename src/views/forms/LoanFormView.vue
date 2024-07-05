<script setup>

import { onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'

import PageTitle from '@/components/PageTitle.vue'

import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'

import useBookStore from '@/stores/books'
import useReaderStore from '@/stores/readers'
import useLoanStore from '@/stores/loans'

import LoanForm from '@/components/forms/LoanForm.vue'

const route = useRoute()

const bookStore = useBookStore()
const readerStore = useReaderStore()
const loanStore = useLoanStore()

const readers = readerStore.readers
const books = bookStore.books

const targetLoan = ref([])
const fetchReady = ref(false)

onMounted( async () => {
  const recievedId = route.params.id

  if(recievedId !== undefined && recievedId !== ''){
    targetLoan.value = await loanStore.FetchLoanById(recievedId)
  }

  FetchData()
  fetchReady.value = true
})

const FetchData = ( async () => {
  await readerStore.FetchReaders()
  await bookStore.FetchBooksWithFilter({'state': 'En biblioteca'})
})

</script>

<template>
  <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
    <BackButtonGadget :back_to="route.params.id === undefined || route.params.id === '' ? 'dashboard' : 'loans'"/>
  </div>
  <PageTitle
    :title="(route.params.id === undefined || route.params.id === '' ? 'Registrar nuevo ' : 'Modificar ') + 'préstamo'"
  />
  <template v-if="fetchReady === false">
    <LoadingGadget />
  </template>
  <template v-else>    
    <LoanForm
    :books = "books"
    :readers = "readers"
    :targetLoan = "targetLoan"
    @fetchAgain = "FetchData"
    />
  </template>
</template>

<style scoped>

</style>
