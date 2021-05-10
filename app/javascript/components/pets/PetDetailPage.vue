<template>
  <v-app id="app">
    <v-row justify="center" align-content="center" class="text-caption">
      <table class="table table-bordered col-8 pet-detail" style="border-left:none; border-top:none;">

        <colgroup v-for="n of 10" :key="n">
          <col class="col-width">
        </colgroup>

        <tbody>
          <tr>
            <td v-for="n of 9" :key="n" colspan="1" style="border:none;"></td>
          </tr>

          <tr>
            <td colspan="4" class="table-label" style="border:none;">顧客情報</td>
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
            <td colspan="4" class="table-label" style="border:none;">申し送り備考欄</td>
          </tr>

          <tr>
            <td colspan="10" >{{p.pet.pet_comment}}</td>
          </tr>
        </tbody>
        
        <tbody>
          <tr style="border:none;">
            <td colspan="4" class="table-label" style="border:none;">過去の予約履歴</td>
          </tr>

          <tr>
            <th colspan="3">日時</th>
            <th colspan="4">メニュー</th>
            <th colspan="3">価格</th>
          </tr>
          
          <tr v-for="menus in p.menus" :key="menus.id">
              <td colspan="3">{{menus.start_last_booking | moment}}</td>
              <td colspan="4"><span v-for="m_menu_name in menus.menu_name" :key="m_menu_name.id">{{m_menu_name}}<br></span></td>
              <td  colspan="3"><span v-for="m_price in menus.price" :key="m_price.id">¥{{m_price.toLocaleString()}}円<br></span></td>
          </tr>
        </tbody>

        <tbody>
          <tr>
            <td colspan="4" class="table-label" style="border:none;">ペット一覧</td>
          </tr>

          <tr>
            <th colspan="3">ペットのお名前</th>
            <th colspan="4">年齢</th>
            <th colspan="3">犬種</th>
          </tr>

          <tr v-for="pets in p.pets" :key="pets.id">
            <td colspan="3">{{pets.pet_name}}</td>
            <td colspan="4">{{pets.birthday | birthday}}歳</td>
            <td colspan="3">{{pets.breed}}</td>
          </tr>
        </tbody>
      </table>

      <div class="pet-images col-8">
        <div class="pet-image">
          
          <div class="big-image">
            <img :src="imageSrc">
          </div>

          <div class ="small-images">

            <div class="small-image">
              <img :src="imageSrc1" @click="imgChange(1)">
            </div>

            <div class="small-image">
              <img :src="imageSrc2" @click="imgChange(2)">
            </div>

            <div class="small-image">
              <img :src="imageSrc3" @click="imgChange(3)">
            </div>

            <div class="small-image">
              <img :src="imageSrc4" @click="imgChange(4)">
            </div>

          </div>

        </div>

        <div class="pet-image-memo">
          <p>写真の手書きメモ</p>
          <textarea class="memo-form"></textarea>
        </div>

      </div>


      <table class="table table-bordered col-8 pet-detail" style="border-left:none; border-top:none;">

        <colgroup v-for="n of 10" :key="n">
          <col class="col-width">
        </colgroup>

        <tbody>
          <tr>
            <td v-for="n of 9" :key="n" colspan="1" style="border:none;"></td>
          </tr>

          <tr>
            <td colspan="4" class="table-label" style="border:none;">ペット情報</td>
          </tr>

          <tr>
            <th colspan="2">ペットのお名前</th>
            <td colspan="8">{{p.pet.pet_name}}</td>
          </tr>

          <tr>
            <th colspan="2">犬種</th>
            <td colspan="8">{{p.pet.breed}}</td>
          </tr>

          <tr>
            <th colspan="2">お誕生日</th>
            <td colspan="2">{{p.pet.birthday | moment}}</td>
            <th colspan="2">性別</th>
            <td colspan="2" style="border-right:none;">♂<input type="checkbox"></td>
            <td colspan="2" style="border-left:none;">♀<input type="checkbox"></td>
          </tr>

          <tr>
            <th colspan="2">一番最近の<br>ワクチン接種日</th>
            <td colspan="2">{{p.pet.vaccine_day | moment}}</td>
            <th colspan="2">かかりつけの<br>病院名</th>
            <td colspan="4">{{p.pet.hospital_name}}</td>
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
          <textarea class="item-form"></textarea>
        </div>

        <div class="pet-detail-item">
          <label>
            ・皮膚炎(かゆみ、湿疹など)はありますか？
          </label>
          <div class="double-check">
            <input type="checkbox"><span>なし</span>
            <input type="checkbox"><span>あり</span>
          </div>
          <textarea class="item-form"></textarea>
        </div>

        <div class="pet-detail-item">
          <label>
            ・持病(てんかんなど)はありますか？
          </label>
          <div class="double-check">
            <input type="checkbox"><span>なし</span>
            <input type="checkbox"><span>あり</span>
          </div>
            <textarea class="item-form"></textarea>
        </div>
      </div>

      <table class="table table-bordered col-8 pet-detail" style="border-left:none; border-top:none;">

        <colgroup v-for="n of 10" :key="n">
          <col class="col-width">
        </colgroup>

        <tbody>
          <tr>
            <td v-for="n of 9" :key="n" colspan="1" style="border:none;"></td>
          </tr>

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
            <td colspan="4" style="border:none;">{{p.pet.pet_name}}様</td>
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
      imageSrc: '/assets/test.jpg',
      imageSrc1: '/assets/test.jpg',
      imageSrc2: '/assets/test2.jpg',
      imageSrc3: '/assets/test3.jpg',
      imageSrc4: '/assets/test4.jpg'
    }
  },
  methods: {
    imgChange(num){
      if (num == 1){
        this.imageSrc = this.imageSrc1
      }else if (num == 2){
        this.imageSrc = this.imageSrc2
      }else if (num == 3){
        this.imageSrc = this.imageSrc3
      }else if(num == 4){
        this.imageSrc = this.imageSrc4
      }
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
    },
    birthday: function (data) {
      const birthday = {
        year: moment(data).format('YYYY'),
        month: moment(data).format('MM'),
        day: moment(data).format('DD')
      };
      var today = new Date()
      var thisYearBirthday = new Date(today.getFullYear(), birthday.month -1, birthday.day);
      var age = today.getFullYear() - birthday.year;
      if (today < thisYearBirthday){
        return age - 1
      }else{
        return age 
      }
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
.pet-images{
  display:flex;
}
.pet-image {
  width:60%;
}
.small-images{
  width:100%;
  display:flex;
  justify-content: space-around;
}
.small-image{
  width:20%;
}
.small-image img{
  width:100%;
}
.pet-image-memo{
  width:40%;
}
.memo-form{
  width:100%;
  height:300px;
  background-color: rgb(221, 236, 241);
  border:1px solid black;
}
.big-image{
  max-width:80%;
  width:100%;
  height:auto;
  position:relative;
  border: 5px solid lightgray;
  border-radius:25px;
  background-color:white;
}
.big-image:before{
  content:"";
  display:block;
  padding-top:100%;
}
.big-image img{
  width:100%;
  height:100%;
  object-fit: contain;
  border-radius:20px;
  position:absolute;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
}
</style>