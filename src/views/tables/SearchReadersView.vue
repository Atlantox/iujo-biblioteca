<script setup>
import { onMounted } from 'vue'

import useReaderStore from '@/stores/readers.js'
import useSessionStore from '@/stores/session.js'

import ReaderTable from '@/components/tables/ReaderTable.vue'
import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import PageTitleView from '@/components/PageTitle.vue';

import OnAppearAnimation from '@/utils/ElegantDisplayer.js'

const readerStore = useReaderStore()
const sessionStore = useSessionStore()
const readers = readerStore.readers

onMounted(async ()  => {
  await readerStore.FetchReaders()
  OnAppearAnimation('table-container', 'hide-up') 

  if(readerStore.errorMessage !== '')
    sessionStore.ShowModal('Error', readerStore.errorMessage, 'error')
})

</script>

<template>
  <PageTitleView
  :title="'Listado de los lectores'"
  />
  <div class="row m-0 p-0 col-12 py-4 shadowed-l rounded lb-bg-terciary-ul">
    <template
    v-if="readers.value === undefined">
      <LoadingGadget/>
    </template>
    <template v-else>
      <div class="w-100 m-0 p-3 px-5 table-container hide-up" id="table-container">
        <ReaderTable
          :readers="readers.value"/>
      </div>
    </template>
  </div>
</template>
