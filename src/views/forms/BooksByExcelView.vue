<script setup>
import PageTitle from '@/components/PageTitle.vue'

import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import BooksByExcelForm from '@/components/forms/BooksByExcelForm.vue'

</script>

<template>
    <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
        <BackButtonGadget :back_to="'dashboard'"/>
    </div>

    <PageTitle :title="'Agregar libros por excel'"/>

    <BooksByExcelForm />
</template>
