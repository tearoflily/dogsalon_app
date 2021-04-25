<template>

  <v-app id="app">
    <v-row justify="center" class="text-caption">
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
              <td><v-btn text>削除</v-btn></td>
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

export default {
  data: function () {
    return {
      bookings: []
    }
  },
  mounted () {
    axios
      .get('/api/v1/bookings.json')
      .then(response => (this.bookings = response.data))
      .then(function(bookings) {
        bookings.map(function(booking) {
          booking.start_date_time = dayjs(booking.start_date_time).format('M月D日H:mm');
          booking.end_date_time = dayjs(booking.end_date_time).format('M月D日H:mm');
          booking.start_last_booking = dayjs(booking.start_last_booking).format('M月D日H:mm');
          booking.end_last_booking = dayjs(booking.end_last_booking).format('M月D日H:mm');
          booking.menus.menu_and_price = `${booking.menus.menu_name}`.replace(',',' / ');
          let sum_price = booking.menus.menu_price;
          let total = sum_price.reduce(function(sum, element){
            return sum + element;
          },0);
          booking.menus.menu_sum_price = `${total.toLocaleString('ja-JP')}円`;
        });
      })
    
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
}
</style>
