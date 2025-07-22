<script setup lang="ts">
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import { Head } from "@inertiajs/vue3";
import { Icon } from "@iconify/vue";

// Define props to receive data from backend
defineProps({
    stats: {
        type: Object,
        default: () => ({
            totalUsers: 0,
            totalCustomers: 0,
            totalOrders: 0,
            recentOrders: [],
            orderAmount: 0,
        }),
    },
});
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2>Dashboard</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <!-- Stats Grid -->
                <div
                    class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6"
                >
                    <!-- Total Users -->
                    <div
                        class="bg-white overflow-hidden shadow-sm sm:rounded-lg"
                    >
                        <div class="p-6">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p
                                        class="text-sm font-medium text-gray-600"
                                    >
                                        Total Users
                                    </p>
                                    <p
                                        class="text-2xl font-semibold text-gray-900"
                                    >
                                        {{ stats.totalUsers }}
                                    </p>
                                </div>
                                <div class="bg-blue-100 p-3 rounded-full">
                                    <Icon
                                        icon="mdi:account-group"
                                        class="w-6 h-6 text-blue-600"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Total Customers -->
                    <div
                        class="bg-white overflow-hidden shadow-sm sm:rounded-lg"
                    >
                        <div class="p-6">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p
                                        class="text-sm font-medium text-gray-600"
                                    >
                                        Total Customers
                                    </p>
                                    <p
                                        class="text-2xl font-semibold text-gray-900"
                                    >
                                        {{ stats.totalCustomers }}
                                    </p>
                                </div>
                                <div class="bg-green-100 p-3 rounded-full">
                                    <Icon
                                        icon="mdi:account"
                                        class="w-6 h-6 text-green-600"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Total Orders -->
                    <div
                        class="bg-white overflow-hidden shadow-sm sm:rounded-lg"
                    >
                        <div class="p-6">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p
                                        class="text-sm font-medium text-gray-600"
                                    >
                                        Total Orders
                                    </p>
                                    <p
                                        class="text-2xl font-semibold text-gray-900"
                                    >
                                        {{ stats.totalOrders }}
                                    </p>
                                </div>
                                <div class="bg-purple-100 p-3 rounded-full">
                                    <Icon
                                        icon="mdi:cart"
                                        class="w-6 h-6 text-purple-600"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Total Revenue -->
                    <div
                        class="bg-white overflow-hidden shadow-sm sm:rounded-lg"
                    >
                        <div class="p-6">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p
                                        class="text-sm font-medium text-gray-600"
                                    >
                                        Total Pendapatan
                                    </p>
                                    <p class="text-2xl font-semibold text-gray-900">
                                        Rp
                                        {{ stats.orderAmount.toLocaleString("id-ID") }}
                                    </p>
                                </div>
                                <div class="bg-yellow-100 p-3 rounded-full">
                                    <Icon
                                        icon="mdi:currency-usd"
                                        class="w-6 h-6 text-yellow-600"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Orders -->
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6">
                        <h3 class="text-lg font-medium text-gray-900 mb-4">
                            Pesanan Terbaru
                        </h3>
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead>
                                    <tr>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Order ID
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Customer Akun
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Jumlah
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Status
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Date
                                        </th>
                                    </tr>
                                </thead>
                                <tbody
                                    class="bg-white divide-y divide-gray-200"
                                >
                                    <tr
                                        v-for="order in stats.recentOrders"
                                        :key="order.id"
                                    >
                                        <td
                                            class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                        >
                                            {{ order.order_id }}
                                        </td>
                                        <td
                                            class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                        >
                                            {{ order.customer_name }}
                                        </td>
                                        <td
                                            class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                        >
                                            {{
                                                order.total.toLocaleString(
                                                    "id-ID"
                                                )
                                            }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span
                                                :class="{
                                                    'px-2 py-1 text-xs rounded-full': true,
                                                    'bg-green-100 text-green-800':
                                                        order.status ===
                                                        'success',
                                                    'bg-yellow-300 text-gray':
                                                        order.status ===
                                                        'pending',
                                                    'bg-red-100 text-red-800':
                                                        order.status ===
                                                        'expired',
                                                }"
                                            >
                                                {{ order.status }}
                                            </span>
                                        </td>
                                        <td
                                            class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                        >
                                            {{
                                                new Date(
                                                    order.created_at
                                                ).toLocaleDateString()
                                            }}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
