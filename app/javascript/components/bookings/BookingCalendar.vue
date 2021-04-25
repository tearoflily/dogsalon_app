<template>
  <div>
    <v-sheet tile height="6vh" color="grey lighten-3" class="d-flex align-center">
      <v-btn icon @click="$refs.calendar.prev()">
        <v-icon>◀︎</v-icon>
      </v-btn>
      <v-btn icon @click="$refs.calendar.next()">
        <v-icon>▶︎</v-icon>
      </v-btn>
    </v-sheet>
    <v-sheet height="94vh">
      <v-calendar
        ref="calendar"
        :events="events"
        :event-color="getEventColor"
        @change="getEvents"
      ></v-calendar>
    </v-sheet>
  </div>
</template>

<script>


export default {
  data: () => ({
    events: [],

  }),
  methods: {
    getEvents() {
      const events = [
        {
          name: '会議',
          start: new Date('2021-04-25T01:00:00'), // 開始時刻
          end: new Date('2021-04-25T02:00:00'), // 終了時刻
          color: 'blue',
          timed: true, // 終日ならfalse
        },
      ];
      this.events = events;
    },
    getEventColor(event) {
      return event.color;
    },
  },
};
</script>