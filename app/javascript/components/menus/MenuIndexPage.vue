<template>
  <v-app id="app">
    <v-row justify="center" align-content="center" class="text-caption">
    <v-col cols="8">
    <v-card>
      <v-card-title>
        Menu一覧
        <v-spacer></v-spacer>
          <v-text-field
            v-model="search"
            append-icon="mdi-magnify"
            label="Search"
            class="mb-3"
            single-line
            hide-details
          ></v-text-field>
      </v-card-title>
      
      <v-dialog
          v-model="dialog"
          max-width="500px"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="primary"
              dark
              class="mb-3 mx-2"
              v-bind="attrs"
              v-on="on"
            >
              New Item
            </v-btn>
          </template>
           </v-dialog>
      
      <v-data-table
        :headers="headers"
        :items="menus"
        :search="search"
        :items-per-page="10"
        class="elevation-1"
      >
      
        <template v-slot:[`item.working_hours`]="{ item }">
          {{ item.working_hours | moment }}
        </template>

　　　　　<template v-slot:[`item.actions`]="{ item }">
          <v-icon
          large
          color="primary"
          class="mr-2"
          @click="editItem(item)"
        >
          mdi-pencil
        </v-icon>  
        <v-icon
          large
          color="error"
          @click="deleteItem(item)"
        >
          mdi-delete
        </v-icon>
      </template>
      
      </v-data-table>
    </v-card>
    </v-col>
    </v-row>
  </v-app>
</template>

<script>
import axios from 'axios';
import moment from 'moment';

export default {
  data() {
    return {
      menus: [],
      headers: [
          {
            text: 'Menu',
            align: 'start',
            sortable: false,
            value: "menu_name",
          },
          { text: '犬種', value: "breed" },
          { text: '値段(円)', value: "price" },
          { text: '所用時間 (分)', value: "working_hours" },
          { text: '　編集 / 削除', value: "actions"}
        ],
        search: '',
    }
  },

  mounted() {
    axios
      .get('/api/v1/menus.json')
      .then(response => (this.menus = response.data))
  },
  filters: {
    moment: function (data) {
       return moment(data).format('HH:mm')
    }
  },
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