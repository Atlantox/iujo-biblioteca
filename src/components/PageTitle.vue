<script setup>
import { onMounted } from 'vue'
import OnAppearAnimation from '@/utils/ElegantDisplayer.js'
const props = defineProps({
    'title': String
})


onMounted(() => {
    OnAppearAnimation('title-page', 'hide-up')  

})

</script>

<template>
    <div class="row m-0 p-0 justify-content-center my-4">
        <div class="col-11 col-lg-6 m-0 p-0 my-4">
            <h1 class="w-100 text-center hide-up fw-bold m-0 rounded-pill lb-bg-terciary-l text-white shadowed-l" id="title-page">
                {{ props.title }}
            </h1>
        </div>
    </div>
</template>

<style scoped>
h1{
    font-size:60px;
    transition:0.8s;
}
</style>
