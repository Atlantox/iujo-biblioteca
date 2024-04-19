<script setup>
import { RouterLink } from 'vue-router'
import { useRoute } from 'vue-router'
const route = useRoute()

</script>

<template>
    <div>
        <router-link :to="{name:'home'}">
            Volver
        </router-link>
    </div>
    <h1>Libro {{ route.params.bookId }}</h1>
</template>

<style scoped>

</style>