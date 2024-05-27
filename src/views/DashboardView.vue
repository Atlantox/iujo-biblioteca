<script setup>
import PageTitle from '@/components/PageTitle.vue';
import useSessionStore from '@/stores/session';

const sessionStore = useSessionStore()

const articleStyle = 'col-12 my-4 rounded bg-white shadowed-l'
const articleWrappedStyle = 'row col-12 m-0 p-0 justify-content-start shadowed p-2 px-4'
const h4Style = 'h4 col-12 border-bottom fw-bold'
const linkContainersStyle = 'd-flex col-12 flex-wrap mt-2'
const linkElementStyle = 'col-12 col-lg-4'
const routerLinkStyle = 'w-100 justify-content-start align-items-center p-1'
const iconStyle = 'text-black col-1 panel-icon fs-5'
const linkTextStyle = 'text-grey col-10 fs-5 w-auto hover-bold hover-spacing'
</script>

<template>
  <PageTitle
  :title="'Panel de administrador'"
  />
    <section class="row m-0 p-0 my-3 align-items-center align-items-lg-start justify-content-around flex-column-reverse flex-lg-row">
      <div class="row col-12 justify-content-center col-lg-8 p-3">
        <div class="col-12 shadowed-l rounded lb-bg-terciary-ul">

          <template v-if="sessionStore.userData.permissons.includes('Préstamos')">
            <article :class="articleStyle">
              <div :class="articleWrappedStyle">
                <h4 :class="h4Style">
                    Préstamos
                </h4>
                <div :class="linkContainersStyle">
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-plus text-success ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Nuevo préstamo
                      </span>
                    </router-link>
                  </div>
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-file ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Ver préstamos
                      </span>
                    </router-link>
                  </div>
                </div>
              </div>
            </article>
          </template>

          <template v-if="sessionStore.userData.permissons.includes('Libros')">
            <article :class="articleStyle">
              <div :class="articleWrappedStyle">
                <h4 :class="h4Style">
                    Libros
                </h4>
                <div :class="linkContainersStyle">
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-plus text-success ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Nuevo libro
                      </span>
                    </router-link>
                  </div>
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-book ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Ver libros
                      </span>
                    </router-link>
                  </div>
                  <template v-if="sessionStore.userData.permissons.includes('Estados de libros')">
                    <div :class="linkElementStyle">
                      <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                        <i :class="'fa fa-inbox ' + iconStyle" ></i>
                        <span :class="linkTextStyle">
                          Ver estados de libros
                        </span>
                      </router-link>
                    </div>
                  </template>
                </div>
              </div>
            </article>
          </template>

          <template v-if="sessionStore.userData.permissons.includes('Categorías')">
            <article :class="articleStyle">
              <div :class="articleWrappedStyle">
                <h4 :class="h4Style">
                    Categorías
                </h4>
                <div :class="linkContainersStyle">
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-plus text-success ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Nueva categoría
                      </span>
                    </router-link>
                  </div>
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-tag ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Ver categorías
                      </span>
                    </router-link>
                  </div>
                </div>
              </div>
            </article>
          </template>

          <template v-if="sessionStore.userData.permissons.includes('Lectores')">
            <article :class="articleStyle">
              <div :class="articleWrappedStyle">
                <h4 :class="h4Style">
                  Ver lectores
                </h4>
                <div :class="linkContainersStyle">
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-plus text-success ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Nuevo lector
                      </span>
                    </router-link>
                  </div>
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-eye ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Ver lectores
                      </span>
                    </router-link>
                  </div>
                </div>
              </div>
            </article>
          </template>

          <template v-if="sessionStore.userData.permissons.includes('Editores') || sessionStore.userData.permissons.includes('Admin')">
            <article :class="articleStyle">
              <div :class="articleWrappedStyle">
                <h4 :class="h4Style">
                    Usuarios
                </h4>
                <div :class="linkContainersStyle">
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-plus text-success ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Nuevo usuario
                      </span>
                    </router-link>
                  </div>
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-user ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Ver usuarios
                      </span>
                    </router-link>
                  </div>
                </div>
              </div>
            </article>
          </template>

          <template v-if="sessionStore.userData.permissons.includes('Estadísticas')">
            <article :class="articleStyle">
              <div :class="articleWrappedStyle">
                <h4 :class="h4Style">
                    Estadísticas
                </h4>
                <div :class="linkContainersStyle">
                  <div :class="linkElementStyle">
                    <router-link :class="routerLinkStyle" :to="{name: 'search_books'}">
                      <i :class="'fa fa-star ' + iconStyle" ></i>
                      <span :class="linkTextStyle">
                        Ver estadísticas
                      </span>
                    </router-link>
                  </div>
                </div>
              </div>
            </article>
          </template>

        </div>
      </div>


      <div class="row col-12 justify-content-center col-lg-4 p-3">
        <div class="row w-100 m-0 p-0 justify-content-around h-100 py-3 shadowed-l rounded lb-bg-terciary-ul my-3">
          <h3 class="fw-bold col-12 text-center">Los últimos 30 días se realizaron...</h3>
            <article class="col-12 col-lg-5 row m-0 p-0 border-bottom align-middle">
                <div class="col-12 d-flex align-items-center bg-white rounded shadowed-l">
                    <h4 class="h4 m-0 text-center w-100 p-2">
                      <strong>0</strong>
                        Préstamos
                    </h4>
                </div>
            </article>

            <article class="col-12 col-lg-5 row m-0 p-0 border-bottom align-middle">
                <div class="col-12 d-flex align-items-center bg-white rounded shadowed-l">
                    <h4 class="h4 m-0 text-center w-100 p-2">
                      <strong>0</strong>
                        Devoluciones
                    </h4>
                </div>
            </article>
        </div>

        <div class="row w-100 m-0 p-0 justify-content-around h-100 py-3 shadowed-l rounded lb-bg-terciary-ul my-3">
          <h3 class="fw-bold col-12 text-center">Préstamos recientes</h3>
            <table class="col-10 text-center">
              <thead>
                <tr class="border-bottom">
                  <th>Lector</th>
                  <th>Libro</th>
                  <th>Fecha</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Luis Alvarado</td>
                  <td>Berserk Vol. 1</td>
                  <td>27/05/2024</td>
                </tr>
                <tr>
                  <td>Luis Alvarado</td>
                  <td>Berserk Vol. 1</td>
                  <td>27/05/2024</td>
                </tr>
                <tr>
                  <td>Luis Alvarado</td>
                  <td>Berserk Vol. 1</td>
                  <td>27/05/2024</td>
                </tr>
                <tr>
                  <td>Luis Alvarado</td>
                  <td>Berserk Vol. 1</td>
                  <td>27/05/2024</td>
                </tr>
                <tr>
                  <td>Luis Alvarado</td>
                  <td>Berserk Vol. 1</td>
                  <td>27/05/2024</td>
                </tr>
                <tr>
                  <td>Luis Alvarado</td>
                  <td>Berserk Vol. 1</td>
                  <td>27/05/2024</td>
                </tr>
              </tbody>
            </table>
        </div>
      </div>
  </section>
</template>

<style scoped>
  td{
    padding-top:10px;
  }

  thead tr{
    border-color:black !important;
  }
</style>