<template>
<div>
  <input class="form-control" type="text" v-model="inputedValue">
  <p>{{ value }}</p>
</div>
</template>


<script>
export default {
  props:{
    value: {
      type: String
    },
  },
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
