<template>
  <div id="app">
    <header>
      <router-link to="/employees/bookings/">予約機能</router-link>
      <router-link to="/api/v1/pets/">電子カルテ機能</router-link>
      <router-link to="/">システム設定</router-link>
      <router-view></router-view>
    </header>
  </div>
</template>

<script>

export default{

}
</script>
