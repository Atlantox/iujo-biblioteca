<script setup>
import { onMounted } from 'vue'

import useBookStore from '@/stores/books.js'
import useSessionStore from '@/stores/session'

import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import AddButtonGadget from '@/components/myGadgets/AddButtonGadget.vue'

import EditorialTable from '@/components/tables/EditorialTable.vue'
import PageTitleView from '@/components/PageTitle.vue';

const bookStore = useBookStore()
const sessionStore = useSessionStore()
const editorials = bookStore.editorials

onMounted(async ()  => {
  await bookStore.FetchEditorials()
})

</script>

<template>
  <div class="row w-100 m-0 p-0 px-5">
    <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
        <BackButtonGadget :back_to="'dashboard'"/>
    </div>
    <PageTitleView
    :title="'Listado de editoriales'"
    />
    <div class="row m-0 p-0 col-12 py-4 shadowed-l rounded lb-bg-terciary-ul justify-content-center">
      <AddButtonGadget
      v-if = "sessionStore.userData.permissons.includes('Editoriales')"
      :url = "'add_editorial'"
      :title = "'Registrar nueva editorial'"
      />
      <template
      v-if="editorials.value === undefined">
        <LoadingGadget/>
      </template>
      <template v-else>
        <div class="w-100 m-0 p-3 px-5 table-container">
          <EditorialTable
            :editorials="editorials.value"/>
        </div>
      </template>
    </div>
  </div>
</template>