<script setup>
import { onMounted } from 'vue'

import useUtilsStore from '@/stores/utils';

import OnAppearAnimation from '@/utils/ElegantDisplayer';

const utilsStore = useUtilsStore()

const props = defineProps({
    loans: Array
})

onMounted(() => {
  utilsStore.InitializeDatatables()
  OnAppearAnimation('hide-up')
})

</script>

<template>
    <div class="w-100 m-0 p-0 hide-up animated-1">
        <table class="w-100 h6 m-0" id="normal-dt">
            <thead>
            <tr class="text-white">
                <th class="text-center lb-bg-terciary border-1 border-white fs-4">Lector</th>
                <th class="text-center lb-bg-terciary border-1 border-white fs-4">Libro</th>
                <th class="text-center lb-bg-terciary border-1 border-white fs-4">Fecha de entrega</th>
                <th class="text-center lb-bg-terciary border-1 border-white fs-4">Fecha de devolución</th>
                <th class="text-center lb-bg-terciary border-1 border-white fs-4">Observación</th>
                <th class="text-center lb-bg-terciary border-1 border-white fs-4">Acción</th>
            </tr>
            </thead>
            <tbody>
            <tr 
            v-for="loan in props.loans"
            :key="loan.id">
                <td class="border-1"><strong>({{ loan.cedula }})</strong> {{ loan.fullname }}</td>
                <td class="border-1">{{ loan.title }}</td>
                <td class="border-1 text-center">{{ new Date(loan.deliver_date).toLocaleDateString() }}</td>
                <td class="border-1 text-center">{{ loan.return_date === null ? 'N/A' : new Date(loan.return_date).toLocaleDateString() }}</td>
                <td class="border-1">{{ loan.observation }}</td>
                <td class="border-1">
                    <div class="row m-0 p-0 text-center justify-content-center">
                        <div class="row col-12 m-0 p-1 col-3 fs-2">
                            <div class="w-100 hover-bigger text-center m-0 p-0">
                                <router-link :to="{name:'see_book', params: {id: loan.loan_id}}">
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