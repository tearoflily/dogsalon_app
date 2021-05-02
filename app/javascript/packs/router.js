import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../components/Home.vue';
import BookingIndexPage from '../components/bookings/BookingIndexPage.vue';
import BookingDetailPage from '../components/bookings/BookingDetailPage.vue';
import BookingNew from '../components/bookings/BookingNew.vue';



Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    { path: '/',
      component: Home },
    { path: '/employees/bookings/',
      component: BookingIndexPage },
    { path: '/employees/bookings/:id(\\d+)',
      name: 'BookingDetailPage',
      component: BookingDetailPage },
    { path: '/employees/bookings/new/',
      name: 'BookingNew',
      component: BookingNew }
  ]
})



