<script setup>
import { onMounted } from 'vue'

import useUtilsStore from '@/stores/utils';
import useSessionStore from '@/stores/session.js'

import OnAppearAnimation from '@/utils/ElegantDisplayer';

const sessionStore = useSessionStore()
const utilsStore = useUtilsStore()

const props = defineProps({
    books: Object
})

onMounted(() => {
    OnAppearAnimation('hide-up') 
    utilsStore.InitializeDatatables()
})

</script>

<template>
    <div class="w-100 m-0 p-0 hide-up animated-1">
        <table class="w-100 h6 m-0" id="normal-dt">
            <thead>
                <tr class="text-white fs-4">
                    <th class="text-center lb-bg-terciary border-1">Título</th>
                    <th class="text-center lb-bg-terciary border-1">Autor</th>
                    <th class="text-center lb-bg-terciary border-1">Editorial</th>
                    <th class="text-center lb-bg-terciary border-1">Categorías</th>
                    <th class="text-center lb-bg-terciary border-1">Estado</th>
                    <th class="text-center lb-bg-terciary border-1">Páginas</th>
                    <template v-if="sessionStore.authenticated === true">
                        <template v-if="'Libros' in sessionStore.userData.permissons">
                            <th class="text-center lb-bg-terciary border-1">Cota</th>
                            <th class="text-center lb-bg-terciary border-1">Estante</th>                        
                        </template>
                    </template>
                    <th class="text-center lb-bg-terciary border-1">Ver</th>
                </tr>
            </thead>
            <tbody class="fs-5">
                <tr 
                v-for="book in props.books.value"
                :key="book.id">
                    <td class="border-1">{{ book.title }}</td>
                    <td class="border-1">{{ book.author === null ? 'Desconocido' : book.author }}</td>
                    <td class="border-1">{{ book.editorial === null ? 'Desconocida' : book.editorial}}</td>
                    <td class="border-1">{{ book.category_names.join(', ') }}</td>
                    <td class="text-center border-1">{{ book.state }}</td>
                    <td class="text-center border-1">{{ book.pages }}</td>
                    <template v-if="sessionStore.authenticated === true">
                        <template v-if="'Libros' in sessionStore.userData.permissons">
                            <td class="border-1">{{ book.call_number }}</td>
                            <td class="border-1">{{ book.shelf }}</td>
                        </template>
                    </template>
                    <td class="border-1">
                        <div class="row m-0 p-0 text-center justify-content-center">
                            <div class="row col-12 m-0 p-1 col-3 fs-2">
                                <div class="w-100 hover-bigger text-center m-0 p-0">
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