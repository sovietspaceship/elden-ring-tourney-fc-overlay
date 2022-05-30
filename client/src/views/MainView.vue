<script setup lang="ts">
import PlayerInfo from '../components/PlayerInfo.vue'
</script>

<template>
  <main>
    <div class="d-flex p-3">
      <span class="w-50">
        <PlayerInfo :index="0" />
      </span>
      <span class="p-3"></span>
      <span class="w-50">
        <PlayerInfo :index="1" />
      </span>
    </div>
  </main>
</template>

<style>
.d-flex {
  display: flex !important;
}
.w-50 {
  width: 50%;
}
.p-3 {
  padding: 3em;
}
</style>
