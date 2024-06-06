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
    }
  },
  
  persist: true,
})

export default useUtilsStore