<script setup>
import { ref, onMounted, inject } from 'vue'
import Select2Initializer from '@/utils/Select2Initializer'
import FormValidator from '@/utils/FormValidator'
import { Modal } from 'bootstrap'

const myModal = ref('')
const swal = inject('$swal')

const formErrors = ref([])
const categories = ref([{id:1, name:'Ficción'}, {id:2, name:'Acción'}, {id:3, name:'Fantasía'}])
const states = ref([{id:1, name:'En biblioteca'}, {id:2, name:'Extraviado'}, {id:3, name:'Prestado'}])

const bookTitle = ref('')
const bookCallNumber = ref('')
const bookAuthor = ref('')
const bookEditorial = ref('')
const bookPages = ref('')
const bookCategories = ref([])
const bookDescription = ref('')
const bookState = ref('')

onMounted(() => {
    const edit = false
    const s2Initializer = new Select2Initializer()

    if (edit === false) bookState.value = '1'
})

const ValidateForm = ((e) => {
    const myForm = e.srcElement
    const validator = new FormValidator()
        // General validations
        const bookLengthConfig = {
        'title': {'max': 50, 'min': 4},
        'title': {'max': 50, 'min': 4}, 
        'description': {'max': 1000, 'min': 4}
    }

    
    
})
</script>

<template>
    <div class="row m-0 p-0">
        <form class="col-12 row m-0 p-2 fs-4 myForm shadowed-l rounded lb-bg-terciary-dark" @submit.prevent="ValidateForm">
            <div class="row col-12 m-0 p-0 justify-content-center my-4">
                <h1 class="fw-bold text-center col-6 m-0 rounded-pill lb-bg-terciary-l text-white shadowed-l">
                    Nuevo libro
                </h1>
            </div>
            
            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="title">Título</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-10">
                        <input type="text" class="myInput" maxlength="150" id="title" autofocus v-model="bookTitle">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="call_number">Cota</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-3">
                        <input type="text" class="myInput" maxlength="8" id="call_number" v-model="bookCallNumber">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="author">Autor</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-7">
                        <input type="text" class="myInput" maxlength="100" id="author" v-model="bookAuthor">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="editorial">Editorial</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-6">
                        <input type="text" class="myInput" maxlength="100" id="editorial"  v-model="bookEditorial">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="pages">Páginas</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-2">
                        <input type="number" class="myInput" max="9999" id="pages" v-model="bookPages">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-4">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end">Categorías</label>
                </div>
                <div class="row m-0 p-0 col-6 fs-5 justify-content-center">
                    <div class="row col-12">
                        <div 
                        class="row col-12 col-lg-5 m-0 p-0 my-1"
                        v-for="category, index in categories"
                        :key="index"
                        >
                            <label class="col-6 text-end" :for="category.id">{{ category.name }}</label>
                            <input class="col-1" type="checkbox" :id="category.id" name="checkbox" :value="category.id" v-model="bookCategories">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="state">Estado</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-7">
                        <select class="myInput select2" id="state" :v-model="bookState">
                            <template
                            v-for="state, index in states"
                            :key="index">
                                <option class="fw-normal" :value="state.id">
                                    {{ state.name }}
                                </option>                                    
                            </template>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="description">Descripción</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-10">
                        <textarea id="description" cols="30" rows="4" maxlength="1000" class="myInput" v-model="bookDescription"></textarea>
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