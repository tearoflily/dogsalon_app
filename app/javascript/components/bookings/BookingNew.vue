<template>
  <v-app>
    <div class="row">

      <div class="col-md-8 offset-md-2">
        <div class="row">
          <div :class="navigationCss(1)">予約日時選択</div>
          <div :class="navigationCss(2)">顧客/ペット選択</div>
          <div :class="navigationCss(3)">メニュー選択</div>
          <div :class="navigationCss(4)">確認画面</div>
        </div>
      </div>
    <div class="col-md-6 offset-md-3 mb-5">
      <div><pre>●開始時間：{{ params.start_date_time }}●</pre></div>
      <div><pre>●終了時間：{{ params.end_date_time }}●</pre></div>
      <div><pre>●ペットID：{{ params.pet_id }}●</pre></div>
      <div><pre>●ペット犬種：{{ breed }}●</pre></div>
      <div><pre>●メニューID：{{ params.menu_id }}●</pre></div>
      <div><pre>●今回の予約に関するコメント：{{ params.booking_shop_comment }}</pre></div>
    </div>

      <div class="col-md-10 offset-md-1" v-if="page==1">
        
        <h1>予約日時を選択する</h1>
        <div class="form-group">
          <booking-on-calender v-model="params.name" @set-time-event-child="parentMethod"></booking-on-calender>
        </div>
 
      </div>

      <div class="col-md-8 offset-md-2" v-if="page==2">
        <h1>顧客/ペット選択</h1>
        <div class="form-group">
          <v-form :model="query">
          <v-text-field label="名前(姓)" v-model="query.last_name_eq" placeholder="名前(姓)"></v-text-field>
          <v-text-field label="携帯電話" v-model="query.mobilephone_eq" placeholder="携帯電話"></v-text-field>
          </v-form>
      <v-btn type="primary" @click="search">search</v-btn>

      <table class="table table-bordered col-10 booking_index" outlined v-for="pet in pets" :key="pet.pet_id">
        <tr>
          <td>{{ pet.name }} [{{ pet.pet_breed }}]</td>
          <td rowspan="2"><v-btn type="primary" @click="pet_select(pet.pet_id, pet.pet_breed)">選択</v-btn></td>
        </tr>
        <tr>
          <td>{{ pet.pet_comment }}</td>
        </tr>
      </table>


        </div>
 
      </div>

      <div class="col-md-8 offset-md-2" v-if="page==3">
        
        <h1>メニュー選択画面(複数選択可にする！)</h1>
        {{ menu_id }}
        <div class="form-group">


        <table class="table table-bordered col-10 booking_index" outlined v-for="menu in menus" :key="menu.id">
          <tr>
            <td>{{ menu.menu_name }} [{{ menu.breed }}]　</td>
            <td rowspan="2">
              <input type="checkbox" v-model="params.menu_id" v-bind:value="menu.id">チェエクボックス{{ menu.id }}
            </td>
          </tr>
          <tr>
            <td>金額：{{ menu.price }}　メニューの作業時間目安：{{ menu.working_hours }}</td>
          </tr>
        </table>




        <h1>特記事項</h1>
        <div>
    
          <v-textarea
            v-model="params.booking_shop_comment"
            color="teal"
          >
            <template v-slot:label>
              <div>
                今回の予約に関する特記事項
              </div>
            </template>
          </v-textarea>
  


        </div>

         <v-btn type="primary" @click="menu_select_done()">次へ</v-btn>
        </div>
      </div>


             


      <div class="col-md-8 offset-md-2" v-if="page==4">
        
        <h1>予約内容の確認画面</h1>
        <div class="form-group">

           <div class="col-md-6 offset-md-3 mb-5">
              <div><pre>開始時間：{{ params.start_date_time }}</pre></div>
              <div><pre>終了時間：{{ params.end_date_time }}</pre></div>
              <div><pre>ペットID：{{ params.pet_id }}</pre></div>
              <div><pre>ペット犬種：{{ breed }}</pre></div>
              <div><pre>メニューID：{{ params.menu_id }}</pre></div>
              <div><pre>今回の予約に関するコメント：{{ params.booking_shop_comment }}</pre></div>
            </div>
            <v-btn type="primary" @click="create_bookings()">送信</v-btn>

      
        
        </div>
      </div>


      <div class="col-md-4 offset-md-4 pt-5">
        <button class="btn btn-secondary float-right"
        type="button" v-if="page<4" @click="next">次へ</button>
        <button class="btn btn-secondary float-right"
        type="button" v-if="page==4" @click="submit">送信する</button>
        <button class="btn btn-secondary float-right"
        type="button" v-if="page>1" @click="prev">戻る</button>
      </div>

    </div>
  </v-app>
</template>

<script>
import axios from 'axios'
import qs from 'qs'
import BookingOnCalender from './BookingOnCalender.vue';


export default {
    components: { BookingOnCalender },
    data: function () {
      return {
        page: 1,
        params: {
        start_date_time: '',
        end_date_time: '',
        customer_id: '',
        pet_id: '',
        menu_id: [],
        booking_shop_comment: '',
        },
        query: {
        last_name_eq: null,
        mobilephone_eq: null
        },
        pets: [],
        menus: [],
        start_end_time: '',
        breed: '',
      }
    },
   
    methods: {
      next() {
        this.page++;
      },
      prev() {
        this.page--;
      },
      submit() {
        // const url = 'http://localhost:3000/';
        // axios.post(url, this.params)
        // .then((response) => {

        // });
      },
      navigationCss(targetPage) {
        if(this.page === targetPage) {
          return ['col-3', 'text-center', 'text-white', 'bg-info', 'p-2'];
        }
        return ['col-3', 'text-center', 'text-secondary', 'p-2'];
      },
      parentMethod(payload) {
        this.params.start_date_time = payload.start;
        this.params.end_date_time = payload.end;
        this.next();
      },
      pet_select(pet_id, breed) {
        this.params.pet_id = pet_id;
        this.breed = breed;
        this.menu_all(breed);
        this.next();
      },
      menu_select_done() {
        this.next();
      },
      create_bookings() {
      axios.post('/api/v1/bookings', {
        params: this.params
        
      })
      .then(response => {
        alert("登録が完了しました");
        this.$router.push({path:'/employees/bookings/'});
        })
      .catch((error) => {
        console.log(error);
      })
      },
      menu_all: function(breed){
        axios.get('/api/v1/bookings/menus', {
        params: {
          breed: breed
        }
      })
      .then(response => (this.menus = response.data))
      },
      search: function(){
      axios.get('/api/v1/bookings/new', {
        params: {
          q: this.query
        },
        paramsSerializer: function(params) {
          return qs.stringify(params, {arrayFormat: 'brackets'})
        }
      })
      .then(response => (this.pets = response.data))
      .catch((error) => {
        console.log(error);
      })
    }
    }
  };
</script>
