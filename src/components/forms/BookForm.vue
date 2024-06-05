<script setup>
import { ref, onMounted } from 'vue'
import Select2Initializer from '@/utils/Select2Initializer'
import FormValidator from '@/utils/FormValidator'
import PageTitleView from '../PageTitle.vue'
import BackButtonGadget from '../myGadgets/BackButtonGadget.vue'

const formErrors = ref([])
const categories = ref([{id:1, name:'Ficción'}, {id:2, name:'Acción'}, {id:3, name:'Fantasía'}])
const states = ref([{id:1, name:'En biblioteca'}, {id:2, name:'Extraviado'}, {id:3, name:'Prestado'}])

const edit = ref(false)

const bookTitle = ref('')
const bookCallNumber = ref('')
const bookAuthor = ref('')
const bookEditorial = ref('')
const bookPages = ref('')
const bookCategories = ref([])
const bookDescription = ref('')
const bookState = ref('')

const formRowStyle = 'row m-0 p-0 justify-content-center my-2'
const labelContainerStyle = 'row m-0 p-0 col-12 col-md-3'
const labelStyle = 'text-center text-md-end'
const inputContainerStyle = 'row m-0 p-0 col-12 col-md-7 justify-content-center justify-content-md-start'

onMounted(() => {
    edit.value = false
    const s2Initializer = new Select2Initializer()

    if (edit.value === false) bookState.value = '1'
})

const ValidateForm = ((e) => {
    const validator = new FormValidator()
    var errors = []   

    const empty = validator.FieldsAreEmpty({
        'title': bookTitle.value,
        'call_number': bookCallNumber.value,
        'author': bookAuthor.value,
        'editorial': bookEditorial.value,
        'pages': bookPages.value,
        'description': bookDescription.value,
        'state': bookState.value
    })
    if(empty !== false){
        // uno o más campos están vacíos
        // se obtendrá como respuesta una array de objetos que tengan un campo id: title, message: 'El campo Título está vacío', de esa forma 
        // se mostrarán todos los mensajes de error al final del formulario y hará un GetElementById(id) para ponerlo en rojo
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
                        <label :class="labelStyle" for="author">Autor</label>
                    </div>
                    <div :class="inputContainerStyle">
                        <div class="row col-9 col-md-7">
                            <input type="text" class="myInput" maxlength="100" id="author" v-model="bookAuthor">
                        </div>
                    </div>
                </div>
    
                <div :class="formRowStyle">
                    <div :class="labelContainerStyle">
                        <label :class="labelStyle" for="editorial">Editorial</label>
                    </div>
                    <div :class="inputContainerStyle">
                        <div class="row col-8 col-md-6">
                            <input type="text" class="myInput" maxlength="100" id="editorial"  v-model="bookEditorial">
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
                        <label :class="labelStyle" for="state">Estado</label>
                    </div>
                    <div :class="inputContainerStyle">
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
                            {{ error.message }}
                        </li>  
                    </ul>
                </div>

            </div>
            
            <div class="col-12 col-lg-3 row mt-4 m-lg-0 p-4 fs-4 shadowed-l rounded lb-bg-terciary-ul justify-content-start align-items-start align-self-start">
                <h2 class="col-12 text-center">Categorías</h2>
                <div class="col-12 d-flex justify-content-start align-items-center flex-column rounded shadowed-l p-0 bg-white" style="overflow:hidden">
                    <div class="col-12 d-flex categories-section justify-content-center p-0"
                    v-for="category, index in categories"
                    :key="index">
                        <div class="category-label-container col-8 d-flex justify-content-center align-items-center p-0">
                            <label class="text-center w-100" :for="category.id">{{ category.name }}</label>
                        </div>
                        <div class="category-radio-container col-4 d-flex justify-content-center align-items-center p-0">
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