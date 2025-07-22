<script setup lang="ts">
import { Head } from '@inertiajs/vue3';
import WebLayout from '@/Layouts/WebLayout.vue';
import TemplateList from '@/Components/Template/TemplateList.vue';
import NavLink from '@/Components/NavLink.vue';

const props = defineProps({
    templates: Array,
    categories: Object,
})

</script>

<template>

    <Head title="Template Undangan Digital" />

    <WebLayout>
        <!-- Template List -->
        <div class="max-w-7xl mx-auto py-12 px-2 md:px-5 lg:px-10">
            <ul class="flex flex-wrap gap-5 mb-5">
                <li v-for="(category, index) in categories" class="py-2 px-5 bg-white rounded-full shadow">
                    <NavLink :href="`/template?category=${index}`" class="text-gray-600 hover:text-gray-800">
                        {{ category }}
                    </NavLink>
                </li>
            </ul>

            <div class="flex items-center justify-between mb-5">
                <h1 class="font-semibold text-2xl">Semua Template</h1>
                <NavLink :href="`/template?category=all`" class="px-5 py-1 bg-gray-300 rounded-full text-sm">
                    Semua Kategori
                </NavLink>
            </div>

            <TemplateList :list="templates" />
        </div>
        <!-- End Template List -->
    </WebLayout>
</template>