<template>
<v-app>
  <v-row justify="center" align-content="center" class="text-caption">

    
    
    <v-card width="80%" height="40%">
    <v-form :model="booking">
      <tr>

            <td>顧客名</td>
            <td colspan="4">{{ booking.last_name }} 様({{ booking.pet_name }} <span v-if="booking.pet_gender == 'オス'">くん</span>
                  <span v-else-if="booking.pet_gender == 'メス'">ちゃん</span>
                  <span v-else></span>)</td>
      </tr>
      <tr>
            <td width="20%">開始日時</td>
      
            <td width="10%">日付</td>
            <td>
               <v-menu v-model="menu_start" offset-y :close-on-content-click="true">
                  <template v-slot:activator="{ on }">
                    <v-btn icon color="primary" dark elevation="0" v-on="on">
                      {{ booking.start_day }}<v-icon>mdi-calendar</v-icon>
                    </v-btn>
                  </template>
                  <v-date-picker v-model="booking.start_day" @click="menu_start = false"/>
                </v-menu>
            </td>
            <td width="10%">時間</td>
            <td>
              <vue-timepicker v-model="booking.start_time" :hour-range="[[7, 22]]" minute-interval="30" hide-disabled-hours auto-scroll close-on-complete></vue-timepicker> 

            </td>
      </tr>
      <tr>
            <td>終了日時</td>
            <td>日付</td>
            <td>
                <v-menu v-model="menu_end" offset-y :close-on-content-click="true">
                  <template v-slot:activator="{ on }">
                    <v-btn icon color="primary" dark elevation="0" v-on="on">
                      {{ booking.end_day }}<v-icon>mdi-calendar</v-icon>
                    </v-btn>
                  </template>
                  <v-date-picker v-model="booking.end_day" @click="menu_end = false"/>
                </v-menu>

            </td>
            <td>時間</td>
            <td>
              <vue-timepicker v-model="booking.end_time" :hour-range="[[7, 22]]" minute-interval="30" hide-disabled-hours auto-scroll close-on-complete></vue-timepicker> 
            </td>
      </tr>
      <tr>
            <td>今回の予約に関する備考欄</td>
            <td colspan="4">
              <v-text-field label="名前(姓)" v-model="booking.booking_shop_comment" placeholder="ショップコメント"></v-text-field>
            </td>
      </tr>
    
    </v-form>
      <v-btn type="primary" @click="submit(booking.id)">変更を保存</v-btn>
    </v-card>


      
    <!-- <form @submit="submit">
      <table class="table table-bordered col-8 booking_index" outlined>
        <tbody>
          <tr>
            <td>顧客名</td>
            <td colspan="4">{{ booking.last_name }} 様({{ booking.pet_name }} <span v-if="booking.pet_gender == 'オス'">くん</span>
                  <span v-else-if="booking.pet_gender == 'メス'">ちゃん</span>
                  <span v-else></span>)</td>
          </tr>
          <tr>
            <td width="20%">開始日時</td>
            <td width="10%">日付</td>
            <td></td>
            <td width="10%">時間</td>
            <td></td>
          </tr>
          <tr>
            <td>終了日時</td>
            <td>日付</td>
            <td></td>
            <td>時間</td>
            <td></td>
          </tr>
          <tr>
            <td>今回の予約に関する備考欄</td>
            <td colspan="4"></td>
          <input type="text" colspan="4" v-model="booking.booking_shop_comment">
          </tr>
        </tbody>
      </table>
    </form> -->
  </v-row>
 aa{{ aa }} --- bb{{ bb }} --- cc{{ cc }} ---
{{ booking }}



</v-app>

 
</template>

<script>
import axios from 'axios'
import dayjs from 'dayjs'
import 'dayjs/locale/ja'
dayjs.locale(`ja`)
import VueTimepicker from 'vue2-timepicker'
import 'vue2-timepicker/dist/VueTimepicker.css'

var objectSupport = require("dayjs/plugin/objectSupport");
dayjs.extend(objectSupport);

export default {
  components: {
      VueTimepicker
    },
  data: function () {
    return {
      booking: {},
      menu_start: false,
      menu_end: false,
      aa: '',
      bb: '',
      cc: '',
      
    }
  },
  mounted () {
    axios
      .get(`/api/v1/bookings/${this.$route.params.id}/edit`)
      .then(response => (this.booking = response.data))    
  },
  computed: {
    picker: {
      get() {
        return this.value;

      },
      set(val) {
        this.menu_start = false;
        this.menu_end = false;
        this.$emit("input", val);

      }
    }
  },
  methods: {


    submit: function(id){
      const end_day_str = dayjs(this.booking.end_day).format('YYYY-MM-DD');
      const end_yy = end_day_str.slice(0, 4);
      const end_mo = end_day_str.slice(5, 7);
      const end_da = end_day_str.slice(8, 10);
      const end_time_str = this.booking.end_time.toString();
      const end_ho = end_time_str.slice(0, 2);
      const end_min = end_time_str.slice(3, 5);
    
      this.aa = dayjs({
        year: end_yy,
        month: end_mo,
        day: end_da,
        hour: end_ho,
        minute: end_min
      });
      // タイムゾーンが必要かも　↑は消さない

   
      
      axios
      .patch(`/api/v1/bookings/${id}/edit`, {
        params: {
          q: this.query
        }
        }
        )


    },

  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
