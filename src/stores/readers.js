import { ref } from 'vue'
import { defineStore } from 'pinia'

import ApiConfig from '@/stores/config.js'

import useUtilsStore from './utils'
import useSessionStore from '@/stores/session.js'

const apiConfig = new ApiConfig()
const useReaderStore = defineStore('readers', {
    state: () => {
        return {
            readers: ref([]),
            errorMessage: ref('')
        }
    },
    actions:{
        async FetchReaders(){
            const sessionStore = useSessionStore()
            const utilsStore = useUtilsStore()
            try{
                let url = apiConfig.base_url + '/readers'
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
                    this.readers.value = result.readers
                else
                    utilsStore.ShowModal('Error', result.message, 'error')
            }
            catch(error){
                utilsStore.ShowModal('Error', 'Ocurrió un error inesperado al cargar los lectores', 'error')
            }
        },
    }
})

export default useReaderStore