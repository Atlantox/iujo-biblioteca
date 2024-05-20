<script setup>
import { onMounted } from 'vue'

import useSessionStore from '@/stores/session.js'
import DataTableInitializer from '@/utils/DataTableInitializer';
import OnAppearAnimation from '@/utils/ElegantDisplayer.js'

const sessionStore = new useSessionStore()
const props = defineProps({
    books: Array
})

onMounted(() => {
    const dtInitializer = new DataTableInitializer()
    OnAppearAnimation('normal-dt', 'hide-up')  

})

</script>

<template>
    <table class="col-12 shadowed h6 hide-up" id="normal-dt">
        <thead>
        <tr class="text-white">
            <th class="text-center lb-bg-terciary border-1 border-white">Título</th>
            <th class="text-center lb-bg-terciary border-1 border-white">Autor</th>
            <th class="text-center lb-bg-terciary border-1 border-white">Editorial</th>
            <th class="text-center lb-bg-terciary border-1 border-white">Estado</th>
            <th class="text-center lb-bg-terciary border-1 border-white">Páginas</th>
            <th v-if="sessionStore.token !== ''" class="text-center lb-bg-terciary border-1 border-white">Cota</th>
            <th v-if="sessionStore.token !== ''" class="text-center lb-bg-terciary border-1 border-white">Estante</th>
            <th class="text-center lb-bg-terciary border-1 border-white">Acción</th>
        </tr>
        </thead>
        <tbody class="fs-5">
        <tr 
        v-for="book in props.books"
        :key="book.id">
            <td>{{ book.title }}</td>
            <td>{{ book.author }}</td>
            <td>{{ book.editorial }}</td>
            <td class="text-center">{{ book.state }}</td>
            <td class="text-center">{{ book.pages }}</td>

            <td v-if="sessionStore.token !== ''" >{{ book.call_number }}</td>
            <td v-if="sessionStore.token !== ''" >{{ book.shelf }}</td>
            <td>
                <div class="row m-0 p-0 text-center justify-content-center">
                    <div class="row m-0 p-1 col-3 fs-3">
                        <div class="w-100 shake-on-hover text-center m-0 p-0">
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
</template>

<style scoped>
tr, td{
  border: 1px rgba(66, 66, 66, 0.445) solid
}

a{
    color:black;
}

table, thead, tbody, th, td, tr{
    transition:1s;
}
</style>