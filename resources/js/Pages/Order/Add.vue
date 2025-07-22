<script setup lang="ts">
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import Form, { type Options } from '@/Components/Form.vue';
import { Head } from '@inertiajs/vue3';
import type { PropType } from 'vue';

const props = defineProps({
    customerOptions: {
        type: Array as PropType<{ value: string, label: string }[]>,
        required: true,
    },
})

const options: Options = {
    title: 'Add Order',
    description: 'Used for adding new order',
    sections: [
        {
            title: 'Order Information',
            fields: [
                {
                    name: 'customer_id',
                    label: 'Customer',
                    type: 'select',
                    placeholder: 'Select Customer',
                    options: props.customerOptions,
                },
                {
                    name: 'total',
                    label: 'Total',
                    type: 'number',
                    placeholder: 'Enter total',
                },
            ],
        },
    ],
    method: 'post',
    url: '/orders',
}
</script>

<template>

    <Head title="Add Order" />

    <AuthenticatedLayout>
        <template #header>
            <h2>Add Order</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <Form :options="options" />
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>