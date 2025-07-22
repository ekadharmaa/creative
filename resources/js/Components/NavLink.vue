<script setup lang="ts">
import { computed } from 'vue';
import { Link } from '@inertiajs/vue3';

const props = defineProps<{
    href: string;
    active?: boolean;
}>();

const classes = computed(() =>
    props.active
        ? 'relative before:bg-blue-500 before:w-1 before:h-full before:absolute before:top-0 before:left-0 bg-blue-100 text-blue-700' : ''
);
</script>

<template>
    <Link :href="href" :class="classes">
    <slot />
    </Link>
</template>
