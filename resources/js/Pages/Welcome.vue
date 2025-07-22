<script setup lang="ts">
import { Head } from "@inertiajs/vue3";
import WebLayout from "@/Layouts/WebLayout.vue";
import TemplateList from "@/Components/Template/TemplateList.vue";
import NavLink from "@/Components/NavLink.vue";
import { Link } from "@inertiajs/vue3";
import ApplicationLogo from "@/Components/ApplicationLogo.vue";

const props = defineProps({
    templates: Array,
});
</script>

<template>
    <Head title="Template Undangan Digital" />

    <WebLayout>
        <div class="bg-gray-900 py-20">
            <div class="max-w-7xl mx-auto px-5 md:px-20 lg:px-16">
                <div
                    class="grid md:grid-cols-2 lg:grid-cols-2 items-center gap-10"
                >
                    <div class="text-white space-y-4">
                        <h1
                            class="text-4xl md:text-2xl lg:text-4xl font-black leading-tight"
                        >
                            Undangan Kertas? Sudah Biasa! Waktunya Beralih ke
                            Undangan Digital yang Kekinian!
                        </h1>
                        <p class="text-lg md:text-base">
                            Kirimkan undangan cantik dan anti ribet dalam
                            hitungan menit
                        </p>

                        <NavLink href="/member/login">
                            <button
                                class="bg-white text-gray-900 hover:bg-gray-200 font-bold uppercase p-3 px-5 rounded-xl mt-5"
                            >
                                Daftar Sekarang !
                            </button>
                        </NavLink>
                    </div>
                    <div class="order-first md:order-none lg:order-none">
                        <img src="/assets/images/ui.png" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Template List -->
        <div class="max-w-7xl mx-auto py-12 px-2 md:px-5 lg:px-10">
            <div class="flex items-center justify-between mb-5">
                <h1 class="font-semibold text-2xl">Template Terlaris</h1>
                <NavLink
                    :href="`/template?category=all`"
                    class="px-5 py-1 bg-gray-300 rounded-full text-sm"
                >
                    Lihat Semua
                </NavLink>
            </div>

            <TemplateList :list="templates" />
        </div>

            <!-- <div class="p-6" id="app">
                <div class="text-center">
                    <h1 class="text-4xl font-bold text-pink-500">
                        Filter Instagram<span class="text-gray-800">
                            Sudah Tersedia</span
                        >
                    </h1>
                    <p class="text-gray-600 mt-2">
                        Lebih interaktif dan berbagi moment indah para tamu
                        undangan kalian!
                    </p>
                </div>
                <div
                    class="mt-8 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6"
                >
                    <div class="rounded-lg overflow-hidden">
                        <img
                            alt="Filter Wedding #30"
                            class="w-full"
                            height="500"
                            src="https://www.our-wedding.link/_ipx/w_250,f_webp/https://images.ctfassets.net/q40z6pfqje6o/lE9CTsUZZAHiW8xUdZT36/1494c87de6e75e935e3c58c41a4d89ea/filter_29__garden_.jpg"
                            width="300"
                        />
                        <div class="p-4 text-center">
                            <p class="text-gray-600">Filter Wedding #1</p>
                            <button
                                class="mt-2 bg-yellow-200 text-gray-800 py-2 px-4 rounded-full flex items-center justify-center mx-auto gap-2"
                            >
                                <svg
                                    viewBox="0 0 16 16"
                                    width="1em"
                                    height="1em"
                                    focusable="false"
                                    role="img"
                                    aria-label="instagram"
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor"
                                    class="bi-instagram"
                                >
                                    <path
                                        d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"
                                    ></path>
                                </svg>
                                <span>Coba Filter</span>
                            </button>
                        </div>
                    </div>
                    <div class="rounded-lg overflow-hidden">
                        <img
                            alt="Filter Wedding #30"
                            class="w-full"
                            height="500"
                            src="https://www.our-wedding.link/_ipx/w_250,f_webp/https://images.ctfassets.net/q40z6pfqje6o/1IFv3onaaYBSbILfzVoJzg/4ce9308f7f6bbb0a6383832a313f4104/filter_28__jawa_.jpg"
                            width="300"
                        />
                        <div class="p-4 text-center">
                            <p class="text-gray-600">Filter Wedding #2</p>
                            <button
                                class="mt-2 bg-yellow-200 text-gray-800 py-2 px-4 rounded-full flex items-center justify-center mx-auto gap-2"
                            >
                                <svg
                                    viewBox="0 0 16 16"
                                    width="1em"
                                    height="1em"
                                    focusable="false"
                                    role="img"
                                    aria-label="instagram"
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor"
                                    class="bi-instagram"
                                >
                                    <path
                                        d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"
                                    ></path>
                                </svg>
                                <span>Coba Filter</span>
                            </button>
                        </div>
                    </div>
                    <div class="rounded-lg overflow-hidden">
                        <img
                            alt="Filter Wedding #30"
                            class="w-full"
                            height="500"
                            src="https://www.our-wedding.link/_ipx/w_250,f_webp/https://images.ctfassets.net/q40z6pfqje6o/298uWxVqBS6POPFAQWjkGk/e936732ad3f51da8f08eba0589dfd3a4/filter_27__1_.png"
                            width="300"
                        />
                        <div class="p-4 text-center">
                            <p class="text-gray-600">Filter Wedding #3</p>
                            <button
                                class="mt-2 bg-yellow-200 text-gray-800 py-2 px-4 rounded-full flex items-center justify-center mx-auto gap-2"
                            >
                                <svg
                                    viewBox="0 0 16 16"
                                    width="1em"
                                    height="1em"
                                    focusable="false"
                                    role="img"
                                    aria-label="instagram"
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor"
                                    class="bi-instagram"
                                >
                                    <path
                                        d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"
                                    ></path>
                                </svg>
                                <span>Coba Filter</span>
                            </button>
                        </div>
                    </div>
                    <div class="rounded-lg overflow-hidden">
                        <img
                            alt="Filter Wedding #30"
                            class="w-full"
                            height="500"
                            src="https://www.our-wedding.link/_ipx/w_250,f_webp/https://images.ctfassets.net/q40z6pfqje6o/5tth0bzqXXSNJdZxAYHEz6/731baa5b199e1f3e64e957b68fbe54df/filter_25__2_.png"
                            width="300"
                        />
                        <div class="p-4 text-center">
                            <p class="text-gray-600">Filter Wedding #4</p>
                            <button
                                class="mt-2 bg-yellow-200 text-gray-800 py-2 px-4 rounded-full flex items-center justify-center mx-auto gap-2"
                            >
                                <svg
                                    viewBox="0 0 16 16"
                                    width="1em"
                                    height="1em"
                                    focusable="false"
                                    role="img"
                                    aria-label="instagram"
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor"
                                    class="bi-instagram"
                                >
                                    <path
                                        d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"
                                    ></path>
                                </svg>
                                <span>Coba Filter</span>
                            </button>
                        </div>
                    </div>
                    <div class="rounded-lg overflow-hidden">
                        <img
                            alt="Filter Wedding #30"
                            class="w-full"
                            height="500"
                            src="https://www.our-wedding.link/_ipx/w_250,f_webp/https://images.ctfassets.net/q40z6pfqje6o/6HLwOpHIAdncY4RmBKUfLn/b4227157244f13e663dea6a3a618e517/filter_27__minang_.jpg"
                            width="300"
                        />
                        <div class="p-4 text-center">
                            <p class="text-gray-600">Filter Wedding #5</p>
                            <button
                                class="mt-2 bg-yellow-200 text-gray-800 py-2 px-4 rounded-full flex items-center justify-center mx-auto gap-2"
                            >
                                <svg
                                    viewBox="0 0 16 16"
                                    width="1em"
                                    height="1em"
                                    focusable="false"
                                    role="img"
                                    aria-label="instagram"
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor"
                                    class="bi-instagram"
                                >
                                    <path
                                        d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"
                                    ></path>
                                </svg>
                                <span>Coba Filter</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-8">
                    <button
                        class="bg-gray-900 text-white py-2 px-6 rounded-full"
                    >
                        Lihat Lebih Banyak Filter Instagram
                    </button>
                </div>
            </div> -->

            <div class="bg-white py-20">
  <div class="max-w-7xl mx-auto px-4 md:px-8">
    <div class="grid md:grid-cols-2 gap-12 items-center">
      <!-- Gambar -->
      <div class="order-2 md:order-1">
        <img src="/assets/images/feature.png" alt="Fitur Undangan Digital" class="w-full rounded-lg shadow-md" />
      </div>

      <!-- Deskripsi -->
      <div class="order-1 md:order-2 text-slate-800 space-y-6">
        <h2 class="text-3xl lg:text-4xl font-extrabold leading-tight">
          Undangan Digital Terbaik<br />
          dengan Fitur-Fitur Lengkap
        </h2>
        <p class="text-base md:text-lg text-gray-600">
          Buat undangan digital yang unik dan personal dengan berbagai fitur lengkap yang bisa kamu sesuaikan sesuka hati.
        </p>

        <!-- Daftar Fitur -->
        <ul class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-sm md:text-base text-gray-800">
          <li class="flex items-start gap-2">
            <span class="text-green-500">✔️</span> Custom Nama Tamu Undangan
          </li>
          <li class="flex items-start gap-2">
            <span class="text-green-500">✔️</span> Custom Musik Latar
          </li>
          <li class="flex items-start gap-2">
            <span class="text-green-500">✔️</span> Beragam Tema
          </li>
          <li class="flex items-start gap-2">
            <span class="text-green-500">✔️</span> Form RSVP & Ucapan
          </li>
          <li class="flex items-start gap-2">
            <span class="text-green-500">✔️</span> Amplop Digital & Tanda Kasih
          </li>
          <li class="flex items-start gap-2">
            <span class="text-green-500">✔️</span> Hitung Mundur Acara
          </li>
          <li class="flex items-start gap-2">
            <span class="text-green-500">✔️</span> Google Maps Lokasi Acara
          </li>
          <li class="flex items-start gap-2">
            <span class="text-green-500">✔️</span> Galeri Foto
          </li>
          <li class="flex items-start gap-2">
            <span class="text-green-500">✔️</span> Edit Gampang via HP
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>


<!-- FAQ Section (Clean Look) -->
<section class=" text-gray-900">
  <div class="max-w-5xl mx-auto px-4 md:px-8">
    <div class="text-center mb-10">
      <h2 class="text-3xl md:text-4xl font-bold text-gray-800">FAQ - Pertanyaan Umum</h2>
      <p class="text-base md:text-lg text-gray-600 mt-2">
        Informasi penting sebelum kamu membuat undangan digital di Balicreative
      </p>
    </div>

    <div class="space-y-4 divide-y divide-gray-200">
      <details class="py-4">
        <summary class="cursor-pointer font-medium text-lg hover:text-blue-600 transition">
          Bagaimana cara membuat undangan digital?
        </summary>
        <p class="mt-2 text-gray-600">
          Mudah! Ikuti 3 langkah berikut:
          <br><strong>1.</strong> Pilih tema undangan yang kamu suka dari koleksi kami.
          <br><strong>2.</strong> Edit isi undangan menggunakan smart editor kami (nama, tanggal, lokasi, foto, dll).
          <br><strong>3.</strong> Simpan dan bagikan link undanganmu ke tamu dengan mudah.
        </p>
      </details>

      <details class="py-4">
        <summary class="cursor-pointer font-medium text-lg hover:text-blue-600 transition">
          Upload foto selalu blank? tidak terupload
        </summary>
        <p class="mt-2 text-gray-600">
          Pastikan ukuran file tidak terlalu besar dan format gambar adalah JPG atau PNG. Coba refresh halaman dan upload ulang.
        </p>
      </details>

      <details class="py-4">
        <summary class="cursor-pointer font-medium text-lg hover:text-blue-600 transition">
          Apakah saya buat sendiri undangan saya?
        </summary>
        <p class="mt-2 text-gray-600">
          Ya! Kamu bisa edit sendiri dengan mudah menggunakan editor kami, tanpa perlu bantuan teknis.
        </p>
      </details>

      <details class="py-4">
        <summary class="cursor-pointer font-medium text-lg hover:text-blue-600 transition">
          Berapa lama masa aktif undangan saya?
        </summary>
        <p class="mt-2 text-gray-600">
            tidak ada masa aktif. dengan kata lain undangan anda akan aktif selamanya. jadi kamu bisa aktifkan sekarang untuk di pakai kapanpun.
        </p>
      </details>
    </div>
  </div>
</section>


        

        <div class="w-full max-w-screen-xl mx-auto px-4 py-8">
            <div class="sm:flex sm:items-center sm:justify-between">
                <div class="flex items-center space-x-3">
                    <Link :href="route('web.index')">
                        <ApplicationLogo class="h-10 w-auto" />
                    </Link>
                    <!-- <span class="text-xl font-semibold text-gray-700">BaliCreative</span> -->
                </div>

                <ul class="flex flex-wrap items-center mt-6 sm:mt-0 text-sm text-gray-600 font-medium">
                    <li class="me-4 md:me-6">
                        <a href="https://wa.me/628999400874" target="_blank" class="hover:text-indigo-600 transition">Tentang Kami</a>
                    </li>
                    <li class="me-4 md:me-6">
                        <a href="https://wa.me/628999400874" target="_blank" class="hover:text-indigo-600 transition">Kebijakan Privasi</a>
                    </li>
                    <li class="me-4 md:me-6">
                        <a href="https://wa.me/628999400874" target="_blank" class="hover:text-indigo-600 transition">Lisensi</a>
                    </li>
                    <li>
                        <a href="https://wa.me/628999400874" target="_blank" class="hover:text-indigo-600 transition">Kontak</a>
                    </li>
                </ul>
            </div>

            <hr class="my-6 border-gray-300" />

            <div class="flex flex-col sm:flex-row items-center justify-between text-sm text-gray-500">
                <span>© 2025 <span class="font-medium">BaliCreative™</span>. Hak Cipta Dilindungi.</span>
                <div class="flex mt-4 sm:mt-0 space-x-4">
                    <a href="https://instagram.com/balicreative.photobooth" target="_blank" class="hover:text-pink-600 transition">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M7.75 2A5.75 5.75 0 0 0 2 7.75v8.5A5.75 5.75 0 0 0 7.75 22h8.5A5.75 5.75 0 0 0 22 16.25v-8.5A5.75 5.75 0 0 0 16.25 2h-8.5Zm0 1.5h8.5A4.25 4.25 0 0 1 20.5 7.75v8.5a4.25 4.25 0 0 1-4.25 4.25h-8.5A4.25 4.25 0 0 1 3.5 16.25v-8.5A4.25 4.25 0 0 1 7.75 3.5ZM12 7a5 5 0 1 0 0 10a5 5 0 0 0 0-10Zm0 1.5a3.5 3.5 0 1 1 0 7a3.5 3.5 0 0 1 0-7Zm4.88-.88a.88.88 0 1 0 0 1.75a.88.88 0 0 0 0-1.75Z"/>
                        </svg>
                    </a>
                    <a href="https://tiktok.com/@balicreative.photobooth" target="_blank" class="hover:text-black transition">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M16 8.245v2.184a5.133 5.133 0 0 1-2.671-.736v4.77a4.59 4.59 0 1 1-3.256-4.39v1.84a2.56 2.56 0 1 0 1.787 2.45V2h2.14c.16 1.517 1.29 2.739 2.837 2.99v1.958a4.76 4.76 0 0 1-1.837-.463Z"/>
                        </svg>
                    </a>
                </div>
            </div>
        </div>


        <!-- End Template List -->
    </WebLayout>
</template>
