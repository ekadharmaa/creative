<template>
    <div :style="{ backgroundColor: color, fontFamily: 'Arial' }" class="h-16 relative">
        <Carousel v-bind="settings" :breakpoints="breakpoints" :model-value="activeTab" :wrap-around="true"
            class="absolute top-[calc(50%)] left-0 w-full transform -translate-y-1/2">
            <Slide v-for="(item, index) in menu" :key="index" @click="onChangeTab(item.link, index)">
                <div class="flex flex-col items-center gap-1 p-2 px-3"
                    :style="{ color: activeTab === index ? color : accentColor, backgroundColor: activeTab === index ? accentColor : color }">
                    <icon :icon="item.icon" class="text-2xl" />
                    <span class="text-xs">{{ item.name }}</span>
                </div>
            </Slide>
        </Carousel>
    </div>
</template>

<script>
import { defineComponent } from 'vue'
import { Carousel, Navigation, Slide } from 'vue3-carousel'
import { Icon } from '@iconify/vue'

import 'vue3-carousel/dist/carousel.css'

export default defineComponent({
    name: 'Breakpoints',
    components: {
        Carousel,
        Slide,
        Navigation,
        Icon,
    },
    props: {
        color: {
            type: String,
            default: 'white'
        },
        accentColor: {
            type: String,
            default: '#000000'
        },
        type: {
            type: String,
            default: 'wedding'
        },
        menu: {
            type: Array,
            default: () => []
        }
    },
    methods: {
        onChangeTab(tab, index) {
            this.$emit('changeTab', tab)
            this.activeTab = index
        }
    },
    data: () => ({
        // carousel settings
        settings: {
            itemsToShow: 1,
            snapAlign: 'center',
        },
        // breakpoints are mobile first
        // any settings not specified will fallback to the carousel settings
        breakpoints: {
            // 0px and up
            0: {
                itemsToShow: 5,
                snapAlign: 'center',
            },
            // 700px and up
            700: {
                itemsToShow: 5,
                snapAlign: 'center',
            },
            // 1024 and up
            1024: {
                itemsToShow: 5,
                snapAlign: 'center',
            },
        },
        activeTab: 0
    }),
    emits: ['changeTab'],
})
</script>