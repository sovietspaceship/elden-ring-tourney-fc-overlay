<script setup lang="ts">
import { onMounted, onUnmounted } from 'vue';
import { RouterView } from 'vue-router'

import { useOverlayData } from './stores/overlay-data';

const overlayData = useOverlayData();

onMounted(() => {
  overlayData.start();
})

onUnmounted(() => {
  overlayData.stop();
})
</script>

<template>
  <RouterView />
</template>

<style>
@import '@/assets/base.css';
</style>
