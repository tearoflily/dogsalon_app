<template　v-slot:activator="{ on }">
  <v-app id="app">
    <v-row justify="center" align-content="center" class="text-caption">
      <v-form>
        <v-container>
          <colgroup v-for="n of 8" :key="n">
            <col style="width:10%;">
          </colgroup>

          <v-row cols="8">
            <v-col sm="4" md="5">
              <v-text-field label="顧客名" v-model="search_customer_name" ></v-text-field>
            </v-col>

          <v-col sm="4" md="5">
            <v-text-field label="ペットのお名前" v-model="search_pet_name"></v-text-field>
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
                v-model="search_last_visit"
                label="前回来店日時"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              >
              </v-text-field>
            </template>

              <v-date-picker
                v-model="search_last_visit"
                no-title
                scrollable
              >
              <v-spacer></v-spacer>
                <v-btn
                  text
                  color="primary"
                  @click="search_last_visit = ''"
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
                v-model="search_menu_name"
                :items="items"
                :menu-props="{ maxHeight: '400' }"
                label="前回メニュー"
                hint="メニューを選択してください"
                persistent-hint
              ></v-select>
            </v-col>

            <div class="serch-btn">
              <v-col sm="4" md="4">
                <v-btn @click="removetext()" label="serch_reset">検索リセット</v-btn>
              </v-col>
            </div>
          </v-row>
        </v-container>
      </v-form>

      <table class="table table-bordered col-8 pets_index" v-for="p in search_pets" :key="p.id">
          <colgroup v-for="n of 9" :key="n">
            <col style="width:10%;">
          </colgroup>
        <tbody>
          <tr>
            <th>顧客名</th>
            <td colspan="2">{{ p.last_name }} {{ p.first_name }} 様</td>
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
                <span v-if="p.bookings.start_last_booking == null">
                  0000-00-00  00:00
                </span>
                <span v-else>
                {{ p.bookings.start_last_booking | moment }}
                </span> 
              </td>
              <th>前回メニュー</th>
              <td colspan="2">
                    XXXXXXXXXXXXXXß
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
      items: ['','シャンプーセット', 'シャンプーカット', '爪切り'],
      date: '',
      menu: false,
      modal: false,
      menu2: false,
      search_pet_name: '',
      search_customer_name: '',
      search_last_visit: '',
      search_menu_name: '',
    }
  },

  mounted() {
    axios
      .get('/api/v1/pets.json')
      .then(response => (this.pets = response.data))
  },

  filters: {
    moment: function (data) {
      return moment(data).format('YYYY-MM-DD HH:MM')
    }
  },
  computed: {
    search_pets(){
      if (this.search_last_visit === '') {
        return this.pets.filter(p => {
          if (this.search_menu_name === '') {
            return p.pet_name.includes(this.search_pet_name)
            && p.last_name.includes(this.search_customer_name)
          } else {
          if (p.bookings.menu_name.length === 1) {
            return p.pet_name.includes(this.search_pet_name)
            && p.last_name.includes(this.search_customer_name)
            && p.bookings.menu_name[0]?.includes(this.search_menu_name)
          } else {
            return p.pet_name.includes(this.search_pet_name)
            && p.last_name.includes(this.search_customer_name)
            && (p.bookings.menu_name[0]?.includes(this.search_menu_name)
            || p.bookings.menu_name[1]?.includes(this.search_menu_name))
          }
          }
        })    
      } else {
            return this.pets.filter(p => {
              if (this.search_menu_name === '') {
                return p.pet_name.includes(this.search_pet_name)
                && p.last_name.includes(this.search_customer_name)
                && p.bookings.start_last_booking?.includes(this.search_last_visit)
              } else {
                 if (p.bookings.menu_name.length === 1) {
                   return p.pet_name.includes(this.search_pet_name)
                   && p.last_name.includes(this.search_customer_name)
                   && p.bookings.start_last_booking?.includes(this.search_last_visit)
                   && p.bookings.menu_name[0]?.includes(this.search_menu_name)
                 } else {
                   return p.pet_name.includes(this.search_pet_name)
                   && p.last_name.includes(this.search_customer_name)
                   && p.bookings.start_last_booking?.includes(this.search_last_visit)
                   && (p.bookings.menu_name[0]?.includes(this.search_menu_name)
                   || p.bookings.menu_name[1]?.includes(this.search_menu_name))
                }
              }
            })
        }
    }
  },

  methods: {
    removetext: function() {
      this.search_pet_name = '';
      this.search_customer_name = '';
      this.search_last_visit = '';
      this.search_menu_name = '';
      console.log('削除')
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