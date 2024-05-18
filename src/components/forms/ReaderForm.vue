<script setup>
import { ref, onMounted } from 'vue'
import Select2Initializer from '@/utils/Select2Initializer'
import FormValidator from '@/utils/FormValidator'

const formErrors = ref([])

const readerCedula = ref('')
const readerNames = ref('')
const readerSurnames = ref('')
const readerPhone = ref('')
const readerGender = ref('')
const readerIsTeacher = ref('')

onMounted(() => {
    const edit = false
    const s2Initializer = new Select2Initializer()
})

const ValidateForm = ((e) => {
    const myForm = e.srcElement
    const validator = new FormValidator()    
})
</script>

<template>
    <div class="row m-0 p-0">
        <form action="" class="col-12 row m-0 p-2 fs-4 myForm shadowed-l rounded lb-bg-terciary-dark" @submit.prevent="ValidateForm">
            <div class="row col-12 m-0 p-0 justify-content-center my-4">
                <h1 class="fw-bold text-center col-11 col-lg-6 m-0 rounded-pill lb-bg-terciary-l text-white shadowed-l">
                    Nuevo lector
                </h1>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="cedula">Cédula</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-3">
                        <input type="text" class="myInput" maxlength="11" id="cedula" autofocus v-model="readerCedula">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="names">Nombres</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-7">
                        <input type="text" class="myInput" maxlength="60" id="names" v-model="readerNames">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="surnames">Apellidos</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-7">
                        <input type="text" class="myInput" maxlength="60" id="surnames" v-model="readerSurnames">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="phone">Teléfono</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-4">
                        <input type="text" class="myInput" maxlength="11" id="phone" v-model="readerPhone">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-3">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end">Género</label>
                </div>
                <div class="row m-0 p-0 col-6 fs-5 justify-content-center">
                    <div class="row col-12">
                        <div class="row col-12 col-lg-3 m-0 p-0 my-1">
                            <label class="col-6 text-end" for="male">M</label>
                            <input class="col-1" type="radio" id="male" name="gender" value="M" v-model="readerGender">
                        </div>
                        <div class="row col-12 col-lg-3  m-0 p-0 my-1">
                            <label class="col-6 text-end" for="female">F</label>
                            <input class="col-1" type="radio" id="female" name="gender" value="F" v-model="readerGender">
                        </div>
                    </div>
                </div>
            </div>


            <div class="row m-0 p-0 justify-content-center my-3">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end">Es un docente</label>
                </div>
                <div class="row m-0 p-0 col-6 fs-5 justify-content-center">
                    <div class="row col-12">
                        <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                            <input class="col-1" type="checkbox" id="isTeacher" name="isTeacher" value="1" v-model="readerIsTeacher">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2 mt-5">
                <div class="row m-0 p-0 col-12 justify-content-center">
                    <button class="col-2 myBtn terciary-btn shadowed-l h3">
                        Enviar
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