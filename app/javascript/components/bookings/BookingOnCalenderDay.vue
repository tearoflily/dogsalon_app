<template>
  <v-app>
      <v-dialog v-model="isDisplay" width="600px">
          <v-card>
              <v-card>
                  <v-card-title>ダイアログタイトル</v-card-title>
                  <v-card-actions>
                      <v-row justify="center">
                          <v-col cols="4">
                              {{ value }}
                                <v-sheet
                                tile
                                height="54"
                                class="d-flex">
                                <v-btn
                                icon
                                class="ma-2"
                                @click="$refs.calendar.prev()">
                                <v-icon>mdi-chevron-left</v-icon>
                                </v-btn>
                                <v-spacer></v-spacer>
                                <v-btn
                                icon
                                class="ma-2"
                                @click="$refs.calendar.next()">
                                <v-icon>mdi-chevron-right</v-icon>
                                </v-btn>
                                </v-sheet>
                                <v-sheet height="600">
                                    <v-calendar-daily
                                        ref="calendar"
                                        v-model="value"
                                        :weekdays="weekday"
                                        :type="type"
                                        :events="events"
                                        :event-overlap-mode="mode"
                                        :event-overlap-threshold="30"
                                        :event-color="getEventColor"
                                        locale="ja-jp"
                                        @change="getEvents"
                                        @click:event="showEvent"
                                        @click:date="viewDay"
                                    ></v-calendar-daily>
                            </v-sheet>


                              <v-btn @click="isDisplay=false">OK</v-btn>
                          </v-col>
                      </v-row>
                  </v-card-actions>
              </v-card>
            </v-card>
      </v-dialog>
  </v-app>
</template>

<script>
import axios from 'axios'

export default({
    props: {
        value: {
            type: Date
        },
    },
    data: function() {
        return {
            isDisplay: false,
            bookings: [],
        }
    },
    
    mounted () {
        axios
        .get(`/api/v1/bookings/oneday/`)
        .then(response => (this.bookings = response.data))
    }

})
</script>