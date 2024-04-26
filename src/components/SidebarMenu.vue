<script setup>

</script>

<template>
    <div class="col-12 col-lg-9 lb-bg-primary my-sidebar shadowed-n">
        <div class="row m-0 p-0 w-100 justify-content-end mt-4">
            <figure class="col-3 text-right text-white">
                <i class="bi bi-arrow-bar-left menu-hider"></i>
            </figure>
        </div>

        <div class="flex-shrink-0 p-3 h6 row align-items-center h-100">          
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed col-12 text-white fw-bold align-middle d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#books-collapse" aria-expanded="true">
                    <i class="bi bi-caret-down-fill align-middle mx-2"></i>
                    <span class="fs-2 text-left m-0">Libros</span>
                </button>
                <div class="collapse  fs-5" id="books-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-5 small">
                    <li>
                        <router-link class="text-white text-decoration-none fs-4" :to="{name:'home'}">
                            Libros disponibles
                        </router-link>
                    </li>
                    <li>
                        <router-link class="text-white text-decoration-none fs-4" :to="{name:'add_book'}">
                            Añadir libro
                        </router-link>
                    </li>
                    </ul>
                </div>
                </li>

                <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed col-12 text-white fw-bold align-middle d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#loan-collapse" aria-expanded="true">
                    <i class="bi bi-caret-down-fill align-middle mx-2"></i>
                    <span class="fs-2 text-left m-0">Préstamo</span>
                </button>
                <div class="collapse  fs-5" id="loan-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-5 small">
                    <li>
                        <router-link class="text-white text-decoration-none fs-4" :to="{name:'add_loan'}">
                            Crear préstamo
                        </router-link>
                    </li>
                    <li>
                        <router-link class="text-white text-decoration-none fs-4" :to="{name:'search_loans'}">
                            Ver préstamos
                        </router-link>
                    </li>
                    </ul>
                </div>
                </li>

                <li class="mb-1">
                <button class="btn btn-toggle align-items-center rounded collapsed col-12 text-white fw-bold align-middle d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#reader-collapse" aria-expanded="true">
                    <i class="bi bi-caret-down-fill align-middle mx-2"></i>
                    <span class="fs-2 text-left m-0">Lectores</span>
                </button>
                <div class="collapse  fs-5" id="reader-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-5 small">
                    <li>
                        <router-link class="text-white text-decoration-none fs-4" :to="{name:'add_reader'}">
                            Añadir lector
                        </router-link>
                    </li>
                    <li>
                        <router-link class="text-white text-decoration-none fs-4" :to="{name:'search_readers'}">
                            Ver lectores
                        </router-link>
                    </li>
                    </ul>
                </div>
                </li>
            </ul>
        </div>
    </div>
</template>

<style scoped>

</style>