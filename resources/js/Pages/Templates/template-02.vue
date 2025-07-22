<script setup lang="ts">
import CountdownTimer from "@/Components/Template/CountdownTimer.vue";
import WeddingTemplateLayout from "@/Layouts/WeddingTemplateLayout.vue";
import Rsvp from '@/Components/Template/Rsvp.vue'
import { Head } from "@inertiajs/vue3";
import { onMounted } from "vue";
import { ref } from "vue";

const getGoogleMapsLink = (embedUrl: string) => {
  if (!embedUrl) return '#';

  try {
    // Ganti "/embed?" dengan "/place?" atau hapus parameter embed
    if (embedUrl.includes('/embed?')) {
      return embedUrl.replace('/embed?', '/place?');
    }

    // Kalau sudah URL biasa, langsung pakai
    return embedUrl;
  } catch (e) {
    return '#';
  }
};


const props = defineProps({
    name: String,
    location: String,
    music: String,
    background: Object,
    date: String,
    gallery: Array,
    rsvp: Object,
    opening: Object,
    quotes: Object,
    couple: Object,
    options: Object,
    partials: Object,
    navigation: Object,
});

const dateTime = {
    hour: 0,
    day: 0,
    dayName: '',
    month: '',
    year: 0,
}

const showNavigation = ref(false);
const isMusicPlaying = ref(false);
const isShowRsvp = ref(false);

const openNavigation = () => {
    isMusicPlaying.value = true;
    showNavigation.value = true;
    // set to full screen
    document.documentElement.requestFullscreen();
};

const getDateTime = () => {
    const date = new Date(props.date);
    dateTime.hour = date.getHours();
    dateTime.day = date.getDate();
    dateTime.dayName = date.toLocaleDateString('id-ID', { weekday: 'long' });
    dateTime.month = date.toLocaleDateString('id-ID', { month: 'long' });
    dateTime.year = date.getFullYear();
}

const menu = [
    {
        name: 'Opening',
        icon: 'mdi:home',
        link: 'opening'
    },
    {
        name: 'RSVP',
        icon: 'mdi:calendar-check',
        link: 'rsvp'
    },
    {
        name: 'Acara',
        icon: 'mdi:calendar-star',
        link: 'event'
    }
]

onMounted(() => {
    getDateTime();
});
</script>

<template>

    <Head :title="`Undangan untuk ${props.name}`" />

    <WeddingTemplateLayout :color="props.options.containerColor" :partials="partials" :navigation="props.navigation"
        :showNavigation="showNavigation" :play-music="isMusicPlaying" :music="music" :background="background"
        :menu="menu" :style="{
        backgroundColor:
            props.options.backgroundColor,
    }">
        <!-- Opening -->
        <template #opening>
            <div class="space-y-10 bg-white py-12 mx-7 rounded-xl bg-opacity-60">
                <div class="flex flex-col items-center zoom-out">
                    <p :style="props.opening.subtitle.style">
                        {{ props.opening.subtitle.value }}
                    </p>
                    <h1 :style="props.opening.title.style">
                        {{ props.opening.title.value }}
                    </h1>
                </div>

                <div class="flex flex-col items-center font-merienda zoom-out text-black font-bold">
                    <div>Kepada Yth.</div>
                    <div>Bapak/Ibu/Saudara/i</div>
                    <div class="text-lg font-bold italic mt-2" :style="{ color: props.options.primaryColor }">
                        {{ props.name }}
                    </div>
                </div>

                <div class="flex flex-col items-center fade-in">
                    <button class="px-4 py-2 rounded-full text-black font-semibold text-sm slide-up"
                        :style="props.opening.button.style" @click="openNavigation">Open
                        Invitation</button>
                </div>
            </div>
        </template>
        <!-- End Opening -->

        <!-- Location -->
        <template #location>
            <div class="space-y-10 p-10 bg-white py-12 mx-7 rounded-xl bg-opacity-60">
                <div class="rounded-xl overflow-clip fade-in">
                    <iframe :src="`https://maps.google.com/maps?q=${location}&t=m&z=16&output=embed&iwloc=near`"
                        width="100%" height="350" style="border:0;"></iframe>
                </div>

                <div class="flex flex-col items-center font-merienda text-sm text-center fade-in">
                    <p class="my-2 text-4xl font-kaushan" :style="{ color: props.options.primaryColor }">Lokasi</p>
                    <p class="text-xl text-black">
                        {{ location }}
                    </p>
                    <button button class=" mt-5 px-4 py-2 rounded-full font-semibold text-xs"
                        :style="{ backgroundColor: props.options.primaryColor, color: props.options.secondaryColor }">
                        Buka
                        Google Maps</button>
                </div>
            </div>
        </template>
        <!-- End Location -->

        <!-- RSVP -->
        <template #rsvp>
            <div class="space-y-10 p-10">
                <div class="flex flex-col items-center font-merienda text-sm text-center fade-in">
                    <p class="my-2 text-3xl font-dancing" :style="{ color: props.options.primaryColor }">Doa dan Harapan
                    </p>
                    <p class="text-xs" :style="{ color: props.options.secondaryColor }">
                        "Semoga momen Halal Bihalal ini menjadi ajang mempererat tali silaturahmi, memperkuat ukhuwah, dan membawa keberkahan bagi kita semua."
                    </p>
                </div>

                <div class="flex flex-col items-center font-merienda text-sm text-center fade-in">
                    <p class="my-2 text-3xl font-dancing" :style="{ color: props.options.primaryColor }">Terima Kasih
                    </p>
                    <p class="text-xs" :style="{ color: props.options.secondaryColor }">
                        "Terima kasih atas kehadiran dan kebersamaan Anda dalam acara Halal Bihalal ini. Mohon maaf lahir dan batin."
                    </p>
                </div>

                <div class="flex flex-col items-center font-merienda text-sm text-center fade-in">
                    <p class="my-2 text-3xl font-dancing" :style="{ color: props.options.primaryColor }">Konfirmasi
                        Kehadiran
                    </p>
                    <p class="text-xs" :style="{ color: props.options.secondaryColor }">
                        Silahkan klik tombol dibawah ini untuk konfirmasi kehadiran Anda.
                    </p>
                    <button class="mt-5 px-4 py-2 rounded-full text-white font-semibold text-xs"
                        @click="isShowRsvp = true" :style="{ backgroundColor: props.options.primaryColor }">Konfirmasi
                        Kehadiran</button>
                </div>
            </div>
        </template>
        <!-- End RSVP -->

        <!-- Event -->
        <template #event>
            <div class="space-y-10 p-10">
                <div class="flex flex-col items-center font-merienda text-sm text-center fade-in"
                    :style="{ color: props.options.primaryColor }">
                    <p class="text-3xl font-bold">
                        {{ dateTime.dayName }},
                    <div class="text-7xl font-black">{{ dateTime.day }}</div> {{ dateTime.month }} {{ dateTime.year }}
                    </p>
                    <p class="text-sm mt-10">
                        Pukul {{ dateTime.hour }}.00 WIB s.d Selesai
                    </p>
                </div>

                <CountdownTimer :accent-color="navigation.primary" :color="navigation.secondary" :date="date" />

                <div class="flex flex-col items-center font-merienda text-sm text-center fade-in">
                    <p class="my-2 text-xl font-bold    " :style="{ color: props.options.primaryColor }">Lokasi Acara
                    </p>
                    <a
                        v-if="props.location"
                        :href="getGoogleMapsLink(props.location)"
                        target="_blank"
                        rel="noopener"
                        class="mt-5 px-4 py-2 rounded-full text-black font-semibold text-xs"
                        :style="{ backgroundColor: props.options.primaryColor }"
                        >
                        Buka Google Maps
                    </a>
                </div>

            </div>
        </template>
        <!-- End Event -->

        <template #reservation>
            <Rsvp v-model="isShowRsvp" class="fade-in" :default="props.rsvp" />
        </template>
    </WeddingTemplateLayout>
</template>
