<script setup>
import { ref } from 'vue'
import OnAppearAnimation from '@/utils/ElegantDisplayer';
import { onMounted } from 'vue';
import { useRoute } from 'vue-router'

import useBookStore from '@/stores/books';

const labelStyle = 'fw-bold text-end p-2'

const bookStore = useBookStore()
const route = useRoute()

const emit = defineEmits(['changeBook'])

const sameAuthorBooks = ref([])
const sameCategoryBooks = ref([])

const props = defineProps({
    'targetBook': {type: Object, default: {}}
})

const ChangeBook = ((bookId) => {
  emit('changeBook', bookId)
})

onMounted(async () => {
  OnAppearAnimation('hide-up')
  sameAuthorBooks.value = await bookStore.GetBooksOfAuthor(props.targetBook.author_id, route.params.id)
  sameCategoryBooks.value = await bookStore.GetBooksOfCategories(props.targetBook.category_ids, route.params.id)
})

</script>

<template>
    <div class="hide-up animated-1 row w-100 m-0 p-0 justify-content-center">
        <div class="row m-0 p-0 col-8 col-lg-10 shadowed-l rounded lb-bg-terciary-ul justify-content-around">
            <div class="row m-0 p-0 col-12 col-lg-4 p-3 ">
              <div class="row m-0 p-0 col-12 h3">
                <table>
                  <tr>
                    <td :class="labelStyle">Estado:</td>
                    <td :class="'fw-bold text-' + (props.targetBook.state === 'En biblioteca' ? 'success' : 'danger') ">{{ props.targetBook.state }}</td>
                  </tr>
                  <tr>
                    <td :class="labelStyle">Autor:</td>
                    <td>{{ props.targetBook.author }}</td>
                  </tr>
                </table>
              </div>
            </div>
      
            <div class="row m-0 p-0 col-12 col-lg-4 p-3">
              <div class="row m-0 p-0 col-12 h3">
                <table>
                  <tr>
                    <td :class="labelStyle">Editorial:</td>
                    <td>{{ props.targetBook.editorial }}</td>
                  </tr>
                  <tr>
                    <td :class="labelStyle">Páginas:</td>
                    <td>{{ props.targetBook.pages }}</td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="row m-0 p-0 col-12 p-3">
              <div class="row m-0 p-0 my-3  col-12 h3 text-center justify-content-center">
                  <h3 class="fw-bold col-12 m-0">
                    Categorías
                  </h3>
                  <p class="fst-italic col-11 col-lg-8">
                    {{ props.targetBook.category_names.join(', ') }}
                  </p>
              </div>

              <div v-if="props.targetBook.description !== ''" class="row m-0 p-0 my-3 col-12 h3 text-center justify-content-center">
                  <h3 class="fw-bold m-0">
                    Descripción:
                  </h3>
                  <p class="fst-italic col-11 col-lg-8">
                    « {{ props.targetBook.description }} »
                  </p>
              </div>
            </div>

          </div>

          <div class="row m-0 p-0 col-12 justify-content-around mt-5">
            <div class="row m-0 p-0 col-12 col-lg-5 p-3 shadowed-l rounded lb-bg-terciary-ul ">
              <h4 class="text-center w-100">
                Otros libros de <strong>{{ props.targetBook.author }}</strong>
              </h4>
              <a
              v-for="book in sameAuthorBooks"
              :key="book.id"
              class="col-12 col-lg-6 p-2 text-center text-black hover-spacing hover-bold fs-4" 
              @click="ChangeBook(book.id)">
                {{ book.title }}
              </a>             
            </div>

            <div class="row m-0 p-0 col-12 col-lg-5 p-3 shadowed-l rounded lb-bg-terciary-ul ">
              <h4 class="text-center w-100">
                Libros de categorías relacionadas
              </h4>
              <a
              v-for="book in sameCategoryBooks"
              :key="book.id"
              class="col-12 col-lg-6 p-2 text-center text-black hover-spacing hover-bold fs-4" 
              @click="ChangeBook(book.id)">
                {{ book.title }}
              </a>   
            </div>
          </div>
    </div>

</template>

<style scoped>

</style>