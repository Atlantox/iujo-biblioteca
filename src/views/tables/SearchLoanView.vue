<script setup>
import { onMounted } from 'vue'

import useLoanStore from '@/stores/loans.js'
import useSessionStore from '@/stores/session.js'

import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'

import LoanTable from '@/components/tables/LoanTable.vue'
import PageTitleView from '@/components/PageTitle.vue';

import OnAppearAnimation from '@/utils/ElegantDisplayer.js'

const loanStore = useLoanStore()
const sessionStore = useSessionStore()
const loans = loanStore.loans

onMounted(async ()  => {
  await loanStore.FetchPendingLoans()
  
  if (loanStore.errorMessage !== '')
    sessionStore.ShowModal('Error', loanStore.errorMessage, 'error')
  else
    OnAppearAnimation('hide-up') 
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
    <div class="row m-0 p-0 col-12 py-4 shadowed-l rounded lb-bg-terciary-ul">
      <template
      v-if="loans.value === undefined">
        <LoadingGadget/>
      </template>
      <template v-else>
        <div class="w-100 m-0 p-3 px-5 table-container hide-up">
          <LoanTable
            :loans="loans.value"/>
        </div>
      </template>
    </div>
  </div>
</template>