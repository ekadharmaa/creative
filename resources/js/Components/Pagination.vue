<script setup lang="ts">
import { defineProps } from 'vue';
import NavLink from './NavLink.vue';
import { Icon } from '@iconify/vue';

const props = defineProps({
    total: {
        type: Number,
        required: true,
    },
    nextPageUrl: {
        type: String,
        required: false,
        default: null,
    },
    prevPageUrl: {
        type: String,
        required: false,
        default: null,
    },
    perPage: {
        type: Number,
        required: true,
    },
    currentPage: {
        type: Number,
        required: true,
    },
    lastPage: {
        type: Number,
        required: true,
    },
    firstPageUrl: {
        type: String,
        required: true,
    },
    lastPageUrl: {
        type: String,
        required: true,
    },
})

const displayedNumber = (): Number[] => {
    const start = Math.max(1, props.currentPage - 2);
    const end = Math.min(props.lastPage, props.currentPage + 2);

    return Array.from({ length: end - start + 1 }, (_, i) => start + i);
}

</script>

<template>
    <div class="flex flex-col lg:flex-row gap-5 lg:gap-0 justify-between items-center mt-5">
        <div class="text-sm text-neutral-500">
            <span>Page {{ currentPage }} of {{ lastPage }}</span>
        </div>
        <div class="flex items-center gap-2 text-sm">
            <NavLink :href="firstPageUrl ?? ''" class="cursor-pointer" :disabled="currentPage === 1">
                <div class="p-2 bg-gray-300 hover:bg-gray-800 cursor-pointer rounded hover:text-white text-gray-800 w-8 h-8 flex items-center justify-center"
                    title="First Page">
                    <Icon icon="heroicons:chevron-double-left-16-solid" />
                </div>
            </NavLink>
            <NavLink :href="prevPageUrl ?? ''" class="cursor-pointer" :disabled="currentPage === 1">
                <div class="p-2 bg-gray-300 hover:bg-gray-800 cursor-pointer rounded hover:text-white text-gray-800 w-8 h-8 flex items-center justify-center"
                    title="Next Page">
                    <Icon icon="heroicons:chevron-left-16-solid" />
                </div>
            </NavLink>
            <NavLink v-for="page in displayedNumber()" :href="'?page=' + page" class="cursor-pointer"
                :disabled="currentPage === page">
                <div class="p-2 rounded w-8 h-8 flex items-center justify-center cursor-pointer"
                    :class="{ 'bg-gray-800 text-white': currentPage === page, 'bg-gray-300 text-gray-800 hover:bg-gray-800 hover:text-white': currentPage !== page }">
                    {{ page }}
                </div>
            </NavLink>
            <NavLink :href="nextPageUrl ?? ''" class="cursor-pointer" :disabled="currentPage === lastPage">
                <div class="p-2 bg-gray-300 hover:bg-gray-800 cursor-pointer rounded hover:text-white text-gray-800 w-8 h-8 flex items-center justify-center"
                    title="Prev Page">
                    <Icon icon="heroicons:chevron-right-16-solid" />
                </div>
            </NavLink>
            <NavLink :href="lastPageUrl ?? ''" class="cursor-pointer" :disabled="currentPage === lastPage">
                <div class="p-2 bg-gray-300 hover:bg-gray-800 cursor-pointer rounded hover:text-white text-gray-800 w-8 h-8 flex items-center justify-center"
                    title="Last Page">
                    <Icon icon="heroicons:chevron-double-right-16-solid" />
                </div>
            </NavLink>
        </div>
    </div>
</template>