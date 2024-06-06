<script setup>
import { ref, onMounted } from 'vue'

import Select2Initializer from '@/utils/Select2Initializer'
import FormValidator from '@/utils/FormValidator'

import PageTitleView from '../PageTitle.vue'
import BackButtonGadget from '../myGadgets/BackButtonGadget.vue'

import useCategoryStore from '@/stores/categories'
import useBookStore from '@/stores/books'

const categoryStore = useCategoryStore()
const bookStore = useBookStore()

const editorials = bookStore.editorials
const categories = categoryStore.categories
const bookAuthors = bookStore.authors

const formErrors = ref([])

const edit = ref(false)

const bookTitle = ref('')
const bookCallNumber = ref('')
const bookAuthor = ref('')
const bookEditorial = ref('')
const bookPages = ref('')
const bookCategories = ref([])
const bookDescription = ref('')
const bookState = ref('En biblioteca')

const formRowStyle = 'row m-0 p-0 justify-content-center my-2'
const labelContainerStyle = 'row m-0 p-0 col-12 col-md-3'
const labelStyle = 'text-center text-md-end'
const inputContainerStyle = 'row m-0 p-0 col-12 col-md-7 justify-content-center justify-content-md-start'

onMounted(async () => {
    await bookStore.FetchEditorials()
    await bookStore.FetchBookStates()
    await bookStore.FetchAuthors()

    await categoryStore.FetchCategories()
    


    edit.value = false
    const s2Initializer = new Select2Initializer()

    // Vue.js presenta algunas dificultades para trabajar con Select2, en es te caso el indicamos que al cambiar cualquiera de sus valores
    // Se refleje en su respectiva referencia ref()
    $('#editorial').on('select2:select', function (e) { bookEditorial.value = e.target.value });
    $('#author').on('select2:select', function (e) { bookAuthor.value = e.target.value });
    $('#state').on('select2:select', function (e) { bookState.value = e.target.value });


    if (edit.value === false) bookState.value = '1'
})

const ValidateForm = ((e) => {
    const validator = new FormValidator()
    formErrors.value = [] 

    const emptyFields = validator.FieldsAreEmpty({
        'title': bookTitle.value,
        'call_number': bookCallNumber.value,
        'author': bookAuthor.value,
        'pages': bookPages.value,
        'state': bookState.value,
        'select2-editorial-container': bookEditorial.value,
        'select2-author-container': bookAuthor.value,
        'select2-state-container': bookState.value
    })

    if(emptyFields !== false){
        // uno o más campos están vacíos
        formErrors.value = emptyFields
    }

    if(bookCategories.value.length === 0)
        formErrors.value.push('Seleccione al menos una categoría')

    if(formErrors.value.length === 0){
        // Create book Query
    }
    
})
</script>

<template>
    <form class="row m-0 p-0 justify-content-around align-items-start" @submit.prevent="ValidateForm">
        <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
            <BackButtonGadget :back_to="'dashboard'"/>
        </div>
        <PageTitleView
        :title="(edit ? 'Modificar ' : 'Registrar nuevo ') + 'libro'"
        />
        <div class="col-12 row p-4 pt-5 fs-4 justify-content-around">
            <div class="col-12 col-lg-8 p-2 row myForm shadowed-l rounded lb-bg-terciary-ul justify-content-center">
                <div :class="formRowStyle">
                    <div :class="labelContainerStyle">
                        <label :class="labelStyle" for="title">Título</label>
                    </div>
                    <div :class="inputContainerStyle">
                        <div class="row col-12">
                            <input type="text" class="myInput" maxlength="150" id="title" autofocus v-model="bookTitle">
                        </div>
                    </div>
                </div>
    
                <div :class="formRowStyle">
                    <div :class="labelContainerStyle">
                        <label :class="labelStyle" for="call_number">Cota</label>
                    </div>
                    <div :class="inputContainerStyle">
                        <div class="row col-7 col-md-4">
                            <input type="text" class="myInput" maxlength="8" id="call_number" v-model="bookCallNumber">
                        </div>
                    </div>
                </div>
    
                <div :class="formRowStyle">
                    <div :class="labelContainerStyle">
                        <label :class="labelStyle" for="author">Autor {{ bookAuthor }}</label>
                    </div>
                    <div :class="inputContainerStyle">
                        <div class="row col-7">
                            <select class="myInput select2" id="author" :v-model="bookAuthor">
                                <option value="">&nbsp;</option>
                                <template
                                v-for="author in bookAuthors.value"
                                :key="author.id">
                                    <option class="fw-normal" :value="author.id" :selected="bookAuthor == author.id">
                                        {{ author.name }}
                                    </option>                                    
                                </template>
                            </select>
                        </div>
                    </div>
                </div>
    
                <div :class="formRowStyle">
                    <div :class="labelContainerStyle">
                        <label :class="labelStyle" for="pages">Páginas</label>
                    </div>
                    <div :class="inputContainerStyle">
                        <div class="row col-5 col-md-3">
                            <input type="number" class="myInput" max="9999" id="pages" v-model="bookPages">
                        </div>
                    </div>
                </div>

                <div :class="formRowStyle">
                    <div :class="labelContainerStyle">
                        <label :class="labelStyle" for="editorial">Editorial {{ bookEditorial }}</label>
                    </div>
                    <div :class="inputContainerStyle">
                        <div class="row col-7">
                            <select class="myInput select2" id="editorial" :v-model="bookEditorial">
                                <option value="">&nbsp;</option>
                                <template
                                v-for="editorial in editorials.value"
                                :key="editorial.id">
                                    <option class="fw-normal" :value="editorial.id" :selected="bookEditorial == editorial.id">
                                        {{ editorial.name }}
                                    </option>                                    
                                </template>
                            </select>
                        </div>
                    </div>
                </div>
    
                <div :class="formRowStyle">
                    <div :class="labelContainerStyle">
                        <label :class="labelStyle" for="state">Estado {{ bookState }}</label>
                    </div>
                    <div :class="inputContainerStyle">
                        <div class="row col-7">
                            <select class="myInput select2" id="state" :v-model="bookState">
                                <option value="">&nbsp;</option>
                                <template
                                v-for="state in bookStates.value"
                                :key="state.name">
                                    <option class="fw-normal" :value="state.name" :selected="bookState === state.name">
                                        {{ state.name }}
                                    </option>                                    
                                </template>
                            </select>
                        </div>
                    </div>
                </div>
    
                <div :class="formRowStyle">
                    <div :class="labelContainerStyle">
                        <label :class="labelStyle" for="description">Descripción (Opcional)</label>
                    </div>
                    <div :class="inputContainerStyle">
                        <div class="row col-10">
                            <textarea id="description" cols="30" rows="4" maxlength="1000" class="myInput" v-model="bookDescription"></textarea>
                        </div>
                    </div>
                </div>
    
                <div class="row m-0 p-0 justify-content-center my-2 mt-5">
                    <div class="row m-0 p-0 col-12 justify-content-center">
                        <button class="col-6 col-lg-3 myBtn terciary-btn shadowed-l h3">
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
                            {{ error }}
                        </li>  
                    </ul>
                </div>

            </div>
            
            <div class="col-12 col-lg-3 row mt-4 m-lg-0 p-4 fs-4 shadowed-l rounded lb-bg-terciary-ul justify-content-start align-items-start align-self-start">
                <h2 class="col-12 text-center">Categorías</h2>
                <div class="col-12 d-flex justify-content-start align-items-center flex-column rounded shadowed-l p-0 bg-white" style="overflow:hidden">
                    <div class="col-12 d-flex categories-section justify-content-center p-0"
                    v-for="category, index in categories.value"
                    :key="index">
                        <div class="category-label-container col-8 d-flex justify-content-center align-items-center p-0 py-1">
                            <label class="text-center w-100" :for="category.id">{{ category.name }}</label>
                        </div>
                        <div class="category-radio-container col-4 d-flex justify-content-center align-items-center p-0 y-1">
                            <input class="" type="checkbox" :id="category.id" name="checkbox" :value="category.id" v-model="bookCategories">
                        </div>
                    </div>
                </div>
            </div>        
        </div>

        
    </form>
</template>

<style scoped>
textarea{
    padding:5px;
}

.categories-section div{
    border: 1px black solid;
}
</style>