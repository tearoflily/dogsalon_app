<template>
  <v-app>
    
  
      <v-app-bar
        color="#F5F5F5"
        elevation="2"
        absolute
        app
      >

        <v-toolbar-title class="ml-5">ZippyCloud</v-toolbar-title>
        <v-spacer></v-spacer>
        <v-app-bar-nav-icon @click="drawer = true" class="mr-5"></v-app-bar-nav-icon>

     
      </v-app-bar>

      <v-navigation-drawer
        v-model="drawer"
        fixed
        temporary
        right
      >
        <v-list
          nav
          dense
        >

        <v-list-item-group>
          <v-list-item>
            <v-list-item-content><router-link to="/employees/bookings/">予約機能</router-link></v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-content><router-link to="/employees/charts/">電子カルテ機能</router-link></v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-content><router-link to="/employees/settings/">システム設定</router-link></v-list-item-content>
          </v-list-item>
        </v-list-item-group>
        </v-list>
      </v-navigation-drawer>

      <!-- <router-link to="/employees/bookings/">予約機能</router-link>
      <router-link to="/api/v1/pets/">電子カルテ機能</router-link>
      <router-link to="/">システム設定</router-link> -->

      
  
      <router-view></router-view>
  
  </v-app>
</template>

<script>

export default{
  data() {
    return {
      drawer: false
    }
  }

}
</script>

<style scoped>
#header {
  margin-top: -50px;
  padding-top: 50px;
} 
</style>
