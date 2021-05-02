<template>
<div>
  <input class="form-control" type="text" v-model="inputedValue">
  <p>{{ value }}</p>

<!-- <v-calendar :attributes="attrs" ></v-calendar>    -->

</div>
</template>


<script>
export default {
  props:{
    value: {
      type: String
    },
  },
  // data: { 
  //   attrs: [
  //       {
  //         key: 'today',
  //         highlight: {
  //           backgroundColor: '#ff8080',
  //         },
  //         dates: new Date(),
  //         popover: {
  //           label: 'メッセージを表示できます',
  //         },
  //       }
  //   ],
  // },
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
};
</script>
