<template>
  <v-app id="app">
    <table>
      <tbody>
        <tr v-for="b in bookings" :key="b.id">
          <td><router-link :to="{ name: 'BookingDetailPage', params: { id: b.id} }">{{ b.id }}</router-link></td>
          <td>{{ b.start_date_time }}</td>
          <v-btn>vuetifyボタン</v-btn>
          <td>{{ b.end_date_time }}</td>
          <td>{{ b.booking_shop_comment }}</td>
          <td>{{ b.customer_id }}</td>
          <td>{{ b.pet_id }}</td>
          <td>{{ b.menu_id }}</td>
        </tr>
      </tbody>
    </table>
  </v-app>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      bookings: []
    }
  },
  mounted () {
    axios
      .get('/api/v1/bookings.json')
      .then(response => (this.bookings = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
