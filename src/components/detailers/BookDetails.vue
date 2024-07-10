<script setup>
import OnAppearAnimation from '@/utils/ElegantDisplayer';
import { onMounted } from 'vue';

const labelStyle = 'fw-bold text-end p-2'

const props = defineProps({
    'targetBook': {type: Object, default: {}}
})


onMounted(() => {
    OnAppearAnimation('hide-up')
})
</script>

<template>
    <div class="hide-up animated-1 row w-100 m-0 p-0 justify-content-center">
        <div class="row m-0 p-0 col-8 col-lg-10 shadowed-l rounded lb-bg-terciary-ul justify-content-around">
            <div class="row m-0 p-0 col-12 col-lg-4 p-3 ">
              <div class="row m-0 p-0 col-12 h4">
                <table>
                  <tr>
                    <td :class="labelStyle">Estado:</td>
                    <td :class="'text-' + (targetBook.state === 'En biblioteca' ? 'success' : 'danger') ">{{ targetBook.state }}</td>
                  </tr>
                  <tr>
                    <td :class="labelStyle">Autor:</td>
                    <td>{{ targetBook.author }}</td>
                  </tr>
                  <tr>
                    <td :class="labelStyle">Editorial:</td>
                    <td>{{ targetBook.editorial }}</td>
                  </tr>
                  <tr>
                    <td :class="labelStyle">Número de cota:</td>
                    <td>{{ targetBook.call_number }}</td>
                  </tr>
                  <tr>
                    <td :class="labelStyle">Páginas:</td>
                    <td>{{ targetBook.pages }}</td>
                  </tr>
                  
                </table>
              </div>
            </div>
      
            <div class="row m-0 p-0 col-12 col-lg-4 p-3">
              <div class="row m-0 p-0 col-12 h4">
                <table>
                  <tr>
                    <td :class="labelStyle">Categorías:</td>
                    <td class="align-center">
                      {{ targetBook.category_names.join(', ') }}
                    </td>
                  </tr>
                  
                  <tr>
                    <td :class="labelStyle">Descripción:</td>
                    <td>{{ targetBook.description }}</td>
                  </tr>
                </table>
              </div>
            </div>

          </div>

          <div class="row m-0 p-0 col-12 justify-content-around">
            <div class="row m-0 p-0 col-12 col-lg-5 p-3 shadowed-l rounded lb-bg-terciary-ul ">
              <h4 class="text-center">
                Otros libros de <strong>{{ targetBook.author }}</strong>
              </h4>
            </div>

            <div class="row m-0 p-0 col-12 col-lg-5 p-3 shadowed-l rounded lb-bg-terciary-ul ">
              <h4 class="text-center">
                Libros de categorías relacionadas
              </h4>
            </div>
          </div>
    </div>

</template>

<style scoped>

</style>