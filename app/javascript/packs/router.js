import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../components/Home.vue'
import BookingIndexPage from '../components/bookings/BookingIndexPage.vue'
import BookingDetailPage from '../components/bookings/BookingDetailPage.vue'



Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    { path: '/',
      component: Home },
    { path: '/employees/bookings/index',
      component: BookingIndexPage },
    { path: '/api/v1/bookings/:id(\\d+)',
      name: 'BookingDetailPage',
      component: BookingDetailPage }
  ]
})



