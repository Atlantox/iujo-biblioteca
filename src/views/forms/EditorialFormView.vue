<script setup>

import { onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'

import PageTitle from '@/components/PageTitle.vue'

import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'

import useBookStore from '@/stores/books'

import EditorialForm from '@/components/forms/EditorialForm.vue'

const route = useRoute()

const bookStore = useBookStore()

const targetEditorial = ref([])
const fetchReady = ref(false)

onMounted( async () => {
  fetchReady.value = false
  const recievedId = route.params.id

  if(recievedId !== undefined && recievedId !== ''){
    targetEditorial.value = await bookStore.FetchEditorialById(recievedId)
  }

  fetchReady.value = true
})

</script>

<template>
  <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
    <BackButtonGadget :back_to="route.params.id === undefined || route.params.id === '' ? 'dashboard' : 'editorials'"/>
  </div>
  <PageTitle
    :title="(route.params.id === undefined || route.params.id === '' ? 'Registrar nueva ' : 'Modificar ') + 'editorial'"
  />
  <template v-if="fetchReady === false">
    <LoadingGadget />
  </template>
  <template v-else>    
    <EditorialForm
    :targetEditorial = "targetEditorial"
    />
  </template>
</template>