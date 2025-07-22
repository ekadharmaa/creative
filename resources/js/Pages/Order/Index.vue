<script setup lang="ts">
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import DataTable from "@/Components/DataTable.vue";
import { Head, router } from "@inertiajs/vue3";
import { toast } from "vue3-toastify";
import axios from 'axios';

const props = defineProps({
    orders: Object,
    sortFields: Array<string>,
});

const options = {
    title: "Invitation Orders",
    headers: [
        "order_id",
        "name",
        "email",
        "phone",
        "status",
        "created_at",
        "total",
    ],
    customHeaders: {
        order_id: "Order ID",
        created_at: "Order Date",
    },
    sortFields: props.sortFields,
    actions: [
        {
            label: "Edit",
            icon: "octicon:pencil-16",
            onClick: (row: any) => {
                router.visit(route("orders.edit", { id: row.id }));
            },
        },
        {
            label: "Delete",
            icon: "octicon:trash-16",
            onClick: async (row: any) => {
                // Memastikan user mengonfirmasi untuk menghapus
                const confirmed = confirm("Are you sure you want to delete this order?");
                if (!confirmed) return;

                try {
                    // Mengirim permintaan DELETE ke rute yang benar menggunakan axios
                    const response = await axios.delete(route("orders.destroy", { id: row.id }));

                    // Cek apakah status response 200
                    if (response.status === 200) {
                        // Jika berhasil, tampilkan notifikasi sukses
                        toast.success("Order deleted successfully");

                        // Menghapus order dari daftar secara langsung tanpa perlu memuat ulang halaman
                        const index = props.orders.data.findIndex(order => order.id === row.id);
                        if (index > -1) {
                            props.orders.data.splice(index, 1);
                        }
                    } else {
                        // Jika status bukan 200, tampilkan error
                        toast.error("Error deleting order: " + (response.data.message || "Unknown error"));
                    }
                } catch (error) {
                    // Menampilkan pesan error jika gagal
                    toast.error("Error deleting order: " + (error.response?.data.message || error.message));
                }
            },
        },
    ],
};

const pagination = {
    total: props.orders.total,
    perPage: props.orders.per_page,
    currentPage: props.orders.current_page,
    lastPage: props.orders.last_page,
    firstPageUrl: props.orders.first_page_url,
    lastPageUrl: props.orders.last_page_url,
    nextPageUrl: props.orders.next_page_url,
    prevPageUrl: props.orders.prev_page_url,
};
</script>

<template>
    <Head title="Orders" />

    <AuthenticatedLayout>
        <template #header>
            <h2>Orders</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <DataTable
                        title="Invitation Orders"
                        :data="orders.data"
                        :options="options"
                        :pagination="pagination"
                    />
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
