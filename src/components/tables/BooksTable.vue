<script setup>
import { onMounted } from 'vue'
import DataTableInitializer from '@/utils/DataTableInitializer';

const props = defineProps({
    books: Array
})

onMounted(() => {
  const dtInitializer = new DataTableInitializer()
})

</script>

<template>
    <div class="row m-0 p-0 col-12">
        <!-- <h1 v-if="props.books.length > 0">Mostrando libros</h1> -->
        <table class="col-12 shadowed h6" id="normal-dt">
            <thead>
            <tr class="text-white">
                <th class="text-center lb-bg-terciary border-1 border-white">Título</th>
                <th class="text-center lb-bg-terciary border-1 border-white">Autor</th>
                <th class="text-center lb-bg-terciary border-1 border-white">Páginas</th>
                <th class="text-center lb-bg-terciary border-1 border-white">Acción</th>
            </tr>
            </thead>
            <tbody>
            <tr 
            v-for="book in props.books"
            :key="book.id">
                <td>{{ book.title }}</td>
                <td>{{ book.author }}</td>
                <td>{{ book.pageNumber }}</td>
                <td>
                    <div class="row m-0 p-0 text-center justify-content-center">
                        <div class="row m-0 p-1 col-3 fs-3">
                            <div class="w-100 lb-bg-primary rounded shadowed-l shake-on-hover text-center m-0 p-0">
                                <router-link :to="{name:'see_book', params: {id: book.id}}">
                                    <i class="text-black bi bi-eye text-center m-0 p-0"></i>
                                </router-link>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<style scoped>
tr, td{
  border: 1px rgba(66, 66, 66, 0.445) solid
}
</style>