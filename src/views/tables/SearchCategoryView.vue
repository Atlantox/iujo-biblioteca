<script setup>
import { onMounted } from 'vue'

import useCategoryStore from '@/stores/categories.js'

import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'

import CategoryTable from '@/components/tables/CategoryTable.vue'
import PageTitleView from '@/components/PageTitle.vue';

const categoryStore = useCategoryStore()
const categories = categoryStore.categories

onMounted(async ()  => {
  await categoryStore.FetchCategories()
})

</script>

<template>
  <div class="row w-100 m-0 p-0 px-5">
    <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
        <BackButtonGadget :back_to="'dashboard'"/>
    </div>
    <PageTitleView
    :title="'Listado de categorías'"
    />
    <div class="row m-0 p-0 col-12 py-4 shadowed-l rounded lb-bg-terciary-ul">
      <template
      v-if="categories.value === undefined">
        <LoadingGadget/>
      </template>
      <template v-else>
        <div class="w-100 m-0 p-3 px-5 table-container">
          <CategoryTable
            :categories="categories.value"/>
        </div>
      </template>
    </div>
  </div>
</template>