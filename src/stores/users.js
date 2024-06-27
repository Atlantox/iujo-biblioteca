import { ref } from 'vue'
import { defineStore } from 'pinia'

import ApiConfig from '@/stores/config.js'

import useUtilsStore from './utils'
import useSessionStore from '@/stores/session.js'

const apiConfig = new ApiConfig()
const useUserStore = defineStore('users', {
    state: () => {
        return {
            users: ref([])
        }
    },
    actions:{
        async CreateUser(userData){
            const sessionStore = useSessionStore()
            let result = {}
            try{
                let url = apiConfig.base_url + '/users'
                var fetchHeaders = {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                }

                if (sessionStore.authenticated === true)
                    fetchHeaders['Authorization'] = 'Bearer ' + sessionStore.token

                let fetchConfig = {
                    method: 'POST',
                    headers: fetchHeaders,
                    body: JSON.stringify(userData)
                }

                let response = await fetch(url, fetchConfig)
                let json = await response.json()
                result = await json                
            }
            catch(error){
                result = {success: false, message: 'Ocurrió un error inesperado al crear el usuario'}
            }

            return result
        },

        async FetchUsers(){
            const sessionStore = useSessionStore()
            const utilsStore = useUtilsStore()
            try{
                let url = apiConfig.base_url + '/users'
                var fetchHeaders = {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                }

                if (sessionStore.authenticated === true)
                    fetchHeaders['Authorization'] = 'Bearer ' + sessionStore.token

                let fetchConfig = {
                    method: 'GET',
                    headers: fetchHeaders
                }

                let response = await fetch(url, fetchConfig)
                let json = await response.json()
                let result = await json
                if(result.success)
                    this.users.value = result.users
                else
                    utilsStore.ShowModal('Error', result.message, 'error')
            }
            catch(error){
                utilsStore.ShowModal('Error', 'Ocurrió un error inesperado al cargar los usuarios', 'error')
            }
        },

        async FetchUserById(id){
            var targetUser = false
            const sessionStore = useSessionStore()
            const utilsStore = useUtilsStore()

            try{
                let url = apiConfig.base_url + '/users/' + id
                var fetchHeaders = {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                }

                if (sessionStore.authenticated === true)
                    fetchHeaders['Authorization'] = 'Bearer ' + sessionStore.token

                let fetchConfig = {
                    method: 'GET',
                    headers: fetchHeaders
                }

                let response = await fetch(url, fetchConfig)
                let json = await response.json()
                let result = await json
                if(result.success){
                    targetUser = result.data                    
                }
                else
                    utilsStore.ShowModal('Error', result.message, 'error')
            }
            catch(error){
                utilsStore.ShowModal('Error', 'Ocurrió un error inesperado al cargar el usuario solicitado: ' + error.message, 'error')
            }

            return targetUser
        },

        async UpdateUser(userId, userData){
            const sessionStore = useSessionStore()
            let result = {}
            try{
                let url = apiConfig.base_url + '/users/' + userId
                var fetchHeaders = {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                }

                if (sessionStore.authenticated === true)
                    fetchHeaders['Authorization'] = 'Bearer ' + sessionStore.token

                let fetchConfig = {
                    method: 'PUT',
                    headers: fetchHeaders,
                    body: JSON.stringify(userData)
                }

                let response = await fetch(url, fetchConfig)
                let json = await response.json()
                result = await json                
            }
            catch(error){
                result = {success: false, message: 'Ocurrió un error inesperado al intentar actualizar el usuario'}
            }

            return result
        },
    }
})

export default useUserStore