<script setup>
import { ref, onMounted } from 'vue'

import FormValidator from '@/utils/FormValidator'

import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'
import OnAppearAnimation from '@/utils/ElegantDisplayer'

import useUtilsStore from '@/stores/utils'
import useSessionStore from '@/stores/session'
import useUserStore from '@/stores/users'


const utilsStore = useUtilsStore()
const userStore = useUserStore()
const sessionStore = useSessionStore()

const mounted = ref(false)
const formErrors = ref([])

const userNickname = ref('')
const userLevel = ref('')
const userUsername = ref('')
const userPassword = ref('')
const userActive = ref('')

const formRowStyle = 'row m-0 p-0 justify-content-center my-2'
const labelContainerStyle = 'row m-0 p-0 col-12 col-md-3'
const labelStyle = 'text-center text-md-end'
const inputContainerStyle = 'row m-0 p-0 col-12 col-md-7 justify-content-center justify-content-md-start'

const props = defineProps({
    'targetUser': Object
})

const emits = defineEmits(['formOk'])

onMounted(() => {
    OnAppearAnimation('hide-up')
    if(Object.keys(props.targetUser).length !== 0){
        userNickname.value = props.targetUser.cedula
        userLevel.value = props.targetUser.names
        userUsername.value = props.targetUser.surnames
        userPassword.value = props.targetUser.phone
        userActive.value = props.targetUser.gender
    }
    mounted.value = true
})


const ValidateForm = (async (e) => {
    const validator = new FormValidator()

    formErrors.value = [] 
    const validationStructure = {
        'cedula':{ 
            'min': 7,
            'max': 11, 
            'required': true, 
            'value': readerCedula.value 
        },
        'names':{
            'min': 2, 
            'max': 60, 
            'required': true, 
            'value': readerNames.value 
        },
        'surnames':{
            'min': 2, 
            'max': 60, 
            'required': true, 
            'value': readerSurnames.value 
        },
        'birthdate':{
            'min': 8, 
            'max': 10, 
            'required': true, 
            'value': readerBirthdate.value 
        },
        'phone':{
            'min': 7,
            'max': 15, 
            'required': true, 
            'value': readerPhone.value 
        }
    }    

    const emptyFields = validator.FieldsAreEmpty(validationStructure)
    if(emptyFields !== false){
        // uno o más campos están vacíos
        formErrors.value = emptyFields
    }

    const lengthOK = validator.FieldsMeetsLength(validationStructure)
    if (lengthOK !== true)
        formErrors.value = formErrors.value.concat(lengthOK)

    if(!['M', 'F'].includes(readerGender.value)){
        formErrors.value.push('El campo género es requerido')
    }

    if(readerIsTeacher.value.length === 0)
        readerIsTeacher.value = ['0']
    else
        readerIsTeacher.value = ['1']

    if(!['0', '1'].includes(readerIsTeacher.value[0])){
        formErrors.value.push('El campo es docente debe ser 1 o 0')
    }

    if(new Date(readerBirthdate.value) >= new Date()){
        formErrors.value.push('El cumpleaños debe ser anterior a la fecha actual')
    }    



    if(formErrors.value.length === 0){        
        if(Object.keys(props.targetUser).length === 0){
            // Creating the reader
            const cleanReaderData = {
                'cedula': String(validationStructure['cedula']['value']),
                'names': validationStructure['names']['value'],
                'surnames': validationStructure['surnames']['value'],
                'phone':validationStructure['phone']['value'],
                'gender': readerGender.value,
                'birthdate': validationStructure['birthdate']['value'],
                'is_teacher': readerIsTeacher.value[0],
            }

            const created = await userStore.CreateReader(cleanReaderData)            
            if(created.success){
                emits('formOk')
                utilsStore.ShowModal('Success', created.message, 'success')
                readerCedula.value = ''
                readerNames.value = ''
                readerSurnames.value = ''
                readerPhone.value = ''
                readerGender.value = ''
                readerBirthdate.value = ''
                readerIsTeacher.value = []
            }
            else
                utilsStore.ShowModal('Error', created.message, 'error')
        }
        else{
            // Updating the book
            let cleanReaderData = {}

            if(props.targetUser['cedula'] !== String(readerCedula.value)) cleanReaderData['cedula'] = String(readerCedula.value)
            if(props.targetUser['names'] !== readerNames.value) cleanReaderData['names'] = readerNames.value
            if(props.targetUser['surnames'] !== readerSurnames.value) cleanReaderData['surnames'] = readerSurnames.value
            if(props.targetUser['phone'] !== readerPhone.value) cleanReaderData['phone'] = readerPhone.value
            if(props.targetUser['gender'] !== readerGender.value) cleanReaderData['gender'] = readerGender.value
            if(props.targetUser['birthdate'] !== readerBirthdate.value) cleanReaderData['birthdate'] = readerBirthdate.value
            if(props.targetUser['is_teacher'] !== parseInt(readerIsTeacher.value[0])) cleanReaderData['is_teacher'] = readerIsTeacher.value[0]

            if(Object.keys(cleanReaderData).length === 0)
                utilsStore.ShowModal('Info', 'No se realizaron cambios', 'info')
            else{
                console.log(cleanReaderData)
                const updated = await userStore.UpdateReader(props.targetUser['id'], cleanReaderData)
                if (updated.success){
                    emits('formOk')
                    utilsStore.ShowModal('Success', updated.message, 'success')
                }
                else
                    utilsStore.ShowModal('Error', updated.message, 'error')            
            }
        }          
    }    


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
                            <label :class="labelStyle" for="nickname"><strong>Nickname</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12 col-lg-8">
                                <input type="text" class="myInput" maxlength="50" minlength="4" id="nickname" v-model="userNickname">
                            </div>
                        </div>
                    </div>

                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="username"><strong>Usuario</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12 col-lg-8">
                                <input type="text" class="myInput" maxlength="50" minlength="6" id="username" v-model="userUsername">
                            </div>
                        </div>
                    </div>

                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="password"><strong>Password</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12 col-lg-8">
                                <input type="password" class="myInput" maxlength="50" minlength="8" id="password" v-model="userPassword">
                            </div>
                        </div>
                    </div>

                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="gender"><strong>Tipo</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12">

                                <div 
                                v-if="sessionStore.userData.permissons.includes('Editor')"
                                class="row col-12 col-lg-5 m-0 p-0 my-1"
                                >
                                    <label class="col-6 text-end text-lg-center" for="level-editor">Editor</label>
                                    <input class="col-1 my-auto" type="radio" id="level-editor" name="gender" value="Editor" v-model="userLevel">
                                </div>
                                <div 
                                v-if="sessionStore.userData.permissons.includes('Admin')"
                                class="row col-12 col-lg-5 m-0 p-0 my-1"
                                >
                                    <label class="col-6 text-end" for="level-admin">Administrador</label>
                                    <input class="col-1" type="radio" id="level-admin" name="gender" value="Admin" v-model="userLevel">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div :class="formRowStyle">
                        <div :class="labelContainerStyle">
                            <label :class="labelStyle" for="active"><strong>Activo</strong></label>
                        </div>
                        <div :class="inputContainerStyle">
                            <div class="row col-12">
                                <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                                    <input class="col-1 mx-auto mx-lg-0" type="checkbox" id="active" name="active" value="1" v-model="userActive">
                                </div>
                            </div>
                        </div>
                    </div>       

                    <div class="row m-0 p-0 justify-content-center my-2 mt-5">
                        <div class="row m-0 p-0 col-12 justify-content-center">
                            <button class="col-6 col-lg-3 myBtn terciary-btn shadowed-l h3">
                                {{ Object.keys(props.targetUser).length === 0 ? 'Registrar ' : 'Modificar ' }}
                            </button>
                        </div>
                    </div>
        
                    <div v-if="formErrors.length > 0" class="row m-0 p-0 justify-content-center my-2 mt-2">
                        <ul class="row m-0 p-0 col-12 justify-content-center list-unstyled text-center text-danger fs-5">
                            <li 
                            v-for="error, index in formErrors"
                            :key="index"
                            >
                                {{ error }}
                            </li>  
                        </ul>
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