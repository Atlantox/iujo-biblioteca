<script setup>
import { onMounted } from 'vue'
import useLoanStore from '@/stores/loans.js'
import LoanTable from '@/components/tables/LoanTable.vue'

const loanStore = useLoanStore()
const loans = loanStore.loans


onMounted(()  => {
  loanStore.FetchLoans()
})


/*
//myModal.value = new Modal('#exampleModalLong')
const ShowModal = (() => {
  swal.fire({
    title: 'Titulaso',
    icon:'warning'
  })
  //myModal.value.show()
})

const HideModal = (() => {
  myModal.value.hide()
})
*/
</script>

<template>
  <LoanTable
  :loans="loans"
  />
</template>
