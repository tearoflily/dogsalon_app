<template>
  <v-app>
      <v-dialog v-model="isDisplay" width="600px">
          <v-card>
              <v-card>
                  <v-card-title>ダイアログタイトル</v-card-title>
                  <v-card-actions>
                      <v-row justify="center">
                          <v-col cols="4">
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
export default({
    data: () => ({
        isDisplay: false
    })
})
</script>