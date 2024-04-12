import { createApp } from 'vue'
import { createPinia } from 'pinia'

import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap"
import "bootstrap-icons/font/bootstrap-icons.css"

import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

import App from './App.vue'
import router from './router'

const app = createApp(App)

const sweetalertOptions = {
    confirmButtonColor: '#8709B4',
    cancelButtonColor: '#ff7674',
    background: 'black'
}
app.use(createPinia())
app.use(router)
app.use(VueSweetalert2, sweetalertOptions)

app.mount('#app')