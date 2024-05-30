<script setup>
import { onMounted } from 'vue'

import DataTableInitializer from '@/utils/DataTableInitializer';

const props = defineProps({
    categories: Array
})

onMounted(() => {
    const dtInitializer = new DataTableInitializer()  
})

</script>

<template>
    <table class="w-100 h6 m-0" id="normal-dt">
        <thead>
            <tr class="text-white fs-4">
                <th class="text-center lb-bg-terciary border-1">Nombre</th>
                <th class="text-center lb-bg-terciary border-1">Ver</th>
            </tr>
            </thead>
        <tbody class="fs-5">
            <tr 
            v-for="category in props.categories"
            :key="category.id">
                <td class="border-1 text-center">{{ category.name }}</td>
                <td class="border-1">
                    <div class="row m-0 p-0 text-center justify-content-center">
                        <div class="row col-12 m-0 p-1 col-3 fs-2">
                            <div class="w-100 shake-on-hover text-center m-0 p-0">
                                <router-link :to="{name:'see_book', params: {id: category.id}}">
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