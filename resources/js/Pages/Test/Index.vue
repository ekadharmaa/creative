<script setup lang="ts">
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import { router } from '@inertiajs/vue3'

defineProps({
    name: String,
    status: Number,
});
</script>

<template>

    <Head title="Test" />

    <AuthenticatedLayout>
        <template #header>
            <h2>Test Page</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">Test Page {{ name }}</div>
                    {{ status }}
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
