<script setup lang="ts">
import { ref } from 'vue';
import { Icon } from '@iconify/vue'
import { watch } from 'vue';

const props = defineProps({
    color: {
        type: String,
        default: 'black'
    },
    accentColor: {
        type: String,
        default: 'white'
    },
    playMusic: {
        type: Boolean,
        default: false
    },
    src: String
});

const music = ref();
const isMusicPlaying = ref(props.playMusic);

const toggleMusic = (state: Boolean) => {
    if (state) {
        music.value.play();
        isMusicPlaying.value = true;
    } else {
        music.value.pause();
        isMusicPlaying.value = false;
    }
};

watch(() => props.playMusic, (value) => {
    toggleMusic(value);
}, { deep: true });

</script>

<template>
    <button class="absolute bottom-10 right-8 m-4 p-2 rounded-full text-white"
        :style="{ backgroundColor: color, color: accentColor }" @click=" toggleMusic(!isMusicPlaying)">
        <Icon :icon="isMusicPlaying ? 'bi:volume-up' : 'bi:volume-mute'" class="text-2xl" />
    </button>
    <audio :src="src" ref="music" autoplay loop></audio>
</template>