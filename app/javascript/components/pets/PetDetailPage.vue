<template>
  <v-app id="app">
    <v-row justify="center" align-content="center" class="text-caption">
      <table class="table table-bordered col-8 pet-detail" style="border-left:none; border-top:none;">

        <colgroup v-for="n of 10" :key="n">
          <col style="width:10%;">
        </colgroup>

        <tbody>
          <tr style="border:none;">
            <td colspan="2" class="table-label" style="border:none;">顧客情報</td>
            <td v-for="n of 7" :key="n" colspan="1" style="border:none;"></td>
          </tr>

          <tr>
            <th colspan="2">ふりがな</th>
            <td colspan="8" >{{ p.customer.furigana_last_name }} {{ p.customer.furigana_first_name }}様</td>
          </tr>

          <tr>
            <th colspan="2">顧客名</th>
            <td colspan="8">{{ p.customer.last_name }} {{ p.customer.first_name }}様</td>
          </tr>

          <tr>
            <th colspan="2" rowspan="2">住所</th>
            <td colspan="8" style="border-bottom:none;">{{ p.customer.postcode }}</td>
          </tr>

          <tr>
            <td colspan="8" style="border-top:none;">{{ p.customer.address }}</td>
          </tr>

          <tr>
              <th colspan="2">ご連絡先</th>
              <td colspan="4" style="border-right:none;">ご自宅 {{ p.customer.homephone }}</td>
              <td colspan="4" style="border-left:none;">携帯電話 {{ p.customer.mobilephone }}</td>
          </tr>
        </tbody>

        <tbody>
          <tr>
            <td colspan="2" class="table-label" style="border:none;">申し送り備考欄</td>
          </tr>

          <tr>
            <td colspan="10" >{{p.pet_comment}}</td>
          </tr>
        </tbody>
        
        <tbody>
          <tr style="border:none;">
            <td colspan="2" class="table-label" style="border:none;">過去の予約履歴</td>
          </tr>

          <tr>
            <th colspan="3">日時</th>
            <th colspan="3">メニュー</th>
            <th colspan="3">価格</th>
          </tr>

          <tr v-for="b in p.bookings" :key="b.id">
            <td colspan="3">{{b.start_last_booking | moment}}</td>
            <td colspan="3">{{b.start_last_booking | moment}}</td>
            <td colspan="3">{{b.start_last_booking | moment}}</td>
          </tr>
        </tbody>

        <tbody>
          <tr style="border:none;">
            <td colspan="1" class="table-label" style="border:none;">ペット一覧</td>
          </tr>

          <tr>
            <th colspan="3">ペットのお名前</th>
            <th colspan="3">年齢</th>
            <th colspan="3">犬種</th>
          </tr>

          <tr v-for="p_pets in p.cusotomer" :key="p_pets.id">
            <td colspan="3">５</td>
            <td colspan="3">5</td>
            <td colspan="3">５</td>
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
      p: {},
    }
  },

  mounted() {
    axios
      .get(`/api/v1/pets/${this.$route.params.id}.json`)
      .then(response => (this.p = response.data))
  },

  filters: {
    moment: function (data) {
      return moment(data).format('YYYY/MM/DD')
    }
    }

  }

</script>

<style scoped>

.pet-detail tbody {
  width:100%;
}

.table-label{
  font-weight:bold;
}
.pet-detail th {
  background-color: #f5f5f5;
  vertical-align: middle;
  text-align: center;
}

.pet-detail td {
  vertical-align: middle;
  text-align: left;
}
</style>