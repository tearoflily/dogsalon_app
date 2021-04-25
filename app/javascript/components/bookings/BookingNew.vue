<template>
  <v-app id="app">
    <v-main>
      予約新規登録画面
      <BookingCalendar />
    </v-main>
  </v-app>
</template>

<script>
import BookingCalendar from './BookingCalendar';

export default {
  components: {
    BookingCalendar
  },
};

</script>