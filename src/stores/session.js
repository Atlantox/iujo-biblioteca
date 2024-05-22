import { ref } from 'vue'
import { defineStore } from 'pinia'
import Swal from 'sweetalert2/dist/sweetalert2.all.js'
import Apiconfig from '@/stores/config.js'

const apiConfig = new Apiconfig()


const useSessionStore = defineStore('session', {
  state: () => {
    return {
      authenticated: false,
      token: '',
      userData: {},
      loginResult: ref({})
    }
  },
  actions:{
    async TryLogin(username, password){
      const sessionStore = useSessionStore()
      try{
          let url = apiConfig.base_url + '/login'
          var fetchHeaders = {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
          }

          if (sessionStore.authenticated === true)
              fetchHeaders['Authorization'] = 'Bearer ' + sessionStore.token

          let fetchConfig = {
              method: 'POST',
              headers: fetchHeaders,
              body:JSON.stringify({
                'username': username,
                'password': password
              })
          }

          let response = await fetch(url, fetchConfig)
          let json = await response.json()
          let result = await json
          this.loginResult.value = result
          /*
          if(result.success){
            this.authenticated = true
            this.token = result.token
            this.userData = result.userData
            this.errorMessage =  ''
          }
          else{
              this.errorMessage =  result.message
          }
          */
      }
      catch(error){
          this.loginResult.value = 'Error: ' + error.message
          //this.errorMessage = 'Error: ' + error.message
      }
    },

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
  },
  
  persist: true,
})

export default useSessionStore