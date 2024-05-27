<script setup>
import useSessionStore from '@/stores/session.js'
const sessionStore = useSessionStore()
</script>

<template>
    <!-- Designed by Atlantox https://atlantox.pythonanywhere.com/ -->
    <div class="container-fluid position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0 shadowed-n lb-bg-primary bottom-bordered">
            <figure class="navbar-brand m-0 text-right text-md-center ms-5">
                <router-link class="" :to="{name:'home'}">
                    <img class="navbar-logo w-100" src="@/assets/iujo_logo.png" alt="iujo logo">
                </router-link>
            </figure>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">   
                    <!--
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle fs-5" data-bs-toggle="dropdown">dropdown template</a>
                        <div class="dropdown-menu m-0">
                            <router-link class="dropdown-item fs-6 text-decoration-none fs-4 hover-bold hover-spacing">
                                option1
                            </router-link>
                            <router-link class="dropdown-item fs-6 text-decoration-none fs-4 hover-bold hover-spacing">
                                option2
                            </router-link>
                        </div>
                    </div>
                    -->

                    <router-link class="nav-item nav-link text-white text-decoration-none fs-5" :to="{name:'search_books'}">
                        Libros
                    </router-link>
                    
                    <template v-if="sessionStore.authenticated === true">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle fs-5" data-bs-toggle="dropdown">{{ sessionStore.userData.nickname }}</a>
                            <div class="dropdown-menu m-0">
                                <router-link class="dropdown-item text-decoration-none fs-4 hover-bold hover-spacing" :to="{name:'search_readers'}">
                                    Mi cuenta
                                </router-link>
                                <router-link class="dropdown-item text-decoration-none fs-4 hover-bold hover-spacing" :to="{name:'dashboard'}">
                                    Dashboard
                                </router-link>
                                <a class="dropdown-item text-decoration-none fs-4 hover-bold hover-spacing" @click="sessionStore.DestroySession">
                                    Cerrar sesión
                                </a>
                            </div>
                        </div>
                    </template>    
                    
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

.navbar-brand{
    transform:scale(1.5)
}
</style>
