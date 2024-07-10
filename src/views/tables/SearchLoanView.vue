<script setup>
import { onMounted } from 'vue'
import { useRoute } from 'vue-router'

import useLoanStore from '@/stores/loans.js'

import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import AddButtonGadget from '@/components/myGadgets/AddButtonGadget.vue'

import LoanTable from '@/components/tables/LoanTable.vue'
import PageTitleView from '@/components/PageTitle.vue';
import useSessionStore from '@/stores/session'


const loanStore = useLoanStore()
const sessionStore = useSessionStore()
const route = useRoute()
const loans = loanStore.loans

onMounted(async ()  => {
  const filter = route.params.filter

  if(['', undefined, 'pending'].includes(filter))
    await loanStore.FetchPendingLoans()
  else if(filter === 'returned')
    await loanStore.FetchReturnedLoans()
  else if(filter === 'active')
    await loanStore.FetchActiveLoans()
  else if(filter === 'inactive')
    await loanStore.FetchInactiveLoans()
  else
    await loanStore.FetchPendingLoans()
})

</script>

<template>
  <div class="row w-100 m-0 p-0 px-5">
    <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
        <BackButtonGadget :back_to="'dashboard'"/>
    </div>
    <PageTitleView
    :title="'Lista de préstamos'"
    />
    <div class="row m-0 p-0 col-12 py-4 shadowed-l rounded lb-bg-terciary-ul justify-content-center">
      <AddButtonGadget
      v-if = "sessionStore.userData.permissons.includes('Préstamos')"
      :url = "'add_loan'"
      :title = "'Registrar nuevo préstamo'"
      />
      <template
      v-if="loans.value === undefined">
        <LoadingGadget/>
      </template>
      <template v-else>
        <div class="w-100 m-0 p-3 px-5 table-container">
          <LoanTable
            :loans="loans.value"/>
        </div>
      </template>
    </div>
  </div>
</template>