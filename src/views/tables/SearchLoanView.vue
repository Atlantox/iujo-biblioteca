<script setup>
import { ref } from 'vue'
import { onMounted } from 'vue'
import useLoanStore from '@/stores/loans.js'
import useSessionStore from '@/stores/session.js'
import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import LoanTable from '@/components/tables/LoanTable.vue'
import PageTitleView from '@/components/PageTitle.vue';

import OnAppearAnimation from '@/utils/ElegantDisplayer.js'

const loanStore = useLoanStore()
const sessionStore = useSessionStore()
const loans = loanStore.loans


onMounted(async ()  => {
  await loanStore.FetchPendingLoans()
  OnAppearAnimation('table-container', 'hide-up') 
  
  if (loanStore.errorMessage !== '')
    sessionStore.ShowModal('Error', loanStore.errorMessage, 'error')
})

</script>

<template>
  <PageTitleView
  :title="'Lista de préstamos'"
  />
  <div class="row m-0 p-0 col-12 py-4 shadowed-l rounded lb-bg-terciary-ul">
    <template
    v-if="loans.value === undefined">
      <LoadingGadget/>
    </template>
    <template v-else>
      <div class="w-100 m-0 p-3 px-5 table-container hide-up" id="table-container">
        <LoanTable
          :loans="loans.value"/>
      </div>
    </template>
  </div>
</template>
