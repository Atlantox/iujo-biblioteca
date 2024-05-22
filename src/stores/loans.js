import { ref } from 'vue'
import { defineStore } from 'pinia'

import ApiConfig from '@/stores/config.js'
import useSessionStore from '@/stores/session.js'

const apiConfig = new ApiConfig()

const useLoanStore = defineStore('loans', {
    state: () => {
        return {
            loans: ref([]),
            errorMessage: ref('')
        }
    },
    actions:{
        async FetchPendingLoans(){
            const sessionStore = new useSessionStore()
            try{
                let url = apiConfig.base_url + '/loans'
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
                    this.loans.value = result.loans
                else
                    this.errorMessage =  result.message
            }
            catch(error){
                this.errorMessage = 'Error: ' + error
            }
        },
    }
})

export default useLoanStore