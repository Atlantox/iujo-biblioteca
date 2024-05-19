<script setup>

</script>

<template>
    <!-- Designed by Atlantox https://atlantox.pythonanywhere.com/ -->
    <div class="container-fluid position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0 shadowed-l lb-bg-primary bottom-bordered">
            <router-link class="navbar-brand p-0 m-0 h-100" :to="{name:'home'}">
              <figure class="w-100 m-0 h-100 text-center">
                <img class="navbar-logo w-100" src="@/assets/iujo_logo.png" alt="iujo logo">
              </figure>
            </router-link>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <!--
                    <router-link class="nav-item nav-link fs-5 text-white text-decoration-none fs-4" :to="{name:'add_book'}">
                        Añadir libro
                    </router-link>
                    -->                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle fs-5" data-bs-toggle="dropdown">Libros</a>
                        <div class="dropdown-menu m-0">
                            <router-link class="dropdown-item fs-6 text-decoration-none fs-4" :to="{name:'home'}">
                                Ver listado
                            </router-link>
                            <router-link class="dropdown-item fs-6 text-decoration-none fs-4" :to="{name:'add_book'}">
                                Crear nuevo
                            </router-link>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle fs-5" data-bs-toggle="dropdown">Préstamos</a>
                        <div class="dropdown-menu m-0">
                            <router-link class="dropdown-item fs-6 text-decoration-none fs-4" :to="{name:'search_loans'}">
                                Ver listado
                            </router-link>
                            <router-link class="dropdown-item fs-6 text-decoration-none fs-4" :to="{name:'add_loan'}">
                                Crear nuevo
                            </router-link>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle fs-5" data-bs-toggle="dropdown">Lectores</a>
                        <div class="dropdown-menu m-0">
                            <router-link class="dropdown-item fs-6 text-decoration-none fs-4" :to="{name:'search_readers'}">
                                Ver listado
                            </router-link>
                            <router-link class="dropdown-item fs-6 text-decoration-none fs-4" :to="{name:'add_reader'}">
                                Crear nuevo
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
      </div>
</template>

<style scoped>
.navbar .dropdown-toggle::after {
  content: "\f282";
  display: inline-block;
  font-family: bootstrap-icons !important;
  font-size: var(--copyright-font-size);
  font-style: normal;
  font-weight: normal !important;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  vertical-align: -.125em;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  position: relative;
  left: 2px;
  border: 0;
}
</style>
