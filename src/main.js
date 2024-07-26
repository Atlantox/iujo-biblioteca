import { createApp } from 'vue'
import { createPinia } from 'pinia'

import "@/assets/common.scss"

import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';


// Select2
import "@/assets/libs/select2/css/select2.min.css"

// Bootstrap
import "@/assets/libs/bootstrap/css/bootstrap-icons.css"
import "@/assets/libs/bootstrap/css/bootstrap.min.css"

// Libraries Stylesheet
import "@/assets/libs/animate/animate.min.css"
import "@/assets/libs/owlcarousel/assets/owl.carousel.min.css"
import "@/assets/libs/template_files/navbar.css"

// Font Awesome
import "@/assets/libs/font-awesome/css/font-awesome.min.css"

// Datatable
import "@/assets/libs/datatable/css/dataTables.dataTables.css"
import "@/assets/libs/datatable/css/buttons.dataTables.css"

// Bootstrap
import "@/assets/libs/template_files/style.css"





import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'

import App from './App.vue'
import router from './router'

const app = createApp(App)

const sweetalertOptions = {
    confirmButtonColor: '#71E580',
    cancelButtonColor: '#ff7674',
    background: 'black'
}
const pinia = createPinia()
pinia.use(piniaPluginPersistedstate)
app.use(pinia)
app.use(router)
app.use(VueSweetalert2, sweetalertOptions)

app.mount('#app')

// Jquery
import "@/assets/libs/jquery/jquery.min.js"

// Bootstrap
import "@/assets/libs/bootstrap/js/bootstrap.popper.js"
import "@/assets/libs/bootstrap/js/bootstrap.js"

// Select2
import "@/assets/libs/select2/js/select2.min.js"

// DataTable
import "@/assets/libs/datatable/js/dataTables.js"
import "@/assets/libs/jszip/jszip.js"
import "@/assets/libs/pdfmake/pdfmake.js"
import "@/assets/libs/datatable/js/dataTables.buttons.js"
import "@/assets/libs/datatable/js/buttons.html5.js"
import "@/assets/libs/datatable/js/buttons.print.js"  

// Terapia files
/*
import "@/assets/libs/template_files/main.js"
import "@/assets/libs/wow/wow.min.js"
import "@/assets/libs/easing/easing.min.js"
import "@/assets/libs/waypoints/waypoints.min.js"
import "@/assets/libs/owlcarousel/owl.carousel.min.js"
*/

// Excel reader
import "@/assets/libs/xlsx/xlsx.full.min.js"


// Highcharts
import "@/assets/libs/highcharts/highcharts.js"
import "@/assets/libs/highcharts/modules/exporting.js"
import "@/assets/libs/highcharts/modules/accessibility.js"

// Template Javascript
import "@/assets/libs/template_files/jquery.sticky.js"
import "@/assets/libs/template_files/click-scroll.js"
import "@/assets/libs/template_files/custom.js"