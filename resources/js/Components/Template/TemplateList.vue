<script setup lang="ts">
import NavLink from '../NavLink.vue';

const props = defineProps({
    list: Array,
})
</script>

<template>
    <ul class="grid md:grid-cols-2 lg:grid-cols-4 gap-10">
        <li v-for="(item, index) in (list as any)" class="rounded border bg-white">
            <div>
                <div class="bg-gray-200 w-full aspect-square">
                    <img :src="item.image" :alt="item.name" loading="lazy" />
                </div>
                <div class="p-5">
                    <p class="text-sm text-neutral-500">{{ item.category }}</p>
                    <div class="flex items-center justify-between mt-2">
                        <h1>{{ item.name }}</h1>
                        <!-- Kondisional dengan warna yang lebih elegan -->
                        <p 
                            :class="{
                                'bg-blue-200 text-gray-800': item.membership === 'Basic',
                                'bg-yellow-600 text-white': item.membership === 'Premium'
                            }"
                            class="text-xs p-1 px-5 rounded-full">
                            {{ item.membership }}
                        </p>
                    </div>
                </div>
                <div class="flex gap-2 px-5 mb-5">
                    <a target="_blank" :href="`/preview/${item.slug}?for=Dhani%20Aditya`" class="w-full">
                        <button class="text-sm w-full p-2 bg-gray-300 rounded">Preview</button>
                    </a>
                    <NavLink :href="`/checkout?template=${item.slug}`" class="w-full">
                        <button class="text-sm w-full p-2 bg-blue-500 text-white rounded">Gunakan</button>
                    </NavLink>
                </div>
            </div>
        </li>
    </ul>
</template>
