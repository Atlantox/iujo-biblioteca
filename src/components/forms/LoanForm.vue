<script setup>
import { ref, onMounted } from 'vue'
import Select2Initializer from '@/utils/Select2Initializer'
import FormValidator from '@/utils/FormValidator'
import PageTitleView from '../PageTitle.vue';

const props = defineProps({
    books: Object,
    readers: Object
})

const today = new Date()
const day = today.getDate()
var month = String(parseInt(today.getMonth()) + 1)
if (month.length === 1)
    month = '0' + month

const edit = ref(false)

const year = today.getFullYear()
const formattedtoday = year + '-' + month + '-' + day
const formErrors = ref([])

const loanBook = ref('')
const loanReader = ref('')
const loanDate = ref('')
const loanObservation = ref('')

onMounted(() => {
    edit.value = false
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
            <PageTitleView
            :title="(edit ? 'Ver ' : 'Registrar nuevo ') + 'préstamo'"
            />
            
            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="readers">Lector</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-7">
                        <select class="myInput select2" id="readers" v-model="loanReader">
                            <option value="">&nbsp;</option>
                            <template
                            v-for="reader, index in props.readers.value"
                            :key="index">
                                <option class="fw-normal" :value="reader.id">
                                    {{ reader.cedula + ': ' + reader.name + ' ' + reader.surname }}
                                </option>                                    
                            </template>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="books">Libro</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-7">
                        <select class="myInput select2" id="books" v-model="loanBook">
                            <option value="">&nbsp;</option>
                            <template
                            v-for="book, index in props.books.value"
                            :key="index">
                                <option class="fw-normal" :value="book.id">
                                    {{ book.author + ' ' + book.title }}
                                </option>                                    
                            </template>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="date">Fecha de entrega</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-4">
                        <input name="" id="date" :max="formattedtoday" :value="formattedtoday" class="myInput" type="date" v-model="loanDate">
                    </div>
                </div>
            </div>            

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="observation">Observación</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <div class="row col-10">
                        <textarea id="observation" cols="30" rows="4" maxlength="1000" class="myInput" v-model="loanObservation"></textarea>
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2 mt-5">
                <div class="row m-0 p-0 col-12 justify-content-center">
                    <button class="col-2 myBtn terciary-btn shadowed-l h3">
                        {{ edit ? 'Modificar ' : 'Registrar ' }}
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