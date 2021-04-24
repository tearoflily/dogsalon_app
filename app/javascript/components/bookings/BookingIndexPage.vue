<template>

  <v-app id="app">
    <v-row justify="center" class="text-caption">
        <table class="table table-bordered col-10 booking_index" outlined v-for="b in bookings" :key="b.id">
          <tbody>
  
           <tr>
       
          
              <th>顧客名</th>
              <td colspan="2">{{ b.last_name }} 様</td>
              <th>ペット名</th>
              <td colspan="2">{{ b.pet_name }}</td>
            </tr>
            <tr>
              <th>メニュー</th>
              <td colspan="2">{{ b.menus.menu_name }}{{ b.menus.menu_price }}</td>
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
              <td>{{ b.start_date_time }}</td>
              <th>前回来店日時</th>
              <td>'20/12/02</td>
              <th>価格</th>
              <td>¥10,000</td>
            </tr>
            <tr>
              <th>ショップ備考欄</th>
              <td colspan="3">{{ b.booking_shop_comment }}</td>
              <td><v-btn rounded color="primary" dark>編集</v-btn><router-link :to="{ name: 'BookingDetailPage', params: { id: b.id} }">{{ b.id }}</router-link></td>
              <td><v-btn text>削除</v-btn></td>
            </tr>
          </tbody>
        </table>
    </v-row>

  </v-app>
</template>

<script>
import axios from 'axios'
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
