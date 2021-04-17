<template>
  <div>
    <Header />
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import Header from './components/Header'
import BookingIndexPage from 'BookingIndexPage.vue'
import BookingDetailPage from 'BookingDetailPage.vue'

const router = new VueRouter({
  routes: [
      { path: '/',
        component: BookingIndexPage },
      { path: '/api/v1/bookings/:id(\\d+)',
        name: 'BookingDetailPage',
        component: BookingDetailPage }
  ]
})

Vue.use(VueRouter)

export default {
    router,
    components: {Header}
}

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
