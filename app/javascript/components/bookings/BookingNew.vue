<template>
  <div class="row">
    <div class="col-md-6 offset-md-3 mb-5">
      <div class="row">
        <div :class="navigationCss(1)">お客様情報</div>
        <div :class="navigationCss(2)">配送情報</div>
        <div :class="navigationCss(3)">クーポン情報</div>
      </div>
    </div>

    <div class="col-md-8 offset-md-2" v-if="page==1">
      <h1>お客様情報</h1>
      <div class="form-group">
      <label>名前</label>
        <booking-on-calender v-model="params.name"></booking-on-calender>
      </div>
      <div class="form-group">
        <label>かな</label>
        <input class="form-control" type="text" v-model="params.name_kana">
        <p>{{ params.name_kana }}</p>
      </div>
    </div>

    <div class="col-md-8 offset-md-2" v-if="page==2">
      <h1>配送情報</h1>
      <div class="form-group">
        <label>住所</label>
        <input class="form-control" type="text" v-model="params.address">
        <p>{{ params.address }}</p>
      </div>
      <div class="form-group">
        <label>配達時間</label>
        <select class="form-control"  v-model="params.delivery_time">
          <option value="1">9〜10時</option>
          <option value="2">10〜11時</option>
          <option value="3">11〜12時</option>
          <option value="4">13〜14時</option>
          <option value="5">15〜16時</option>
        </select>
        <p>{{ params.delivery_time }}</p>
      </div>
    </div>

    <div class="col-md-8 offset-md-2" v-if="page==3">
      
      <h1>本予約に関するコメント欄</h1>
      <div class="form-group">
      <label>コメント</label>
        <booking-on-comment v-model="params.address"></booking-on-comment>
      </div>
    </div>


    <div class="col-md-4 offset-md-4 pt-5">
      <button class="btn btn-secondary float-right"
      type="button" v-if="page<3" @click="next">次へ</button>
      <button class="btn btn-secondary float-right"
      type="button" v-if="page==3" @click="submit">送信する</button>
      <button class="btn btn-secondary float-right"
      type="button" v-if="page>1" @click="prev">戻る</button>
    </div>

  </div>
</template>

<script>
import BookingOnCalender from './BookingOnCalender.vue';
import BookingOnComment from './BookingOnComment.vue';


export default {
    components: { BookingOnCalender, BookingOnComment },
    data: function () {
      return {
        page: 1,
        params: {
          name: '名前を入力してください',
          name_kana: 'かなを入力してください',
          address: '住所を入力してください',
          delivery_time: '時間帯を入力してください',
          coupon_code: 'コードを入力してください'
        },
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
          return ['col-4', 'text-center', 'text-white', 'bg-info', 'p-2'];
        }
        return ['col-4', 'text-center', 'text-secondary', 'p-2'];
      }
    }
  };
</script>
