<script setup>
import { ref, inject } from 'vue'
import Select2Initializer from '@/utils/Select2Initializer'
import FormValidator from '@/utils/FormValidator'
import PageTitleView from '../PageTitle.vue'

const swal = inject('$swal')

const formErrors = ref([])

const user = ref('')
const password = ref('')

const ValidateForm = ((e) => {
    const myForm = e.srcElement
    const validator = new FormValidator()
        // General validations
        const bookLengthConfig = {
        'username': {'min': 6, 'max': 25},
        'password': {'min': 10, 'max': 25},
    }    
    
})
</script>

<template>
    <div class="row m-0 p-0 justify-content-center">
        <form class="col-12 col-lg-9 row m-0 p-2 fs-4 myForm shadowed-n rounded lb-bg-terciary-l" @submit.prevent="ValidateForm">
            <PageTitleView :title="'Login administrativo'"/>
            
            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-10 col-lg-3">
                    <label class="text-center text-lg-end" for="username">Usuario</label>
                </div>
                <div class="row m-0 p-0 col-10 col-lg-7">
                    <div class="row col-12 col-lg-7">
                        <input type="password" class="myInput" maxlength="25" minlength="6" id="username" autofocus v-model="username">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-10 col-lg-3">
                    <label class="text-center text-lg-end" for="password">Contraseña</label>
                </div>
                <div class="row m-0 p-0 col-10 col-lg-7">
                    <div class="row col-12 col-lg-7">
                        <input type="password" class="myInput" maxlength="25" minlength="10" id="password" v-model="password">
                    </div>
                </div>
            </div>


            <div class="row m-0 p-0 justify-content-center my-2 mt-5">
                <div class="row m-0 p-0 col-12 justify-content-center">
                    <button class="col-2 myBtn terciary-btn shadowed-l h3">
                        Ingresar
                    </button>
                </div>
            </div>

            <div v-if="formErrors.length > 0" class="row m-0 p-0 justify-content-center my-2 mt-5">
                <ul class="row m-0 p-0 col-12 justify-content-center list-unstyled text-center text-danger">
                    <li 
                    v-for="error, index in formErrors"
                    :key="index"
                    >
                        {{ error.message }}
                    </li>  
                </ul>
            </div>
        
        </form>
    </div>
</template>

<style scoped>
textarea{
    padding:5px;
}

h1{
  font-size:50px !important;
}
</style>