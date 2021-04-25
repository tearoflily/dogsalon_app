<template>
  <v-app>
    <v-row justify="center">
      <!-- <BookingCalendar /> -->
      <v-form @submit.prevent="createBooking">
          <v-card width="400" tile light>
              <v-card-title>予約新規登録画面</v-card-title>
              <v-card-text>
                <div v-if="errors.length != 0">
                  <ul v-for="e in errors" :key="e">
                    <li><font color="red">{{ e }}</font></li>
                  </ul>
                </div>

    

                <div>
                  <v-text-field v-model="booking.start_date_time" 
                    label="開始日時" outlined clearable></v-text-field>
                  <v-text-field v-model="booking.end_date_time" 
                    label="終了日時" outlined clearable></v-text-field>
                  <v-text-field v-model="booking.booking_shop_comment" 
                    label="店舗コメント" outlined clearable></v-text-field>
                  <v-text-field v-model="booking.customer_id" 
                    label="カスタマーID" outlined clearable></v-text-field>
                  <v-text-field v-model="booking.pet_id" 
                    label="ペットID" outlined clearable></v-text-field>
                  <v-text-field v-model="booking.menu_id" 
                    label="メニューID(複数可能)" outlined clearable></v-text-field>
                </div>
                
              </v-card-text>
              <v-catd-actions>
                <v-btn color="primary" block type="submit">送信</v-btn>
              </v-catd-actions>
          </v-card>
      </v-form>
    </v-row>
  </v-app>
</template>

<script>
import axios from 'axios';

// import BookingCalendar from './BookingCalendar';

export default {
  components: {

    // BookingCalendar

  },
  data: function () {
    return {
      booking: {
        start_date_time: '',
        end_date_time: '',
        booking_shop_comment: '',
        customer_id: '',
        pet_id: '',
        menu_id: ''
      },
      errors: ''
    }
  },

  
  methods: {
    createBooking: function() {
      axios
        .post('/api/v1/bookings/create', this.booking)
        .then(response => {
          let e = responese.data;
          this.$router.push({ name: 'BookingDetailPage', params: { id: e.id} });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }

        });
    }
  }



};

</script>