<script setup>
import { ref, onMounted, inject } from 'vue'
import { RouterLink, RouterView } from 'vue-router'
import { Modal } from 'bootstrap'

const myModal = ref('')
const swal = inject('$swal')


onMounted(() => {
  //myModal.value = new Modal('#exampleModalLong')

  $('#mydatatable').DataTable( {
        "language": {
            paginate: {
              previous: '<i class="bi bi-caret-left-fill text-white datatable-navigation"></i>',
              next:     '<i class="bi bi-caret-right-fill text-white datatable-navigation"></i>'
            },
            aria: {
              paginate: {
                  previous: '<i class="bi bi-caret-right-fill text-white datatable-navigation"></i>',
                  next:     '<i class="bi bi-caret-right-fill text-white datatable-navigation"></i>'
              }
            },
            search: '<i class="bi bi-search text-black me-2 datatable-search"></i>',

            "url": "//cdn.datatables.net/plug-ins/2.0.5/i18n/es-ES.json"
        }
    } );

})

/*
const ShowModal = (() => {
  swal.fire({
    title: 'Titulaso',
    icon:'warning'
  })
  //myModal.value.show()
})

const HideModal = (() => {
  myModal.value.hide()
})
*/
</script>

<template>
  <div class="row m-0 p-0 h6" style="height:1500px">
    <section class="row m-0 p-0 col-12 col-lg-3">
      <div class="col-12 col-lg-9 lb-bg-primary my-sidebar shadowed-n">

        <div class="row m-0 p-0 w-100 justify-content-end mt-4">
          <figure class="col-3 text-right text-white">
            <i class="bi bi-arrow-bar-left menu-hider"></i>
          </figure>
        </div>
        
        <div class="flex-shrink-0 p-3 h6 row align-items-center h-100">          
          <ul class="list-unstyled ps-0">
            <li class="mb-1">
              <button class="btn btn-toggle align-items-center rounded collapsed col-12 text-white fw-bold align-middle d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                <i class="bi bi-caret-down-fill align-middle mx-2"></i>
                <span class="fs-2 text-left m-0">Home</span>
              </button>
              <div class="collapse  fs-5" id="home-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-5 small">
                  <li><a href="#" class="link-dark rounded">Overview</a></li>
                  <li><a href="#" class="link-dark rounded">Updates</a></li>
                  <li><a href="#" class="link-dark rounded">Reports</a></li>
                </ul>
              </div>
            </li>
          </ul>
        </div>


        <!--

          
          
          <div class="row m-0 p-0 w-100 justify-content-end mt-4">
            
          </div>
        -->
      </div>
    </section>
    <section class="row m-0 p-0 py-5 col-12 col-lg-9 align-items-start">
      <table class="mydatatable col-12 shadowed" id="mydatatable">
        <thead>
          <tr class="text-white">
            <th class="text-center lb-bg-terciary">Nº</th>
            <th class="text-center lb-bg-terciary">Título</th>
            <th class="text-center lb-bg-terciary">Autor</th>
            <th class="text-center lb-bg-terciary">Páginas</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Mein Kaphf</td>
            <td>Adolf Hitler</td>
            <td>209</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Mein Kaphf</td>
            <td>Adolf Hitler</td>
            <td>209</td>
          </tr>
          <tr>
            <td>3</td>
            <td>Mein Kaphf</td>
            <td>Adolf Hitler</td>
            <td>209</td>
          </tr>
        </tbody>
      </table>
    </section>
  </div>
</template>

<style scoped lang="scss">
tr, td{
  border: 1px black solid
}
.my-sidebar{
  border-top-right-radius: 30px;
  border-bottom-right-radius: 30px;
  height:100vh;
  position: -webkit-sticky;
  position: sticky;
  top: 0;
}

.menu-hider{
  font-size:40px;
  font-weight: 800;
}

a{
  color:white !important;
  text-decoration:none
}
</style>
