<script setup>
const currentYear = new Date()
import { useRouter } from 'vue-router'
const router = useRouter()

const RedirectToLogin = (() => {
    router.push({name: 'admin_login'})
})
</script>

<template>
    <!-- Designed by Atlantox https://atlantox.pythonanywhere.com/ -->
    <div class="row m-0 p-0 justify-content-center my-4 mb-0">
        <div class="col-12 mt-5 p-0 text-center py-2">
            © Copyright 
            <span @dblclick="RedirectToLogin">{{ currentYear.getFullYear() }}</span> <a href="https://www.iujobarquisimeto.edu.ve/" target="_blank">IUJO Extensión Barquisimeto.</a> All Rights Reserved
        </div>
    </div>
</template>

<style scoped>
</style>
