<script setup>
import { ref, onMounted } from 'vue'

import FrequentQuestions from '@/components/FrequentQuestions.vue'
import OnAppearAnimation from '@/utils/ElegantDisplayer';

const heroImages = ref([
  'hero1.jpg',
  'hero2.jpg'
])
let currentHeroImage = ref(0)

const services = [
  'Préstamos de libros para uso interno',
  'Áreas de estudio, investigación, lectura, etc.',
  'Área audiovisual para talleres y conferencias',
  'Internet para fines investigativos',
  'Juegos de mesa como Scrabble y Ajedrez',
]

setInterval(function (){
  if(heroImages.value[currentHeroImage.value + 1] !== undefined)
    currentHeroImage.value++
  else
    currentHeroImage.value = 0

}, 5000)


onMounted(() => {
  OnAppearAnimation('hide-up')
})
</script>

<template>
  <main class="row m-0 p-0 justify-content-center">
    <section class="row col-12 m-0 p-0">
      <figure class="m-0 p-0 my-hero d-flex align-items-center justify-content-center animated-2 shadowed-h" id="my-hero" :style="`background-image: url('images/${heroImages[currentHeroImage]}')`">
        <h1 class="h1 fw-bold text-center outline-black">Biblioteca José María Vélaz</h1>
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
            Ubícanos en planta baja del edificio <strong>Abraham Reyes</strong>, contamos con diversos juegos de mesa disponibles y utilizables dentro de la biblioteca para que disfrutes de buenos 
            momentos con tus mejores amigos.
            <br><br>            
            ¿Necesitas algún libro? ¡Búscalo en nuestro listado!
          </p>
          <div class="col-12 m-0 p-0 justify-content-center">
            <router-link class="myBtn terciary-btn fs-2 rounded-pill px-4 hover-bold hover-spacing hover-bigger" :to="{name: 'books'}">
                Ver libros
            </router-link>
          </div>
        </div>
      </div>
      <div class="col-6 col-lg-3 m-0 p-0">
        <figure class="col-12 rounded-circle m-0 p-0">
          <img class="w-100 m-0 p-0 rounded-circle shadowed-l hide-up animated-1" src="@/assets/images/velaz.jpg" alt="">
        </figure>
      </div>
    </section>


    <section class="row col-12 m-0 p-0 mt-5 justify-content-center align-items-center flex-column flex-lg-row lb-bg-terciary shadowed-n services-section">
      <div class="row col-8 col-lg-4 m-0 p-0 d-flex justify-content-center text-center py-5">
        <figure class="col-12 col-md-8 col-lg-10 text-center">
          <img class="w-100 w-lg-75 hide-up animated-1" src="@/assets/images/library.png" alt="library cloud">
        </figure>
      </div>

      <div class="row col-12 col-lg-7 m-0 p-0 d-flex justify-content-center text-white p-0">
        <div class="col-12 text-center">
          <h2 class="h1 fw-bold text-white services-title text-shadow">Servicios que ofrecemos</h2>  
        </div>

        <div class="col-12 text-center d-flex justify-content-around align-items-start flex-wrap fs-5">
          <div 
          class="col-12 col-sm-6 col-lg-4 m-0 my-4 px-3"
          v-for="service, index in services"
          :key="index">
            <div class="w-100 text-center lb-bg-primary lb-border-primary-dark shadowed-n p-2 rounded-pill px-3">
              {{ service }} 
            </div>
          </div>          
        </div>
      </div>
    </section>

    <section class="row col-12 m-0 p-0 justify-content-around align-items-center flex-column flex-lg-row my-5">
      <div class="col-12 text-center">
        <h2 class="h1 fw-bold text-black">¿De qué te sirve leer?</h2>  
      </div>
      <div class="col-12 col-lg-3 text-center">
        <figure class="col-12">
          <img class="w-100 hide-up shadowed-l rounded animated-1" src="@/assets/images/escritores.jpg" alt="escritores">
        </figure>
      </div>
      <div class="col-12 col-lg-5 text-center">
        <p class="fs-5">
          Leer regularmente no solo amplía
          tus conocimientos y mejora las habilidades de comunicación, sino que también estimula la mente, fomenta la 
          <strong>creatividad</strong>
          y reduce el estrés. A través de la lectura, puedes viajar a mundos imaginarios, aprender de diferentes culturas y perspectivas, 
          y desarrollar una comprensión más profunda de nosotros mismos y del mundo que nos rodea.
          <br><br>
          La lectura enriquece el vocabulario, mejora la concentración y la memoria, y puede incluso retrasar el deterioro cognitivo a medida que envejeces.
        </p>
      </div>
      <div class="col-12 col-lg-3 text-center">
        <figure class="col-12 ">
          <img class="w-100 hide-up shadowed-l rounded animated-1" src="@/assets/images/mangakas.png" alt="mangakas">
        </figure>
      </div>
    </section>

    <section class="row col-12 m-0 p-0 mt-5 justify-content-center align-items-center flex-column flex-lg-row lb-bg-terciary shadowed-n pb-4">
      <div class="col-12 text-center">
        <h2 class="h1 fw-bold text-white services-title text-shadow">Preguntas frecuentes</h2>  
      </div>
      <FrequentQuestions/>
    </section>
  </main>
</template>

<style scoped lang="scss">
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
}

@media (max-width: 720px) {
    .my-hero{
      transform: translateY(-34%);
        height:260px;
    }

    h1{
        font-size:40px;
    }

    h2{
      font-size:40px !important;
    }
}

.services-section{
  background-image: url('images/hero2.jpg');
  background-position:center;

}

h2{
  font-size:70px;
}

</style>
