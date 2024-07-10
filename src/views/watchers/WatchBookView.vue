<script setup>

import { onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'

import PageTitle from '@/components/PageTitle.vue'
import BookDetails from '@/components/detailers/BookDetails.vue'

import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'

import useBookStore from '@/stores/books'
import useSessionStore from '@/stores/session'

import OnAppearAnimation from '@/utils/ElegantDisplayer'

const route = useRoute()

const bookStore = useBookStore()
const sessionStore = useSessionStore()

const targetBook = ref({})
const fetchReady = ref(false)

onMounted( async () => {
  fetchReady.value = false
  const recievedId = route.params.id

  
  if(recievedId !== undefined && recievedId !== '')
    targetBook.value = await bookStore.FetchBookById(recievedId)
  else
    router.push('/')
  
  fetchReady.value = true
  OnAppearAnimation('hide-up')
})

</script>

<template>
  <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
    <BackButtonGadget :back_to="sessionStore.authenticated === true ? 'dashboard' : 'books'"/>
  </div>

  <PageTitle
    :title="targetBook.title"
  />

  <template v-if="fetchReady === false">
    <LoadingGadget />
  </template>
  <template v-else>    
    <BookDetails
    :targetBook="targetBook"
    />
  </template>
</template>

<style scoped>

</style>
