<script setup>

import { onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'

import PageTitle from '@/components/PageTitle.vue'

import BackButtonGadget from '@/components/myGadgets/BackButtonGadget.vue'
import LoadingGadget from '@/components/myGadgets/LoadingGadget.vue'

import useUserStore from '@/stores/users'
import useSessionStore from '@/stores/session'

import MyAccountForm from '@/components/forms/MyAccountForm.vue'

const route = useRoute()

const userStore = useUserStore()
const sessionStore = useSessionStore()

const fetchReady = ref(false)
const targetUser = ref({})

onMounted( async () => {
    fetchReady.value = false

    targetUser.value = await userStore.FetchUserById(sessionStore.userData.id)

    //fetchReady.value = true
})

</script>

<template>
    {{ targetUser }}
  <div class="row m-0 p-0 justify-content-center justify-content-lg-start">
    <BackButtonGadget :back_to="'dashboard'"/>
  </div>
  <PageTitle
    :title="'Mi cuenta'"
  />
  <template v-if="fetchReady === false">
    <LoadingGadget />
  </template>
  <template v-else>    
    <MyAccountForm
    :targetUser = "targetUser"
    />
  </template>
</template>