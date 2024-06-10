<script setup>

import { onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'

import PageTitle from '@/components/PageTitle.vue'

import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'

import useBookStore from '@/stores/books'

import AuthorForm from '@/components/forms/AuthorForm.vue'

const route = useRoute()

const bookStore = useBookStore()

const targetAuthor = ref([])
const fetchReady = ref(false)

onMounted( async () => {
  fetchReady.value = false
  const recievedId = route.params.id

  console.log(route.params.id)
  if(recievedId !== undefined && recievedId !== ''){
    targetAuthor.value = await bookStore.FetchAuthorById(recievedId)
    console.log(targetAuthor)
  }

  fetchReady.value = true
})

</script>

<template>
  <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
    <BackButtonGadget :back_to="'dashboard'"/>
  </div>
  <PageTitle
    :title="(targetAuthor === false ? 'Modificar ' : 'Registrar nuevo ') + 'autor'"
  />
  <template v-if="fetchReady === false">
    <LoadingGadget />
  </template>
  <template v-else>    
    <AuthorForm
    :targetAuthor = "targetAuthor"
    />
  </template>
</template>

<style scoped>

</style>
