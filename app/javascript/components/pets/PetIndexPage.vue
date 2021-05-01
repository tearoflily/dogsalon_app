<template　v-slot:activator="{ on }">
  <v-app id="app">
    <v-row justify="center" align-content="center" class="text-caption">
      <v-form>
        <v-container>
          <v-row cols="8">
            <v-col sm="4" md="5">
              <v-text-field label="顧客名"></v-text-field>
            </v-col>

          <v-col sm="4" md="5">
            <v-text-field label="ペットのお名前"></v-text-field>
          </v-col>
        
          <v-col sm="4" md="5">
            <v-menu
              ref="menu"
              v-model="menu"
              :close-on-content-click="false"
              :return-value.sync="date"
              transition="scale-transition"
              offset-y
              min-width="auto"
            >

            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="date"
                label="前回来店日時"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              >
              </v-text-field>
            </template>

              <v-date-picker
                v-model="date"
                no-title
                scrollable
              >
              <v-spacer></v-spacer>
                <v-btn
                  text
                  color="primary"
                  @click="menu = false"
                >
                  Cancel
                </v-btn>
                <v-btn
                  text
                  color="primary"
                  @click="$refs.menu.save(date)"
                >
                OK
                </v-btn>
              </v-date-picker>
            </v-menu>
          </v-col>

          <v-col sm="4" md="5">
            <v-select
                v-model="e6"
                :items="items"
                :menu-props="{ maxHeight: '400' }"
                label="前回メニュー"
                multiple
                hint="メニューを選択してください（複数選択可）"
                persistent-hint
              ></v-select>
            </v-col>

            <div class="serch-btn">
              <v-col sm="4" md="4">
                <v-btn label="serch_reset">検索リセット</v-btn>
              </v-col>
            </div>
          </v-row>
        </v-container>
      </v-form>

      <table class="table table-bordered col-8 pets_index" v-for="p in pets" :key="p.customer.id">
        <tbody>
          <tr>
            <th>顧客名</th>
            <td colspan="2">{{ p.customer.last_name }} {{ p.customer.first_name }} 様</td>
              <th>ペット名</th>
              <td colspan="2">{{ p.pet_name }}
                <span v-if="p.gender == 'オス'">くん</span>
                <span v-else-if="p.gender == 'メス'">ちゃん</span>
                <span v-else></span>
              </td>
              <td rowspan="2">
                <router-link :to="{ name: 'PetDetailPage', params: { id: p.id} }"><v-btn rounded color="primary" dark>詳細</v-btn></router-link>
              </td> 
          </tr>

            <tr>
              <th>前回来店日時</th>
              <td colspan="2">
                {{ p.bookings.start_last_booking | moment }}
              </td>
              <th>前回メニュー</th>
              <td colspan="2">
                <span v-for="(b ,i) in p.bookings" :key="b.id" >
                  <span v-if="i === 0">
                    XXXXXXXXXXXXXXXXXXX
                  </span>
                </span>
              </td>
            </tr>
        </tbody>
      </table>
    </v-row>
  </v-app>
</template>

<script>
import axios from 'axios';
import moment from 'moment';

export default {
  data() {
    return {
      pets: [],
      items: ['シャンプーセット', 'シャンプーカット', '爪切り'],
      date: new Date().toISOString().substr(0, 10),
      menu: false,
      modal: false,
      menu2: false,
    }
  },

  mounted() {
    axios
      .get('/api/v1/pets.json')
      .then(response => (this.pets = response.data))
  },

  filters: {
    moment: function (data) {
      return moment(data).format('YYYY/MM/DD HH:MM')
    }
  }
}

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

.pets_index {
  margin-top: 50px;
}

.pets_index th {
  background-color: #f5f5f5;
  vertical-align: middle;
  text-align: center;
}

.pets_index td {
  vertical-align: middle;
  text-align: center;
}
</style>