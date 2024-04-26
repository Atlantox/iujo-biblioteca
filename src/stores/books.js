import { ref } from 'vue'
import { defineStore } from 'pinia'

const useBookStore = defineStore('books', {
    state: () => {
        return {
            books: ref([])
        }
    },
    actions:{
        FetchActiveBooks(){
            // TODO request            
            this.books.value = [
                {
                    id: 1,
                    title: 'titulo 1',
                    author: 'autor 1',
                    pageNumber: 400
                },
                {
                    id: 2,
                    title: 'titulo 2',
                    author: 'autor 2',
                    pageNumber: 200
                },
                {
                    id: 3,
                    title: 'titulo 3',
                    author: 'autor 3',
                    pageNumber: 350
                },
                {
                    id: 4,
                    title: 'titulo 4',
                    author: 'autor 4',
                    pageNumber: 560
                }
            ]
        },

        GetAllBooks(){

        }
    }
})

export default useBookStore