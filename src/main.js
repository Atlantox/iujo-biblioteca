import { createApp } from 'vue'
import { createPinia } from 'pinia'

import "@/assets/common.scss"

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


/*
// select2
import "@/assets/libs/select2/css/select2.min.css"

// DataTable
import "@/assets/libs/datatable/css/jquery.dataTables.min.css"
import "@/assets/libs/datatable/css/jquery.dataTables.css"
*/

app.mount('#app')

/*
// DataTable
import "@/assets/libs/datatable/js/jquery.dataTables.min.js"
import "@/assets/libs/datatable/js/dataTables.buttons.min.js"
import "@/assets/libs/datatable/js/jszip.min.js"
import "@/assets/libs/datatable/js/buttons.html5.min.js"
import "@/assets/libs/datatable/js/buttons.print.min.js"


// Select 2
import "@/assets/libs/select2/js/select2.min.js"
*/