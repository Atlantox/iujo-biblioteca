<script setup>
import { ref, onMounted } from 'vue'

import FormValidator from '@/utils/FormValidator'

import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import OnAppearAnimation from '@/utils/ElegantDisplayer'

import useUtilsStore from '@/stores/utils'
import useReaderStore from '@/stores/readers'


const utilsStore = useUtilsStore()
const readerStore = useReaderStore()

const mounted = ref(false)
const formErrors = ref([])

const readerCedula = ref('')
const readerNames = ref('')
const readerSurnames = ref('')
const readerPhone = ref('')
const readerGender = ref('')
const readerIsTeacher = ref('')

const formRowStyle = 'row m-0 p-0 justify-content-center my-2'
const labelContainerStyle = 'row m-0 p-0 col-12 col-md-3'
const labelStyle = 'text-center text-md-end'
const inputContainerStyle = 'row m-0 p-0 col-12 col-md-7 justify-content-center justify-content-md-start'

const props = defineProps({
    'targetReader': Object
})

onMounted(() => {
    OnAppearAnimation('hide-up')
    if(props.targetBook !== undefined){
    }
    mounted.value = true
})



/*
cedula,
names
surnames
gender
birthdate
phone
is_teacher


READER_LENGTH_CONFIG = {
    'cedula': {'min': 7, 'max':11},
    'names': {'min': 2, 'max':60},
    'surnames': {'min': 2, 'max':60},
    'gender': {'min': 1, 'max':1},
    'birthdate': {'min':8, 'max':10},
    'phone': {'min': 7, 'max':15},
    'is_teacher': {'min': 1, 'max':1}
}

*/
const ValidateForm = ((e) => {
    const myForm = e.srcElement
    const validator = new FormValidator()    
})
</script>

<template>
    <form class="row m-0 p-0 justify-content-around align-items-start" @submit.prevent="ValidateForm">
        <template v-if="mounted.value === false">
            <LoadingGadget/>
        </template>
        <template v-else>
            <div class="col-12 row p-4 pt-5 fs-4 justify-content-around hide-up animated-1">
                <div class="col-12 col-lg-8 p-2 row myForm shadowed-l rounded lb-bg-terciary-ul justify-content-center">        
                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="cedula"><strong>Cédula</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-7">
                                <input type="number" class="myInput" maxlength="11" id="cedula" v-model="readerCedula">
                            </div>
                        </div>
                    </div>

                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="names"><strong>Nombres</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12">
                                <input type="text" class="myInput" maxlength="60" id="names" autofocus v-model="readerNames">
                            </div>
                        </div>
                    </div>

                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="surnames"><strong>Apellidos</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12">
                                <input type="text" class="myInput" maxlength="60" id="surnames" autofocus v-model="readerSurnames">
                            </div>
                        </div>
                    </div>

                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="phone"><strong>Teléfono</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12">
                                <input type="text" class="myInput" minlength="10" maxlength="16" id="phone" autofocus v-model="readerPhone">
                            </div>
                        </div>
                    </div>

                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="gender"><strong>Género</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12">
                                <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                                    <label class="col-6 text-end" for="gender-m">M</label>
                                    <input class="col-1" type="radio" id="gender-m" name="gender" value="M" v-model="readerGender">
                                </div>
                                <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                                    <label class="col-6 text-end" for="gender-f">F</label>
                                    <input class="col-1" type="radio" id="gender-f" name="gender" value="F" v-model="readerGender">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="gender"><strong>Es docente</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12">
                                <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                                    <input class="col-1" type="checkbox" id="teacher" name="teacher" value="1" v-model="readerIsTeacher">
                                </div>
                            </div>
                        </div>
                    </div>       
                    
                </div>    
            </div>
        </template>
    </form>
</template>

<style scoped>
h1{
  font-size:50px !important;
}
</style>