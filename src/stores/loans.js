import { ref } from 'vue'
import { defineStore } from 'pinia'

const useLoanStore = defineStore('loans', {
    state: () => {
        return {
            loans: ref([])
        }
    },
    actions:{
        FetchLoans(){
            // TODO request            
            this.loans.value = [
                {
                    id: 1,
                    lectorId: '1',
                    fullName: 'Karolina Pérez',
                    bookId: '1',
                    bookInfo: 'Autor1: Título1'
                },
                {
                    id: 2,
                    lectorId: '1',
                    fullName: 'Karolina Pérez',
                    bookId: '3',
                    bookInfo: 'Autor3: Título3'
                },
                {
                    id: 3,
                    lectorId: '2',
                    fullName: 'Iris Mendoza',
                    bookId: '2',
                    bookInfo: 'Autor2: Título2'
                },
                {
                    id: 4,
                    lectorId: '4',
                    fullName: 'Sandro Castañeda',
                    bookId: '5',
                    bookInfo: 'Autor5: Título5'
                }
            ]
        },
    }
})

export default useLoanStore