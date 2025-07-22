<script setup lang="ts">
import { ref, onMounted } from "vue";
import axios from "axios";

// Membuat reaktif untuk appName dan logoPath
const appName = ref(import.meta.env.VITE_APP_NAME);
const logoPath = ref("");

// Mengambil data pengaturan dari API saat komponen dimuat
onMounted(async () => {
    try {
        const response = await axios.get("/api/web-settings");
        appName.value = response.data.app_name || appName.value;
        logoPath.value = response.data.logo || "";
    } catch (error) {
        console.error("Error fetching settings:", error);
    }
});
</script>

<template>
    <div class="h-9 w-auto flex items-center space-x-2">
        <!-- Jika logoPath ada, tampilkan gambar logo, jika tidak tampilkan SVG default -->
        <img
            v-if="logoPath"
            :src="`/storage/${logoPath}`"
            alt="Logo"
            class="h-9 w-auto"
        />
        <svg
            v-else
            class="h-9 w-auto fill-current text-gray-800"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
        >
            <path d="M12 2v20M2 12h20" />
        </svg>

        <!-- Menampilkan nama aplikasi -->
        <span v-if="appName" class="ml-2 text-lg font-semibold">{{
            appName
        }}</span>
    </div>
</template>
