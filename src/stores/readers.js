import { ref } from 'vue'
import useSessionStore from '@/stores/session.js'
import ApiConfig from '@/stores/config.js'
import { defineStore } from 'pinia'

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
            const sessionStore = new useSessionStore()
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
                    this.books.value = result.books
                else
                    this.errorMessage =  result.message
            }
            catch(error){
                this.errorMessage = 'Error: ' + error
            }
        },
    }
})

export default useReaderStore