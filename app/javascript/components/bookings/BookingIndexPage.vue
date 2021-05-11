<template>

  <v-app id="app">
  <router-link :to="{ name: 'BookingNew' }"><v-btn rounded color="primary" dark>新規予約</v-btn></router-link>
  <v-card width="300px">
    <v-form :model="query">
        <v-text-field label="名前(姓)" v-model="query.last_name_eq" placeholder="名前(姓)"></v-text-field>
        <v-text-field label="携帯電話" v-model="query.mobilephone_eq" placeholder="携帯電話"></v-text-field>
  
    </v-form>
    <v-btn type="primary" @click="search">search</v-btn>
  </v-card>
    <v-row justify="center" align-content="center" class="text-caption">
        <table class="table table-bordered col-10 booking_index" outlined v-for="b in bookings" :key="b.id">
          <tbody>
  
           <tr>
       
          
              <th>顧客名</th>
              <td colspan="2">{{ b.last_name }} 様</td>
              <th>ペット名</th>
              <td colspan="2">
                {{ b.pet_name }} <span v-if="b.pet_gender == 'オス'">くん</span>
                <span v-else-if="b.pet_gender == 'メス'">ちゃん</span>
                <span v-else></span>
                </td>
            </tr>
            <tr>
              <th>メニュー</th>
              <td colspan="2">{{ b.menus.menu_and_price }}</td>
              <th>電子カルテ</th>
              <td colspan="2">確認ボタン</td>
            </tr>
            <tr>
              <th>同意書記入</th>
              <td colspan="2">済み・未　確認ボタン</td>
              <th>顧客情報記入</th>
              <td colspan="2">済み・未　確認ボタン</td>
            </tr>
            <tr>
              <th>予約日時</th>
              <td>{{ b.start_date_time }}〜{{ b.end_date_time }}</td>
              <th>前回来店日時</th>
              <td v-if="b.start_last_booking == 'Invalid Date'"></td>
              <td v-else>{{ b.start_last_booking }}〜{{ b.end_last_booking }}</td>
              <th>今回ご請求予定金額</th>
              <td>{{ b.menus.menu_sum_price }}</td>
            </tr>
            <tr>
              <th>ショップ備考欄</th>
              <td colspan="3">{{ b.booking_shop_comment }}</td>
              <td><router-link :to="{ name: 'BookingDetailPage', params: { id: b.id} }"><v-btn rounded color="primary" dark>編集</v-btn></router-link></td>
              <td><v-btn rounded color="primary" dark @click="delete_booking(b.id)">削除</v-btn></td>
            </tr>
          </tbody>
        </table>
    </v-row>

  </v-app>
</template>

<script>
import axios from 'axios'
import dayjs from 'dayjs'
import 'dayjs/locale/ja'
dayjs.locale(`ja`)
import qs from 'qs'



export default {
  data: function () {
    return {
      bookings: [],
      query: {
        last_name_eq: null,
        mobilephone_eq: null
      }
    }
  },
  created: function () {
    this.search()
  },
  methods: {
    // notify: function(msg){
    //   this.$notify({
    //     type: 'error',
    //     title: 'Error',
    //     message: msg
    //   });
    // },
    delete_booking: function(id){
      if(confirm('削除してよろしいですか？'))
      axios.delete(`/api/v1/bookings/${id}`)
        // paramsSerializer: function(params) {
        //   return qs.stringify(params, {arrayFormat: 'brackets'})
        // }
      .then(response => {
        alert("削除が完了しました");
        this.search();
        })
      .catch((error) => {
        console.log(error);
      })
    },
    search: function(){
      axios.get('/api/v1/bookings', {
        params: {
          q: this.query
        },
        paramsSerializer: function(params) {
          return qs.stringify(params, {arrayFormat: 'brackets'})
        }
      })
      .then(response => (this.bookings = response.data))
      .then(function(bookings) {
        bookings.map(function(booking) {
          booking.start_date_time = dayjs(booking.start_date_time).format('YYYY/M/D/H:mm');
          booking.end_date_time = dayjs(booking.end_date_time).format('YYYY/M/D/H:mm');
          booking.start_last_booking = dayjs(booking.start_last_booking).format('YYYY/M/D/H:mm');
          booking.end_last_booking = dayjs(booking.end_last_booking).format('YYYY/M/D/H:mm');
          booking.menus.menu_and_price = `${booking.menus.menu_name}`.replace(',',' / ');
          let sum_price = booking.menus.menu_price;
          let total = sum_price.reduce(function(sum, element){
            return sum + element;
          },0);
          booking.menus.menu_sum_price = `${total.toLocaleString('ja-JP')}円`;
        });
      })
      .catch((error) => {
        console.log(error);
      })
    }
  }

}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

.booking_index th {
  background-color: #f5f5f5;
  vertical-align: middle;
}

.booking_index td {
  vertical-align: middle;
}
</style>
