<script setup lang="ts">
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import Form, { type Options } from "@/Components/Form.vue";
import { Head } from "@inertiajs/vue3";
import { computed } from "vue";

const props = defineProps({
    order: Object,
});

const options = computed<Options>(() => ({
    title: "Edit Order",
    description: "Used for editing current order",
    sections: [
        {
            title: "Order Information",
            fields: [
                {
                    name: "name",
                    label: "Name",
                    type: "text",
                    placeholder: props.order?.customer?.name || "Enter name",
                    readOnly: true,
                },
                {
                    name: "email",
                    label: "Email",
                    type: "text",
                    placeholder: props.order?.customer?.email || "Enter email",
                    readOnly: true,
                },
                {
                    name: "phone",
                    label: "Phone",
                    type: "text",
                    placeholder: props.order?.customer?.phone || "Enter phone",
                    readOnly: true,
                },
                {
                    name: "status",
                    label: "Status",
                    type: "select",
                    options: [
                        { label: "Pending", value: "pending" },
                        { label: "Expired", value: "expired" },
                        { label: "Completed", value: "success" },
                    ],
                    placeholder: "Select status",
                    value: props.order?.status,  // Binding status value
                },
                {
                    name: "total",
                    label: "Total",
                    type: "text",
                    placeholder: props.order?.total?.toString() || "Enter total",
                    readOnly: true,
                },
            ],
        },
    ],
    method: "put",
    // url: props.order ? "/orders/" + props.order.id : "",
    url: props.order ? "/admin/orders/" + props.order.id : "",
    default: props.order || {},
}));
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
