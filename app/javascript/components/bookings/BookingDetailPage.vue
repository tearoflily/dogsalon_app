<template>
<v-app>

   <table>
      <tbody>
        <tr>
          ★
          <td>{{ booking.start_date_time }}</td>
          <td>{{ booking.end_date_time }}</td>
          
          <td>{{ booking.booking_shop_comment }}</td>
          <td>{{ booking.customer_id }}</td>
          <td>{{ booking.pet_id }}</td>
          <td>{{ booking.menu_id }}</td>
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
      booking: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/bookings/${this.$route.params.id}.json`)
      .then(response => (this.booking = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
