<script setup>
import { onMounted } from 'vue'

import useUtilsStore from '@/stores/utils';
import useSessionStore from '@/stores/session.js'

import OnAppearAnimation from '@/utils/ElegantDisplayer';

const sessionStore = useSessionStore()
const utilsStore = useUtilsStore()

const props = defineProps({
    books: {type: Array, default: []}
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
                    <template v-if="sessionStore.authenticated === true">
                        <template v-if="sessionStore.userData.permissons.includes('Libros')">
                            <th class="text-center lb-bg-terciary border-1">Cota</th>
                            <th class="text-center lb-bg-terciary border-1">Estante</th>                        
                        </template>
                    </template>
                    <th class="text-center lb-bg-terciary border-1 px-4">Ver</th>
                </tr>
            </thead>
            <tbody class="fs-5">
                <tr 
                v-for="book in props.books"
                :key="book.id">
                    <td class="border-1">{{ book.title }}</td>
                    <td class="border-1">{{ book.author_names.length === 0 ? 'Desconocido' : book.author_names.join(', ') }}</td>
                    <td class="border-1">{{ book.editorial === null ? 'Desconocida' : book.editorial}}</td>
                    <td class="border-1">{{ book.category_names.join(', ') }}</td>
                    <td :class="'text-center border-1 fw-bold text-' + (book.state === 'En biblioteca' ? 'success' : 'danger') ">{{ book.state }}</td>
                    <template v-if="sessionStore.authenticated === true">
                        <template v-if="sessionStore.userData.permissons.includes('Libros')">
                            <td class="border-1">{{ book.call_number }}</td>
                            <td class="border-1 text-center">{{ book.shelf }}</td>
                        </template>
                    </template>
                    <td class="border-1 p-0">
                        <div class="row col-12 m-0 p-0 text-center justify-content-around">
                            <div class="row col-4 m-0 p-0 fs-3">
                                <div class="w-100 hover-bigger text-center m-0 p-0">
                                    <router-link :to="{name:'see_book', params: {id: book.id}}">
                                        <i class="text-black bi bi-eye text-center m-0 p-0"></i>
                                    </router-link>
                                </div>
                            </div>
                            <template v-if="sessionStore.authenticated === true">
                                <div class="row col-4 m-0 p-0 fs-3" v-if="sessionStore.userData.permissons.includes('Libros')">
                                    <div class="w-100 hover-bigger text-center m-0 p-0">
                                        <router-link :to="{name:'add_book', params: {id: book.id}}">
                                            <i class="text-black bi bi-pencil text-center m-0 p-0"></i>
                                        </router-link>
                                    </div>
                                </div>
                            </template>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>