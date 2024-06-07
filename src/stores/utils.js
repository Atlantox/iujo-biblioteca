import { defineStore } from 'pinia'
import Swal from 'sweetalert2/dist/sweetalert2.all.js'


const useUtilsStore = defineStore('utils', {
  state: () => {
    return {
      
    }
  },
  actions:{
    ShowModal(title, content, type){
      Swal.fire({
        title: title,
        text: content,
        icon: type,
      })
    },

    InitializeSelect2(){
      const select2Ids = [
        'books',
        'select2',
        'readers',
        'state',
        'categories',
        'editorial',
        'author'
      ]

      select2Ids.forEach((id) => { 
          $('#' + id).select2() 
      })
    }
  },
  
  persist: true,
})

export default useUtilsStore