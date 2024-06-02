import { ref } from 'vue'
import { defineStore } from 'pinia'
import ApiConfig from '@/stores/config.js'
import useSessionStore from '@/stores/session.js'

const apiConfig = new ApiConfig()

const useCategoryStore = defineStore('categories', {
    state: () => {
        return {
            categories: ref([]),
            errorMessage: ref(''),
        }
    },
    actions:{
        async FetchCategories(){
            const sessionStore = new useSessionStore()
            try{
                let url = apiConfig.base_url + '/categories'
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
                    this.categories.value = result.categories
                else{
                    this.errorMessage =  result.message
                }
            }
            catch(error){
                this.errorMessage = 'Error: ' + error
            }
        }
    }
})

export default useCategoryStore