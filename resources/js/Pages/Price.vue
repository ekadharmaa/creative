<script setup lang="ts">
import NavLink from "@/Components/NavLink.vue";
import WebLayout from "@/Layouts/WebLayout.vue";
import { Head, usePage } from "@inertiajs/vue3";

const page = usePage();
const settings = page.props.settings || { basic_price: 50000, premium_price: 80000 };
</script>

<template>
    <Head title="Pricing" />

    <WebLayout>
        <div class="bg-white min-h-[calc(100dvh-4rem)]">
            <div class="max-w-7xl mx-auto py-12 px-2 md:px-5 lg:px-10">
                <div class="flex flex-col items-center mb-8 space-y-2">
                    <h1 class="text-4xl max-w-2xl font-black text-center">
                        Buat Undangan Digital Impian Kamu
                    </h1>
                    <p>
                        Pilih paket yang sesuai dengan kebutuhan kamu, mulai dari gratis hingga premium.
                    </p>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-5 z-0">
                    <!-- Basic Plan -->
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="mb-8">
                            <h3 class="text-2xl font-semibold">Basic</h3>
                            <p class="mt-4 text-gray-400">
                                Cocok untuk Anda yang ingin membuat undangan digital dengan biaya terjangkau, namun tetap dengan fitur dasar yang memadai.
                            </p>
                        </div>
                        <div class="mb-8">
                            <span class="text-5xl font-extrabold">
                                Rp. {{ settings.basic_price.toLocaleString("id-ID") }}
                            </span>
                        </div>
                        <ul class="mb-8 space-y-4 text-gray-400">
                            <li class="flex items-center" v-for="(item, i) in [
                                'Undang 250 tamu undangan',
                                'Kelola daftar tamu dengan mudah',
                                'Custom foto dan teks sesuai keinginan',
                                'Paket hemat untuk undangan sederhana'
                            ]" :key="i">
                                <svg class="h-6 w-6 text-green-500 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M5 13l4 4L19 7" />
                                </svg>
                                <span>{{ item }}</span>
                            </li>
                        </ul>
                        <NavLink href="/member/login"
                            class="block w-full py-3 px-6 text-center rounded-md text-white font-medium bg-gradient-to-r bg-blue-500">
                            Coba Sekarang
                        </NavLink>
                    </div>

                    <!-- Premium Plan -->
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <div class="mb-8">
                            <h3 class="text-2xl font-semibold">Premium</h3>
                            <p class="mt-4 text-gray-400">
                                Pilihan terbaik untuk Anda yang ingin membuat undangan digital dengan desain profesional dan fitur lebih lengkap.
                            </p>
                        </div>
                        <div class="mb-8">
                            <span class="text-5xl font-extrabold">
                                Rp. {{ settings.premium_price.toLocaleString("id-ID") }}
                            </span>
                        </div>
                        <ul class="mb-8 space-y-4 text-gray-400">
                            <li class="flex items-center" v-for="(item, i) in [
                                'Undang tamu hingga 500 orang',
                                'Kelola daftar tamu secara lengkap',
                                'Custom foto dan teks sesuai desain premium',
                                'Desain lebih elegan dengan pilihan lebih banyak'
                            ]" :key="i">
                                <svg class="h-6 w-6 text-green-500 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M5 13l4 4L19 7" />
                                </svg>
                                <span>{{ item }}</span>
                            </li>
                        </ul>
                        <NavLink href="/member/login"
                            class="block w-full py-3 px-6 text-center rounded-md text-white font-medium bg-gradient-to-r bg-blue-500">
                            Coba Sekarang
                        </NavLink>
                    </div>
                </div>
            </div>
        </div>
    </WebLayout>
</template>
