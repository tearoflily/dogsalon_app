<template>
  <v-app id="app">
    <v-row justify="center" align-content="center" class="text-caption">
      <table class="table table-bordered col-8 pet-detail" style="border-left:none; border-top:none;">

        <colgroup v-for="n of 10" :key="n">
          <col class="col-width">
        </colgroup>

        <tbody style="border:none;">
          <tr style="border:none;">
            <td v-for="n of 9" :key="n" colspan="1" style="border:none;"></td>
          </tr>
        </tbody>

        <tbody>
          <tr>
            <th colspan="2">ふりがな</th>
            <td colspan="8" >{{ p[0].customer.furigana_last_name }} {{ p[0].customer.furigana_first_name }}様</td>
          </tr>

          <tr>
            <th colspan="2">顧客名</th>
            <td colspan="8">{{ p[0].customer.last_name }} {{ p[0].customer.first_name }}様</td>
          </tr>

          <tr>
            <th colspan="2" rowspan="2">住所</th>
            <td colspan="8" style="border-bottom:none;">{{ p[0].customer.postcode }}</td>
          </tr>

          <tr>
            <td colspan="8" style="border-top:none;">{{ p[0].customer.address }}</td>
          </tr>

          <tr>
              <th colspan="2">ご連絡先</th>
              <td colspan="4" style="border-right:none;">ご自宅 {{ p[0].customer.homephone }}</td>
              <td colspan="4" style="border-left:none;">携帯電話 {{ p[0].customer.mobilephone }}</td>
          </tr>
        </tbody>

        <tbody>
          <tr>
            <td colspan="4" class="table-label" style="border:none;">申し送り備考欄</td>
          </tr>

          <tr>
            <td colspan="10" >{{p[0].pet_comment}}</td>
          </tr>
        </tbody>
        
        <tbody>
          <tr style="border:none;">
            <td colspan="4" class="table-label" style="border:none;">過去の予約履歴</td>
          </tr>

          <tr>
            <th colspan="3">日時</th>
            <th colspan="3">メニュー</th>
            <th colspan="4">価格</th>
          </tr>

          <tr v-for="b in p[0].bookings" :key="b.id">
            <td colspan="3">{{b.start_last_booking | moment}}</td>
            <td colspan="3">{{b.start_last_booking | moment}}</td>
            <td colspan="4">{{b.start_last_booking | moment}}</td>
          </tr>
        </tbody>

        <tbody>
          <tr style="border:none;">
            <td colspan="4" class="table-label" style="border:none;">ペット一覧</td>
          </tr>

          <tr>
            <th colspan="3">ペットのお名前</th>
            <th colspan="3">年齢</th>
            <th colspan="4">犬種</th>
          </tr>

          <tr v-for="pets in p[1]" :key="pets.id">
            <td colspan="3">{{pets.pet_name}}</td>
            <td colspan="3">{{pets.birthday | moment}}</td>
            <td colspan="4">{{pets.breed}}</td>
          </tr>
        </tbody>

        <tbody>
          <tr style="border:none;">
            <td colspan="4" class="table-label" style="border:none;">ペット情報</td>
          </tr>

          <tr>
            <th colspan="2">ペットのお名前</th>
            <td colspan="8">{{p[0].pet_name}}</td>
          </tr>

          <tr>
            <th colspan="2">犬種</th>
            <td colspan="8">{{p[0].breed}}</td>
          </tr>

          <tr>
            <th colspan="2">お誕生日</th>
            <td colspan="2">{{p[0].birthday | moment}}</td>
            <th colspan="2">性別</th>
            <td colspan="2" style="border-right:none;">♂<input type="checkbox"></td>
            <td colspan="2" style="border-left:none;">♀<input type="checkbox"></td>
          </tr>

          <tr>
            <th colspan="2">一番最近の<br>ワクチン接種日</th>
            <td colspan="2">{{p[0].vaccine_day | moment}}</td>
            <th colspan="2">かかりつけの<br>病院名</th>
            <td colspan="4">{{p[0].hospital_name}}</td>
          </tr>
        </tbody>
      </table>

      <div class="pet-detail-form col-8">
        <div  colspan="8" class="pet-detail-item">
          <label>
            ・ノミ・ダニはいますか？ ※もしいた場合、追加料金¥1,000円をいただく場合がございます。
          </label>
          <div class="double-check">
            <input type="checkbox"><span>なし</span>
            <input type="checkbox"><span>あり</span>
          </div>
          <input type="text-area" class="item-form">
        </div>

        <div class="pet-detail-item">
          <label>
            ・皮膚炎(かゆみ、湿疹など)はありますか？
          </label>
          <div class="double-check">
            <input type="checkbox"><span>なし</span>
            <input type="checkbox"><span>あり</span>
          </div>
          <input type="text-area" class="item-form">
        </div>

        <div class="pet-detail-item">
          <label>
            ・持病(てんかんなど)はありますか？
          </label>
          <div class="double-check">
            <input type="checkbox"><span>なし</span>
            <input type="checkbox"><span>あり</span>
          </div>
            <input type="text-area" class="item-form">
        </div>
      </div>

      <table class="table table-bordered col-8 pet-detail" style="border-left:none; border-top:none;">

        <colgroup v-for="n of 10" :key="n">
          <col class="col-width">
        </colgroup>

        <tbody style="border:none;">
          <tr style="border:none;">
            <td v-for="n of 9" :key="n" colspan="1" style="border:none;"></td>
          </tr>
        </tbody>

        <tbody>
          <tr>
            <th colspan="1" rowspan="5" >ア<br>ン<br>ケ<br>|<br>ト</th>
            <td colspan="9" style="border-bottom:none;">ペットサロンCOROTIAをどこで知りましたか？</td>
          </tr>

          <tr>
            <td colspan="3" style="border:none;"><input type="checkbox">インターネット</td>
            <td colspan="3" style="border:none;"><input type="checkbox">お店の前を通って</td>
            <td colspan="4" style="border:none;"></td>
          </tr>

          <tr>
            <td colspan="3" style="border:none;"><input type="checkbox">チラシ告知</td>
            <td colspan="3" style="border:none;"><input type="checkbox">ご紹介</td>
            <td colspan="4" style="border:none;">{{p[0].pet_name}}様</td>
          </tr>

          <tr>
            <td colspan="9" style="border-bottom:none;">トリマーに伝えておきたいことがありましたらご記入ください</td>
          </tr>

          <tr>
            <td colspan="9" style="border-top:none;"><input type="text-area"></td>
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
      p: [],
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
.col-width{
  width:10%;
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
.pet-detail-item{
  width:100%;
}
.item-form{
  width:100%;
  border:1px solid black;
  border-radius: 5px;
}
</style>