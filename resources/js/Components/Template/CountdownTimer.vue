<script setup lang="ts">
import { onMounted } from 'vue';
import { ref } from 'vue';


// set default date to 1 month ahead
const props = defineProps({
    date: {
        type: String,
        required: true,
        default: '2024-04-30 10:00:00'
    },
    accentColor: {
        type: String,
        default: '#000000'
    },
    color: {
        type: String,
        default: 'white'
    }
})

const timeLeft = ref({
    days: 0,
    hours: 0,
    minutes: 0,
    seconds: 0
})

const calculateTimeLeft = () => {
    // convert props date to date type
    const dateProps = new Date(props.date);

    const difference = +dateProps - +new Date();
    if (difference > 0) {
        timeLeft.value = {
            days: Math.floor(difference / (1000 * 60 * 60 * 24)),
            hours: Math.floor((difference / (1000 * 60 * 60)) % 24),
            minutes: Math.floor((difference / 1000 / 60) % 60),
            seconds: Math.floor((difference / 1000) % 60)
        }
    }
}

onMounted(() => {
    calculateTimeLeft();
    setInterval(calculateTimeLeft, 1000);
})

</script>

<template>
    <div class="flex items-center space-x-2 w-full justify-center" :style="{ fontFamily: 'Arial' }">
        <div class="rounded font-semibold w-16 h-16 flex flex-col items-center justify-center"
            :style="{ color: props.accentColor, backgroundColor: props.color }">
            <span class="text-2xl -mb-1">{{ timeLeft.days }}</span>
            <span class="text-sm">Hari</span>
        </div>
        <div class="rounded font-semibold w-16 h-16 flex flex-col items-center justify-center"
            :style="{ color: props.accentColor, backgroundColor: props.color }">
            <span class="text-2xl -mb-1">{{ timeLeft.hours }}</span>
            <span class="text-sm">Jam</span>
        </div>
        <div class="rounded font-semibold w-16 h-16 flex flex-col items-center justify-center"
            :style="{ color: props.accentColor, backgroundColor: props.color }">
            <span class="text-2xl -mb-1">{{ timeLeft.minutes }}</span>
            <span class="text-sm">Menit</span>
        </div>
        <div class="rounded font-semibold w-16 h-16 flex flex-col items-center justify-center"
            :style="{ color: props.accentColor, backgroundColor: props.color }">
            <span class="text-2xl -mb-1">{{ timeLeft.seconds }}</span>
            <span class="text-sm">Detik</span>
        </div>
    </div>
</template>