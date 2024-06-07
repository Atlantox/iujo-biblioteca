import { ref } from 'vue'
import { defineStore } from 'pinia'
import ApiConfig from '@/stores/config.js'

import useUtilsStore from './utils'
import useSessionStore from '@/stores/session.js'

const apiConfig = new ApiConfig()

const useBookStore = defineStore('books', {
    state: () => {
        return {
            books: ref([]),
            errorMessage: ref(''),
            authors: ref([]),
            editorials: ref([]),
            bookStates: ref([])
        }
    },
    actions:{
        async CreateBook(bookData){
            const sessionStore = useSessionStore()
            let result = {}
            try{
                let url = apiConfig.base_url + '/books'
                var fetchHeaders = {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                }

                if (sessionStore.authenticated === true)
                    fetchHeaders['Authorization'] = 'Bearer ' + sessionStore.token

                let fetchConfig = {
                    method: 'POST',
                    headers: fetchHeaders,
                    body: JSON.stringify(bookData)
                }

                let response = await fetch(url, fetchConfig)
                let json = await response.json()
                result = await json
                
            }
            catch(error){
                result = {success: false, message: 'Ocurrió un error inesperado al crear el libro'}
            }

            return result
        },

        async FetchBooks(){
            const sessionStore = useSessionStore()
            const utilsStore = useUtilsStore()
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
                else
                    utilsStore.ShowModal('Error', result.message, 'error')
            }
            catch(error){
                utilsStore.ShowModal('Error', 'Ocurrió un error inesperado al cargar los libros', 'error')
            }
        },

        async FetchBooksWithFilter(filters){
            const sessionStore = useSessionStore()
            const utilsStore = useUtilsStore()
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
                else
                    utilsStore.ShowModal('Error', result.message, 'error')
            }
            catch(error){
                utilsStore.ShowModal('Error', 'Ocurrió un error inesperado al cargar los libros con filtros', 'error')
            }
        },

        async FetchAuthors(){
            const sessionStore = useSessionStore()
            const utilsStore = useUtilsStore()
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
                else
                    utilsStore.ShowModal('Error', result.message, 'error')
            }
            catch(error){
                utilsStore.ShowModal('Error', 'Ocurrió un error inesperado al cargar los autores', 'error')
            }
        },

        async FetchEditorials(){
            const sessionStore = useSessionStore()
            const utilsStore = useUtilsStore()
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
                else
                    utilsStore.ShowModal('Error', result.message, 'error')
            }
            catch(error){
                utilsStore.ShowModal('Error', 'Ocurrió un error inesperado al cargar las editoriales', 'error')
            }
        },

        async FetchBookStates(){
            const sessionStore = useSessionStore()
            const utilsStore = useUtilsStore()
            try{
                let url = apiConfig.base_url + '/books/states'
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
                    this.bookStates.value = result.states
                    this.errorMessage =  ''
                }
                else
                    utilsStore.ShowModal('Error', result.message, 'error')
            }
            catch(error){
                utilsStore.ShowModal('Error', 'Ocurrió un error inesperado al cargar los estados de libros', 'error')
            }
        },
    }
})

export default useBookStore