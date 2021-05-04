<template>
  <v-app>
    <div>
      
          
      <input class="form-control" type="text" v-model="inputedValue">
      <p>{{ value }}</p>
      <v-sheet>
        <v-calendar :columns="1" title-position="center" @click:date="openDisplay">
            <template slot='header-title' slot-scope='props'>
              {{props.yearLabel}}年{{props.monthLabel}}
            </template>
            <template slot='day-content' slot-scope='props'>
              <div class="cell-header">
                {{ props.day.day }}
              </div>
              <div class="cell-content">
                <template
                v-if="dateList.some(date => date.ymd === dateToYYYYMMDD(props.day.date))">
                  <div
                  class="cell-content-line"
                  v-for="content in getContentFromKey(dateToYYYYMMDD(props.day.date))"
                  v-bind:key="content">
                  <button @click="openDisplay">・{{content}}</button>
                  </div>
                </template>
                <template
                v-else>
                  <div
                  class="cell-content-line">
                  <!-- <button @click="openDisplay" style="width:100%;height:100%"><font size="1">登録する</font></button> -->
                  </div>
                </template>
              </div>
          </template>
        </v-calendar>
        </v-sheet>
        <BookingOnCalenderDay ref="dlg" v-model="aaa"></BookingOnCalenderDay>
        
    </div>
  </v-app>
</template>


<script>
import BookingOnCalenderDay from './BookingOnCalenderDay.vue';


export default {
  props:{
    value: {
      type: String
    },
  },
  components: {
    BookingOnCalenderDay,
  },
  data() {
    return {
      dateList: [
        {ymd: '20210503', contents: ['髪を切る1','面談1','靴買う1']},
        {ymd: '20210504', contents: ['髪を切る2','面談2','靴買う2']},
        {ymd: '20210507', contents: ['髪を切る3','面談3','靴買う3']},
        {ymd: '20210620', contents: ['髪を切る4','面談4','靴買う4']},
        {ymd: '20210625', contents: ['髪を切る5','面談5','靴買う']},
      ]
    }
  },
  computed: {
    inputedValue: {
      get() {
        return this.value;
      },
      set(newValue) {
        this.$emit("input", newValue);
      },
    },
  },
  methods: {
    dateToYYYYMMDD: function(date) {
      let y = date.getFullYear()
      let m = ('00' + (date.getMonth()+1)).slice(-2)
      let d = ('00' + date.getDate()).slice(-2)
      let result = y + '' + m + '' + d
      return result
    },
    getContentFromKey: function(key) {
      const target = this.dateList.find((date) => {
        return (date.ymd === key)
      })
      return target.contents
    },
    dayClick: function() {

    },
    openDisplay(date) {
      this.$refs.dlg.isDisplay = true
    },
  }
};
</script>
