<script setup>
import { ref, onMounted } from 'vue'

import useBookStore from '@/stores/books.js'
import useSessionStore from '@/stores/session'
import useCategoryStore from '@/stores/categories'

import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import BooksTable from '@/components/tables/BooksTable.vue'
import PageTitleView from '@/components/PageTitle.vue'

import Select2Initializer from '@/utils/Select2Initializer'

const bookStore = useBookStore()
const sessionStore = useSessionStore()
const categoryStore = useCategoryStore()

const targetFetched = ref(false)
const books = bookStore.books
const categories = categoryStore.categories

const categoryFilter = ref('')

const ApplyCategoryFilter = (async () => {
  targetFetched.value = false
  await bookStore.FetchBooksByCategory(categoryFilter.value)

  if (bookStore.errorMessage !== '')
    sessionStore.ShowModal('Error', bookStore.errorMessage, 'error')
  else
    targetFetched.value = true
})

onMounted(async ()  => {
  const select2Initializer = new Select2Initializer()

  $('#category').on('select2:select', function (e) {
    categoryFilter.value = e.target.value
    ApplyCategoryFilter()
  });

  await bookStore.FetchBooks()  
  if (bookStore.errorMessage !== '')
    sessionStore.ShowModal('Error', bookStore.errorMessage, 'error')
  else
    targetFetched.value = true

  await categoryStore.FetchCategories()  
  if (categoryStore.errorMessage !== '')
    sessionStore.ShowModal('Error', categoryStore.errorMessage, 'error')
})

</script>

<template>
  <div class="row w-100 m-0 p-0 px-5">
    <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
        <BackButtonGadget :back_to="sessionStore.authenticated ? 'dashboard' : 'home'"/>
    </div>
    <PageTitleView
    :title="'Nuestros libros'"
    />
    <div class="row m-0 p-0 col-12 shadowed-l rounded lb-bg-terciary-ul">
      <div class="row w-100 m-0 p-0 fs-5 p-3">
        <h3 class="w-100">
          Filtrar por...
        </h3>
        <div class="col-6 col-lg-3 fs-6">
          Categoría: 
          <select class="select2 fs-6" id="category">
            <option value="">&nbsp;</option>
            <option
            v-for="category in categories.value"
            :key="category.id"
            :value="category.id"
            >
            {{ category.name }}
          </option>
          </select>
        </div>
      </div>
      <template
      v-if="targetFetched === false">
        <LoadingGadget/>
      </template>
      <template v-else>
        <div class="w-100 m-0 p-3 px-2 px-lg-5 table-container" id="table-container">
          <BooksTable
            :books="books"/>
        </div>
      </template>
    </div>
  </div>
</template>