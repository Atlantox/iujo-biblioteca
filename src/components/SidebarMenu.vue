<script setup>

const ToggleSidemenu = () => {
    var sidebar = document.getElementById('menu-toggler')
    var principal = document.getElementById('app')
    
    if (principal.classList.contains('show-sidebar')) {
        principal.classList.remove('show-sidebar');
        sidebar.classList.remove('active');
    } else {
        principal.classList.add('show-sidebar');	
        sidebar.classList.add('active');
    }

    console.log(principal.classList)
    console.log(sidebar.classList)

}

$(function() {

'use strict';



// click outisde offcanvas
  $(document).mouseup(function(e) {
  var container = $(".sidebar");
  if (!container.is(e.target) && container.has(e.target).length === 0) {
    if ( $('body').hasClass('show-sidebar') ) {
              $('body').removeClass('show-sidebar');
              $('body').find('.js-menu-toggle').removeClass('active');
          }
  }
  }); 

  

});
</script>

<template>
    <!--
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
-->

<aside class="sidebar">
<div class="toggle" @click="ToggleSidemenu">
<a href="#" class="burger js-menu-toggle active" id="menu-toggler" data-toggle="collapse" data-target="#main-navbar">
<span></span>
</a>
</div>
<div class="side-inner">
<div class="profile">
<img src="" alt="Image" class="img-fluid">
<h3 class="name">Debby Williams</h3>
<span class="country">New York, USA</span>
</div>
<div class="counter d-flex justify-content-center">

<div class="col">
<strong class="number">892</strong>
<span class="number-label">Posts</span>
</div>
<div class="col">
<strong class="number">22.5k</strong>
<span class="number-label">Followers</span>
</div>
<div class="col">
<strong class="number">150</strong>
<span class="number-label">Following</span>
</div>

</div>
<div class="nav-menu">
<ul>
<li class="active"><a href="#"><span class="icon-home mr-3"></span>Feed</a></li>
<li><a href="#"><span class="icon-search2 mr-3"></span>Explore</a></li>
<li><a href="#"><span class="icon-notifications mr-3"></span>Notifications</a></li>
<li><a href="#"><span class="icon-location-arrow mr-3"></span>Direct</a></li>
<li><a href="#"><span class="icon-pie-chart mr-3"></span>Stats</a></li>
<li><a href="#"><span class="icon-sign-out mr-3"></span>Sign out</a></li>
</ul>
</div>
</div>
</aside>
</template>

<style scoped>
aside {
  width: 300px;
  left: 0;
  z-index: 1001;
  position: fixed;
  -webkit-transform: translateX(-100%);
  -ms-transform: translateX(-100%);
  transform: translateX(-100%);
  background-color: #fff;
  -webkit-transition: 1s -webkit-transform cubic-bezier(0.23, 1, 0.32, 1);
  transition: 1s -webkit-transform cubic-bezier(0.23, 1, 0.32, 1);
  -o-transition: 1s transform cubic-bezier(0.23, 1, 0.32, 1);
  transition: 1s transform cubic-bezier(0.23, 1, 0.32, 1);
  transition: 1s transform cubic-bezier(0.23, 1, 0.32, 1), 1s -webkit-transform cubic-bezier(0.23, 1, 0.32, 1); }
  .show-sidebar aside {
    -webkit-transform: translateX(0%);
    -ms-transform: translateX(0%);
    transform: translateX(0%); }
  aside .toggle {
    padding-left: 30px;
    padding-top: 30px;
    position: absolute;
    right: 0;
    -webkit-transform: translateX(100%);
    -ms-transform: translateX(100%);
    transform: translateX(100%); }
    .show-sidebar aside .toggle .burger:before, .show-sidebar aside .toggle .burger span, .show-sidebar aside .toggle .burger:after {
      background: #fff; }
  .show-sidebar aside {
    -webkit-box-shadow: 10px 0 30px 0 rgba(0, 0, 0, 0.1);
    box-shadow: 10px 0 30px 0 rgba(0, 0, 0, 0.1); }
  aside .side-inner {
    padding: 30px 0;
    height: 100vh;
    overflow-y: scroll;
    -webkit-overflow-scrolling: touch; }
    aside .side-inner .profile {
      margin-left: auto;
      margin-right: auto;
      text-align: center;
      margin-bottom: 30px;
      padding-bottom: 30px;
      border-bottom: 1px solid #efefef; }
      aside .side-inner .profile img {
        width: 80px;
        margin: 0 auto 20px auto;
        border-radius: 50%; }
      aside .side-inner .profile .name {
        font-size: 18px;
        margin-bottom: 0; }
      aside .side-inner .profile .country {
        font-size: 14px;
        color: #cfcfcf; }
    aside .side-inner .counter {
      margin-bottom: 30px;
      padding-bottom: 30px;
      border-bottom: 1px solid #efefef;
      text-align: center; }
      aside .side-inner .counter div .number {
        display: block;
        font-size: 20px;
        color: #000; }
      aside .side-inner .counter div .number-label {
        color: #cfcfcf; }
    aside .side-inner .nav-menu ul, aside .side-inner .nav-menu ul li {
      padding: 0;
      margin: 0px;
      list-style: none; }
    aside .side-inner .nav-menu ul li a {
      display: block;
      padding-left: 30px;
      padding-right: 30px;
      padding-top: 10px;
      padding-bottom: 10px;
      color: #8b8b8b;
      position: relative;
      -webkit-transition: .3s padding-left ease;
      -o-transition: .3s padding-left ease;
      transition: .3s padding-left ease; }
      aside .side-inner .nav-menu ul li a:before {
        content: "";
        position: absolute;
        left: 0;
        top: 0;
        bottom: 0;
        width: 0px;
        background-color: #ff7315;
        opacity: 0;
        visibility: hidden;
        -webkit-transition: .3s opacity ease, .3s visibility ease, .3s width ease;
        -o-transition: .3s opacity ease, .3s visibility ease, .3s width ease;
        transition: .3s opacity ease, .3s visibility ease, .3s width ease; }
      aside .side-inner .nav-menu ul li a:active, aside .side-inner .nav-menu ul li a:focus, aside .side-inner .nav-menu ul li a:hover {
        outline: none; }
      aside .side-inner .nav-menu ul li a:hover {
        background: #fcfcfc;
        color: #000; }
        aside .side-inner .nav-menu ul li a:hover:before {
          width: 4px;
          opacity: 1;
          visibility: visible; }
    aside .side-inner .nav-menu ul li.active a {
      background: #fcfcfc;
      color: #000; }
      aside .side-inner .nav-menu ul li.active a:before {
        opacity: 1;
        visibility: visible;
        width: 4px; }

main {
  width: calc(100%); }
  main .post-entry {
    margin-bottom: 30px; }
    main .post-entry .custom-thumbnail {
      -webkit-box-flex: 0;
      -ms-flex: 0 0 80px;
      flex: 0 0 80px;
      margin-right: 30px; }
  main .post-content h3 {
    font-size: 18px; }
  main .post-content .post-meta {
    font-size: 15px;
    color: #ccc; }

/* Burger */
.burger {
  width: 28px;
  height: 32px;
  cursor: pointer;
  position: relative;
  z-index: 99;
  float: right; }

.burger:before, .burger span, .burger:after {
  width: 100%;
  height: 2px;
  display: block;
  background: #000;
  border-radius: 2px;
  position: absolute;
  opacity: 1; }

.burger:before, .burger:after {
  -webkit-transition: top 0.35s cubic-bezier(0.23, 1, 0.32, 1), opacity 0.35s cubic-bezier(0.23, 1, 0.32, 1), background-color 1.15s cubic-bezier(0.86, 0, 0.07, 1), -webkit-transform 0.35s cubic-bezier(0.23, 1, 0.32, 1);
  transition: top 0.35s cubic-bezier(0.23, 1, 0.32, 1), opacity 0.35s cubic-bezier(0.23, 1, 0.32, 1), background-color 1.15s cubic-bezier(0.86, 0, 0.07, 1), -webkit-transform 0.35s cubic-bezier(0.23, 1, 0.32, 1);
  -o-transition: top 0.35s cubic-bezier(0.23, 1, 0.32, 1), transform 0.35s cubic-bezier(0.23, 1, 0.32, 1), opacity 0.35s cubic-bezier(0.23, 1, 0.32, 1), background-color 1.15s cubic-bezier(0.86, 0, 0.07, 1);
  transition: top 0.35s cubic-bezier(0.23, 1, 0.32, 1), transform 0.35s cubic-bezier(0.23, 1, 0.32, 1), opacity 0.35s cubic-bezier(0.23, 1, 0.32, 1), background-color 1.15s cubic-bezier(0.86, 0, 0.07, 1);
  transition: top 0.35s cubic-bezier(0.23, 1, 0.32, 1), transform 0.35s cubic-bezier(0.23, 1, 0.32, 1), opacity 0.35s cubic-bezier(0.23, 1, 0.32, 1), background-color 1.15s cubic-bezier(0.86, 0, 0.07, 1), -webkit-transform 0.35s cubic-bezier(0.23, 1, 0.32, 1);
  -webkit-transition: top 0.35s cubic-bezier(0.23, 1, 0.32, 1), -webkit-transform 0.35s cubic-bezier(0.23, 1, 0.32, 1), opacity 0.35s cubic-bezier(0.23, 1, 0.32, 1), background-color 1.15s cubic-bezier(0.86, 0, 0.07, 1);
  content: ""; }

.burger:before {
  top: 4px; }

.burger span {
  top: 15px; }

.burger:after {
  top: 26px; }

/* Hover */
.burger:hover:before {
  top: 7px; }

.burger:hover:after {
  top: 23px; }

/* Click */
.burger.active span {
  opacity: 0; }

.burger.active:before, .burger.active:after {
  top: 40%; }

.burger.active:before {
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=5);
  /*for IE*/ }

.burger.active:after {
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=-5);
  /*for IE*/ }

.burger:focus {
  outline: none; }

</style>