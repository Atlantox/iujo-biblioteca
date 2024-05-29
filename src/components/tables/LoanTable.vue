<script setup>
import { onMounted } from 'vue'
import DataTableInitializer from '@/utils/DataTableInitializer';

const props = defineProps({
    loans: Array
})

onMounted(() => {
  const dtInitializer = new DataTableInitializer()
})

</script>

<template>
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
            <td class="border-1">({{ loan.cedula }}) {{ loan.fullname }}</td>
            <td class="border-1">{{ loan.title }}</td>
            <td class="border-1">{{ loan.deliver_date }}</td>
            <td class="border-1">{{ loan.return_date }}</td>
            <td class="border-1">{{ loan.observation }}</td>
            <td class="border-1">
                <div class="row m-0 p-0 text-center justify-content-center">
                    <div class="row m-0 p-1 col-3 fs-3">
                        <div class="w-100 lb-bg-primary rounded shadowed-l shake-on-hover text-center m-0 p-0">
                            <router-link :to="{name:'see_loan', params: {id: loan.loan_id}}">
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