
<template>
  <v-app id="app">
    <v-row justify="center" align-content="center" class="text-caption">
      <table class="table table-bordered col-10 pets_index" v-for="p in pets" :key="p.customer.id">
        <tbody>
         
            <tr>
              <th>顧客名</th>
              <td colspan="2">{{ p.customer.last_name }} {{ p.customer.first_name }} 様</td>
               <th>ペット名</th>
               <td colspan="2">{{ p.pet_name }}
                 <span v-if="p.gender == 'オス'">くん</span>
                 <span v-else-if="p.gender == 'メス'">ちゃん</span>
                 <span v-else></span>
               </td>
               <td rowspan="2">
                 <router-link :to="{ name: 'PetDetailPage', params: { id: p.id} }"><v-btn rounded color="primary" dark>詳細</v-btn></router-link>
                </td> 
            </tr>
            <tr>
              <th>前回来店日時</th>
              <td colspan="2">
                {{ p.bookings.start_last_booking | moment }}
              </td>
              <th>前回メニュー</th>
              <td colspan="2">
                 <span v-for="(b ,i) in p.bookings" :key="b.id" >
                <span v-if="i === 0">
                 aaaaaaaaaaaaaaaaaa
                </span>
              </span>
              </td>

            </tr>
           
        
        </tbody>
      </table>
    </v-row>
  </v-app>
</template>

<script>
// axiosを読み込む
import axios from 'axios';
import moment from 'moment';


export default {
  data() {
    return {
      pets: [],
    }
  },

  mounted() {
    axios
      .get('/api/v1/pets.json')
      .then(response => (this.pets = response.data))
      .then(function(bookings) {
        bookings.map(function(booking) {
          booking.menus.menu_index = `${booking.menus.menu_name}`.replace(',',' / ');
        });
      })
  },

  filters: {
    moment: function (data) {
      return moment(data).format('YYYY/MM/DD HH:MM')
    }
    }


  }

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

.pets_index th {
  background-color: #f5f5f5;
  vertical-align: middle;
  text-align: center;
}

.pets_index td {
  vertical-align: middle;
  text-align: center;
}
</style>