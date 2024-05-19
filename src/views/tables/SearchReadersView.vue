<script setup>
import { onMounted } from 'vue'
import useReaderStore from '@/stores/readers.js'
import ReaderTable from '@/components/tables/ReaderTable.vue'
import PageTitleView from '@/components/PageTitleView.vue';

const readerStore = useReaderStore()
const readers = readerStore.readers


onMounted(()  => {
  readerStore.FetchReaders()
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
  <PageTitleView
  :title="'Listado de los lectores'"
  />
  <ReaderTable
  :readers="readers"
  />
</template>
