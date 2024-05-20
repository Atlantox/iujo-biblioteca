import { ref } from 'vue'
import { defineStore } from 'pinia'

const useCategoryStore = defineStore('categories', {
    state: () => {
        return {
            categories: ref([])
        }
    },
    actions:{
        FetchCategories(){

        }
    }
})

export default useCategoryStore