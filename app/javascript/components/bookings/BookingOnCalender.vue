<template>
  <v-app>
    <v-main>
      <div>
        {{ bookings }}
        {{ events.first }}
        <v-sheet tile height="6vh" color="grey lighten-3" class="d-flex align-center">
          <v-btn outlined small class="ma-4" @click="setToday">
            今日
          </v-btn>
          <v-btn icon @click="$refs.calendar.prev()">
            <v-icon>mdi-chevron-left</v-icon>
          </v-btn>
          <v-btn icon @click="$refs.calendar.next()">
            <v-icon>mdi-chevron-right</v-icon>
          </v-btn>
          <v-toolbar-title>{{ title }}</v-toolbar-title>
        </v-sheet>
        <v-sheet height="100vh">
          <v-calendar
            ref="calendar"
            v-model="value"
            :events="bookings"
            :event-color="getEventColor"
            locale="ja-jp"
            :day-format="(timestamp) => new Date(timestamp.date).getDate()"
            :month-format="(timestamp) => new Date(timestamp.date).getMonth() + 1 + ' /'"
            @change="getEvents"
            @click:event="showEvent"
            @click:date="viewDay"
          ></v-calendar>
        </v-sheet>
      </div>
    </v-main>
    <BookingOnCalenderDay ref="dlg" v-model="value"></BookingOnCalenderDay>
  </v-app>
</template>

<script>
import axios from 'axios'
import moment from 'moment';
import BookingOnCalenderDay from './BookingOnCalenderDay.vue';


export default {
  data: () => ({
    events: [],
    bookings: [],
    value: moment().format('yyyy-MM-DD'),
  }),
  components: {
    // BookingOnCalenderDay,
  },
  computed: {
    title() {
      return moment(this.value).format('yyyy年 M月');
    },
  },
  mounted () {
    axios.get('/api/v1/bookings/month')
    .then((response) => {
      this.bookings = response.data;
    })
  },
  methods: {
    setToday() {
      this.value = moment().format('yyyy-MM-DD');
    },
    showEvent() {
      this.$refs.dlg.isDisplay = true

    },
    viewDay() {
      this.$refs.dlg.isDisplay = true
  
    },
    getEvents() {
      const events = this.bookings;
      this.bookings = events;


      // const bookings = [
      //   // new Dateからmomentに変更
      //   {
      //     name: '会議',
      //     start: moment('2020-08-03 10:00:00').toDate(),
      //     end: moment('2020-08-03 11:00:00').toDate(),
      //     color: 'blue',
      //     timed: true,
      //   },
      //   // イベントを追加
      //   {
      //     name: '休暇',
      //     start: '2021-05-04 09:00:00',
      //     end: '2021-05-04 11:00:00',
      //     color: 'green',
      //     timed: true,
      //   },
      //   {
      //     name: '出張',
      //     start: moment('2021-05-05').toDate(),
      //     end: moment('2021-05-07').toDate(),
      //     color: 'cyan',
      //     timed: false,
      //   },
      //   {
      //     name: '飲み会',
      //     start: moment('2021-05-06').toDate(),
      //     end: moment('2021-05-06').toDate(),
      //     color: 'orange',
      //     timed: false,
      //   },
      //   {
      //     name: '打ち合わせ',
      //     start: moment('2021-05-07 10:00').toDate(),
      //     end: moment('2021-05-07 11:00').toDate(),
      //     color: 'cyan',
      //     timed: true,
      //   },
      //   {
      //     name: '振り返り',
      //     start: moment('2021-06-07 11:00:00').toDate(),
      //     end: moment('2021-06-07 12:00').toDate(),
      //     color: 'cyan',
      //     timed: true,
      //   },
      //   {
      //     name: '休暇',
      //     start: moment('2021-06-07').toDate(),
      //     end: moment('2021-06-11').toDate(),
      //     color: 'green',
      //     timed: false,
      //   },
      // ];
      this.bookings;
    },
    getEventColor(bookings) {
      return bookings.color;
    },
    // openDisplay() {
    //   this.$refs.dlg.isDisplay = true
    // },
  },
};
</script>