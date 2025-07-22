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
    background: Object,
    date: String,
    gallery: Array,
    rsvp: Object,
    opening: Object,
    quotes: Object,
    couple: Object,
    gift: Object,
    options: Object,
    navigation: Object,
    music: String
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
        name: 'Quotes',
        icon: 'mdi:format-quote-close',
        link: 'quotes'
    },
    {
        name: 'Mempelai',
        icon: 'mdi:account-heart',
        link: 'couple'
    },
    {
        name: 'Galeri',
        icon: 'mdi:camera',
        link: 'gallery'
    },
    {
        name: 'RSVP',
        icon: 'mdi:calendar-check',
        link: 'rsvp'
    },
    {
        name: 'Gift',
        icon: 'mdi:gift',
        link: 'gift'
    },
    {
        name: 'Acara',
        icon: 'mdi:calendar-star',
        link: 'event'
    }
]

const textPrimary = {
    fontFamily: props.options.fontPrimary,
    color: props.options.primaryColor,
}

const textSecondary = {
    fontFamily: props.options.fontSecondary,
    color: props.options.secondaryColor,
    fontSize: "16px"
}


onMounted(() => {
    getDateTime();
});
</script>

<template>

    <Head :title="`Undangan untuk ${props.name}`" />

    <WeddingTemplateLayout :color="props.options.containerColor" :partials="options.partials"
        :navigation="props.navigation" :showNavigation="showNavigation" :play-music="isMusicPlaying" :music="music"
        :background="background" :menu="menu" :style="{
            backgroundColor:
                props.options.backgroundColor,
            fontFamily: props.options.fontPrimary,
        }">
        <!-- Opening -->
        <template #opening>
            <div class="space-y-10">
                <div class="flex flex-col items-center zoom-out">
                    <p :style="props.opening.subtitle.style">
                        {{ props.opening.subtitle.value }}
                    </p>

                    <img :src="props.opening.image.src" :style="props.opening.image.style" />

                    <h1 :style="props.opening.title.style">
                        {{ props.opening.title.value }}
                    </h1>
                </div>

                <div class="flex flex-col items-center zoom-out" :style="textSecondary">
                    <div>Kepada Yth.</div>
                    <div>Bapak/Ibu/Saudara/i</div>
                    <div class="text-2xl font-bold italic mt-2" :style="textPrimary">
                        {{ props.name }}
                    </div>
                </div>

                <div class="flex flex-col items-center fade-in">
                    <button class="px-4 py-2 rounded-full font-semibold text-sm slide-up"
                        :style="props.options.button.style" @click="openNavigation">Open
                        Invitation</button>
                </div>
            </div>
        </template>
        <!-- End Opening -->

        <!-- Quotes -->
        <template #quotes>
            <div class="space-y-10 p-10">
                <div class="flex flex-col items-center text-sm text-center fade-in" :style="textSecondary">
                    <p :style="props.quotes.text.style">{{ props.quotes.text.value }}</p>
                    <p class="mt-5" :style="props.quotes.author.style">({{ props.quotes.author.value }})</p>
                </div>
            </div>
        </template>
        <!-- End Quotes -->

        <!-- Couple -->
        <template #couple>
            <div class="space-y-5 p-10">
                <div class="flex flex-col items-center text-sm text-center fade-in">
                    <p :style="textSecondary">Dengan penuh rasa syukur</p>
                </div>
                <div class="flex flex-col items-center text-sm text-center fade-in">
                    <p :style="textSecondary">
                        Segala puji bagi Tuhan Yang Maha Esa, yang telah menciptakan kehidupan dengan penuh keindahan. 
                        Dengan segala kerendahan hati, kami mengundang Bapak/Ibu/Saudara/i 
                        untuk menghadiri pernikahan putra-putri kami tercinta.
                    </p>
                </div>
                <div class="flex flex-col items-center text-sm text-center zoom-out">
                    <div class="flex justify-around w-full">
                        <img :src="props.couple.groom_photo" class="w-24 h-24 object-cover rounded-lg" />
                        <img :src="props.couple.bride_photo" class="w-24 h-24 object-cover rounded-lg" />
                    </div>
                </div>
                <div class="flex flex-col items-center text-sm space-y-2 text-center zoom-out">
                    <div :style="textPrimary">
                        <p :style="props.couple.groom_name.style">{{ props.couple.groom_name.value }}</p>
                    </div>
                    <div :style="textSecondary">
                        <p :style="props.couple.groom_description.style">{{ props.couple.groom_description.value }}</p>
                    </div>
                    <a target="_blank" :href="props.couple.groom_link">
                        <button class="px-4 py-2 rounded-full font-semibold mt-3 text-xs"
                            :style="props.options.button.style">@instagram</button>
                    </a>
                </div>
                <div class="flex flex-col items-center text-sm text-center fade-in">
                    <p :style="textSecondary">Dengan</p>
                </div>
                <div class="flex flex-col items-center text-sm space-y-2 text-center zoom-out">
                    <div :style="textPrimary">
                        <p :style="props.couple.bride_name.style">{{ props.couple.bride_name.value }}</p>
                    </div>
                    <div :style="textSecondary">
                        <p :style="props.couple.bride_description.style">{{ props.couple.bride_description.value }}</p>
                    </div>
                    <a target="_blank" :href="props.couple.bride_link">
                        <button class="px-4 py-2 rounded-full font-semibold mt-3 text-xs"
                            :style="props.options.button.style">@instagram</button>
                    </a>
                </div>
            </div>
        </template>
        <!-- End Couple -->

        <!-- Gallery -->
        <template #gallery>
            <div class="space-y-10 p-10">

                <div class="flex flex-col items-center text-sm text-center">
                    <p class="mt-2 text-3xl leading-10" :style="textPrimary">Our Moment</p>
                    <p :style="textSecondary">
                        <!-- moment quotes -->
                        "Moment terindah dalam hidup kita adalah ketika kita menemukan seseorang yang bisa menjadi
                        alasan kita untuk tetap tersenyum."
                    </p>
                </div>

                <div class="grid grid-cols-2 gap-5 fade-in">
                    <div v-for="(  item, index  ) in (gallery as any)  " class="relative zoom-in"
                        :class="{ 'col-span-2': (gallery.length % 2) !== 0 && index == (gallery.length - 1) }">
                        <img :src="item" class="object-cover w-full h-full rounded" />
                    </div>
                </div>
            </div>
        </template>
        <!-- End Gallery -->

        <!-- Location -->
        <!-- <template #location>
            <div class="space-y-10 p-10">
                <div class="rounded-xl overflow-clip fade-in">
                    <iframe :src="`https://maps.google.com/maps?q=${location}&t=m&z=16&output=embed&iwloc=near`"
                        width="100%" height="350" style="border:0;"></iframe>
                </div>

                <div class="flex flex-col items-center text-sm text-center fade-in">
                    <p class="my-2 text-3xl " :style="textPrimary">Lokasi</p>
                    <p class="text-sm" :style="textSecondary">
                        {{ location }}
                    </p>
                    <button class="mt-5 px-4 py-2 rounded-full font-semibold text-xs"
                        :style="props.options.button.style">Buka Google Maps</button>
                </div>
            </div>
        </template> -->
        <!-- End Location -->

        <!-- RSVP -->
        <template #rsvp>
            <div class="space-y-10 p-10">
                <div class="flex flex-col items-center text-sm text-center fade-in">
                    <p class="my-2 text-3xl " :style="textPrimary">Doa Untuk
                        Pengantin
                    </p>
                    <p :style="textSecondary">
                        "Semoga Allah memberkahi pernikahan mereka dan menjadikan mereka keluarga sakinah mawaddah
                        warahmah."
                    </p>
                </div>

                <div class="flex flex-col items-center text-sm text-center fade-in">
                    <p class="my-2 text-3xl " :style="textPrimary">Terima Kasih
                    </p>
                    <p :style="textSecondary">
                        "Terima kasih atas doa restu dan kehadiran Anda."
                    </p>
                </div>

                <div class="flex flex-col items-center text-sm text-center fade-in">
                    <p class="my-2 text-3xl " :style="textPrimary">Konfirmasi
                        Kehadiran
                    </p>
                    <p :style="textSecondary">
                        Silahkan klik tombol dibawah ini untuk konfirmasi kehadiran Anda.
                    </p>
                    <button class="mt-5 px-4 py-2 rounded-full font-semibold text-xs" @click="isShowRsvp = true"
                        :style="props.options.button.style">Konfirmasi
                        Kehadiran</button>
                </div>
            </div>
        </template>
        <!-- End RSVP -->

        <!-- Gift -->
        <template #gift>
            <div class="space-y-10 p-10">
                <div class="flex flex-col items-center font-merienda text-sm text-center fade-in">
                    <p class="my-2 text-3xl font-dancing" :style="{ color: props.options.primaryColor }">Tanda Kasih
                    </p>
                    <p class="text-xs" :style="{ color: props.options.secondaryColor }">
                        Terimakasih telah menambah semangat kegembiraan pernikahan kami dengan kehadiran dan hadiah
                        indah Anda.
                    </p>
                </div>

                <div class="flex flex-col items-center font-merienda text-sm text-center fade-in">
                    <p class="my-2 text-3xl font-dancing" :style="{ color: props.options.primaryColor }">
                        {{ props.gift.account_number.value }}
                    </p>
                    <p class="text-lg" :style="{ color: props.options.secondaryColor }">
                        {{ props.gift.account_name.value }}
                    </p>
                </div>
            </div>
        </template>
        <!-- End Gift -->

        <!-- Event -->
        <template #event>
            <div class="space-y-10 p-10">
                <div class="flex flex-col items-center text-sm text-center fade-in">
                    <p class="my-2 text-3xl " :style="textPrimary">Akad Nikah</p>
                    <p class="text-xl" :style="textSecondary">
                        {{ dateTime.dayName }}, {{ dateTime.day }} {{ dateTime.month }} {{ dateTime.year }}
                    </p>
                    <p class="text-xl" :style="textSecondary">
                        Pukul {{ dateTime.hour }}.00 WIB s.d Selesai
                    </p>
                </div>

                <CountdownTimer :accent-color="navigation.secondary" :color="navigation.primary" :date="date" />

                <div class="flex flex-col items-center text-sm text-center fade-in">
                    <p class="my-2 text-3xl " :style="textPrimary">Lokasi Acara
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
