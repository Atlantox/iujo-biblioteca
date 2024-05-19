<script setup>
import { onMounted } from 'vue'
const props = defineProps({
    'title': String
})


onMounted(() => {
    const titleObserver = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            // If the element is visible
            if (entry.isIntersecting) {
            // Add the animation class
                var myTitle = document.getElementById('title-page');
                myTitle.classList.remove('hide');
                //brain.classList.add('brain-img');
            }
        });
    });
    
    const title_chainer = document.getElementById('title-page')
    titleObserver.observe(title_chainer);

})

</script>

<template>
    <div class="row m-0 p-0 justify-content-center my-4">
        <div class="col-11 col-lg-6 m-0 p-0 my-4">
            <h1 class="w-100 text-center hide fw-bold m-0 rounded-pill lb-bg-terciary-l text-white shadowed-l" id="title-page">
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

.hide{
    opacity:0;
    transform:translateY(-50px)
}
</style>
