import { ref } from 'vue'
import { defineStore } from 'pinia'
import ApiConfig from '@/stores/config.js'
import useSessionStore from '@/stores/session.js'

const apiConfig = new ApiConfig()

const useBookStore = defineStore('books', {
    state: () => {
        return {
            books: ref([]),
            errorMessage: ref(''),
            authors: ref([]),
            editorials: ref([])
        }
    },
    actions:{
        async FetchBooks(){
            const sessionStore = new useSessionStore()
            try{
                let url = apiConfig.base_url + '/books'
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
                    this.books.value = result.books
                    this.errorMessage =  ''
                }
                else{
                    this.errorMessage =  result.message
                }
            }
            catch(error){
                this.errorMessage = 'Error: ' + error
            }
        },

        async FetchBooksWithFilter(filters){
            const sessionStore = new useSessionStore()
            try{
                let url = apiConfig.base_url + '/books/filter'
                var fetchHeaders = {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                }

                if (sessionStore.authenticated === true)
                    fetchHeaders['Authorization'] = 'Bearer ' + sessionStore.token

                let fetchConfig = {
                    method: 'POST',
                    headers: fetchHeaders,
                    body: JSON.stringify(filters)
                }

                let response = await fetch(url, fetchConfig)
                let json = await response.json()
                let result = await json
                if(result.success){
                    this.books.value = result.books
                    this.errorMessage =  ''
                }
                else{
                    this.errorMessage =  result.message
                }
            }
            catch(error){
                this.errorMessage = 'Error: ' + error
            }
        },

        async FetchAuthors(){
            const sessionStore = new useSessionStore()
            try{
                let url = apiConfig.base_url + '/authors'
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
                    this.authors.value = result.authors
                    this.errorMessage =  ''
                }
                else{
                    this.errorMessage =  result.message
                }
            }
            catch(error){
                this.errorMessage = 'Error: ' + error
            }
        },

        async FetchEditorials(){
            const sessionStore = new useSessionStore()
            try{
                let url = apiConfig.base_url + '/editorials'
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
                    this.editorials.value = result.editorials
                    this.errorMessage =  ''
                }
                else{
                    this.errorMessage =  result.message
                }
            }
            catch(error){
                this.errorMessage = 'Error: ' + error
            }
        },

        async FetchBooksByCategory(categoryId){
            const sessionStore = new useSessionStore()
            try{
                let url = apiConfig.base_url + '/books/by_category/' + categoryId
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
                this.books.value = undefined
                let response = await fetch(url, fetchConfig)
                let json = await response.json()
                let result = await json
                if(result.success){
                    this.books.value = result.books
                    this.errorMessage =  ''
                }
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

export default useBookStore