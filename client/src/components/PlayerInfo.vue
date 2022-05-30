<script setup lang="ts">
import { computed } from 'vue';
import { useOverlayData, type PlayerData } from '../stores/overlay-data';

const overlayData = useOverlayData();

const props = defineProps<{ index: number }>();

const playerData = computed((): PlayerData => {
    return overlayData.data.Players[props.index] || {
        CurrentHP: 0,
        MaxHP: 0,
        Name: 'N/A'
    };
})

const healthBarStyle = computed(() => {
    const healthPercentage = playerData.value.CurrentHP / playerData.value.MaxHP;
    return {
        width: `${healthPercentage * 100}%`
    }
})
</script>

<template>
<span>
    <span class="player-health-name">
        {{playerData.Name}}
    </span>
    <div>
        <div class="player-health-background">
            <div class="player-health" :style="healthBarStyle">&nbsp;</div>
            <div class="player-health-text">
            {{playerData.CurrentHP}}
            /
            {{playerData.MaxHP}}
        </div>
        </div>
    </div>
</span>
</template>

<style scoped>
span.player-health-name {
    font-size: 1.5em;
    font-family: 'Times New Roman', Times, serif;
}
div.player-health-background {
    background-color: rgba(48, 36, 3, 0.795);
}
div.player-health-text {
    position: absolute;
    right: 0.5em;
    top: 0;
    color: white;
    text-shadow: 1px 1px black;
}
div.player-health {
    background-color: rgb(110, 13, 13);
    text-align: right;
    padding-right: 0.5em;
    box-shadow: -3px 0px 6px 0px white inset;
}
</style>
