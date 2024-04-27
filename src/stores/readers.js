import { ref } from 'vue'
import { defineStore } from 'pinia'

const useReaderStore = defineStore('readers', {
    state: () => {
        return {
            readers: ref([])
        }
    },
    actions:{
        FetchReaders(){
            // TODO request            
            this.readers.value = [
                {
                    id: 1,
                    cedula: '12345678',
                    names: 'Karolina',
                    surnames: 'Pérez'
                },
                {
                    id: 2,
                    cedula: '87654321',
                    names: 'Iris',
                    surnames: 'Mendoza'
                },
                {
                    id: 3,
                    cedula: '18273645',
                    names: 'Pedro',
                    surnames: 'Rajoy'
                },
                {
                    id: 4,
                    cedula: '54637281',
                    names: 'Sandro',
                    surnames: 'Castañeda'
                }
            ]
        },
    }
})

export default useReaderStore