import { ref } from 'vue'
import { defineStore } from 'pinia'
import { Modal } from 'bootstrap'
import Swal from 'sweetalert2/dist/sweetalert2.all.js'
const myModal = ref('')


const useSessionStore = defineStore('session', {
  state: () => {
    return {
      token: '',
      userData: {}
    }
  },
  actions:{
    DestroySession(){
      this.token = ''
      window.location.href = '/'
    },

    ShowModal(title, content, type){
      Swal.fire({
        title: title,
        text: content,
        icon: type,
      })
      /*
      myModal.value = new Modal('#exampleModalLong')
      myModal.value.show()
      */
    }
  }
})

export default useSessionStore