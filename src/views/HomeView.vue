<script setup>
import { ref, onMounted } from 'vue'

import OnAppearAnimation from '@/utils/ElegantDisplayer';

const heroImages = ref([
  'hero1.jpg',
  'hero2.jpg'
])
let currentHeroImage = ref(0)

setInterval(function (){
  if(heroImages.value[currentHeroImage.value + 1] !== undefined)
    currentHeroImage.value++
  else
    currentHeroImage.value = 0

}, 5000)


onMounted(() => {
  OnAppearAnimation(['velaz-image', 'library-image'], 'hide-up')
})
</script>

<template>
  <main class="row m-0 p-0 justify-content-center">
    <section class="row col-12 m-0 p-0">
      <figure class="m-0 p-0 my-hero d-flex align-items-center justify-content-center animated-2 shadowed-h" id="my-hero" :style="`background-image: url('src/assets/images/${heroImages[currentHeroImage]}')`">
        <h1 class="h1 fw-bold text-center">Biblioteca José María Vélaz</h1>
      </figure>
    </section>

    <section class="row col-12 m-0 p-0 justify-content-around align-items-center flex-column-reverse flex-lg-row">
      <div class="col-12 col-lg-7 m-0 p-0 d-flex justify-content-center">
        <div class="col-10 text-center py-4">
          <h2 class="h1 fw-bold">Tu biblioteca de confianza...</h2>
          <p class="fs-5">
            Puedes contar con nosotros para proporcionarte acceso a una amplia colección de libros, enciclopedias, revistas, diccionarios y libros normativos. Nuestras puertas
            estarán siempre abiertas para ayudarte a encontrar la información que necesitas y a brindarte el apoyo necesario para que tu 
            experiencia de aprendizaje sea enriquecedora y exitosa.
            <br><br>
            También contamos con diversos juegos de mesa disponibles y utilizables dentro de la biblioteca para que disfrutes de buenos 
            momentos con tus mejores amigos.
            <br><br>
            ¿Necesitas algún libro? ¡Búscalo en nuestro listado!
          </p>
          <div class="col-12 m-0 p-0 justify-content-center">
            <router-link class="myBtn terciary-btn fs-3 rounded-pill px-4 hover-bold hover-spacing" :to="{name: 'books'}">
                Ver libros
            </router-link>
          </div>
        </div>
      </div>
      <div class="col-6 col-lg-3 m-0 p-0">
        <figure class="col-12 rounded-circle m-0 p-0">
          <img class="w-100 m-0 p-0 rounded-circle shadowed-l hide-up animated-1" id="velaz-image" src="@/assets/images/velaz.jpg" alt="">
        </figure>
      </div>
    </section>


    <section class="row col-12 m-0 p-0 mt-5 justify-content-around align-items-center flex-column-reverse flex-lg-row lb-bg-terciary shadowed-n">
      <div class="row col-8 m-0 p-0 d-flex justify-content-center text-white py-5">
        <div class="col-12 text-center">
          <h2 class="h1 fw-bold text-white">Servicios que ofrecemos</h2>  
        </div>
        <div class="col-9 text-center d-flex justify-content-around align-items-start flex-wrap fs-5">
          <div class="col-3 lb-bg-terciary-dark lb-border-terciary-l shadowed-l p-2 rounded m-2 my-4">
            Préstamos de libros internos
          </div>
          <div class="col-3 lb-bg-terciary-dark lb-border-terciary-l shadowed-l p-2 rounded m-2 my-4">
            Áreas de estudio, investigación, lectura, etc.
          </div>
          <div class="col-3 lb-bg-terciary-dark lb-border-terciary-l shadowed-l p-2 rounded m-2 my-4">
            Área audiovisual para talleres y conferencias
          </div>
          <div class="col-3 lb-bg-terciary-dark lb-border-terciary-l shadowed-l p-2 rounded m-2 my-4">
            Internet para fines investigativos
          </div>
          <div class="col-3 lb-bg-terciary-dark lb-border-terciary-l shadowed-l p-2 rounded m-2 my-4">
            Juegos de mesa
          </div>
        </div>
      </div>

      <div class="row col-4 m-0 p-0 d-flex justify-content-center text-white py-5">
        <figure class="w-100">
          <img class="w-100 hide-up" src="@/assets/images/library.png" alt="" id="library-image">
        </figure>
      </div>
    </section>
  </main>
</template>

<style scoped>
.my-hero{
  width:100vw;
  transform: translateY(-17%);
  height:600px;
  background-position: center;
  background-size: cover;
}

h1{
  font-size:80px;
  transition:0.8s;
  color:rgb(192, 255, 231);
  letter-spacing: 2px;
  -webkit-text-stroke-width: 2px;
  -webkit-text-stroke-color: black;
}

@media (max-width: 720px) {
    .my-hero{
      transform: translateY(-34%);
        height:260px;
    }

    h1{
          font-size:40px;
      }
  }

</style>