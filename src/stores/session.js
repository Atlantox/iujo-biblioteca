import { ref } from 'vue'
import { defineStore } from 'pinia'
import Swal from 'sweetalert2/dist/sweetalert2.all.js'
const myModal = ref('')


const useSessionStore = defineStore('session', {
  state: () => {
    return {
      authenticated: false,
      token: '',
      userData: {}
    }
  },
  actions:{
    DestroySession(){
      this.token = ''
      this.authenticated = false
      this.userData = {}
      window.location.href = '/'
    },

    ShowModal(title, content, type){
      Swal.fire({
        title: title,
        text: content,
        icon: type,
      })
    }
  }
})

export default useSessionStore