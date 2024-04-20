<script setup>
import SidebarMenu from '@/components/SidebarMenu.vue'
</script>

<template>
  <div class="row m-0 p-0 h6" style="height:1500px">
    <section class="row m-0 p-0 col-12 col-lg-3">
      <SidebarMenu/>
    </section>
    <section class="row m-0 p-0 py-5 col-12 col-lg-9 align-items-start">
      <router-view></router-view>  
    </section>
  </div>
</template>

<style scoped lang="scss">
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
