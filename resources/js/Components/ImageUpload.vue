<template>
    <div class="flex gap-4 mt-1">
        <img
            :src="previewImage || '/assets/partials/mempelai/pria.jpg'"
            alt="Image"
            class="w-24 h-24 object-cover rounded-xl"
        />
        <div>
            <input
                type="file"
                @change="handleInput"
                class="border rounded-lg p-2 w-full disabled:opacity-70"
            />
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, watch } from "vue";
import { useForm } from "@inertiajs/vue3";

// Mendefinisikan props yang diterima dari komponen induk
const props = defineProps({
    modelValue: String,
    name: String,
});

// Mendefinisikan emit untuk mengupdate nilai modelValue ke induk
const emit = defineEmits(["update:modelValue"]);

// Membuat form dengan Inertia useForm
const form = useForm({
    name: props.name,
    image: null,
});

// Reactive reference untuk menampilkan preview gambar
const previewImage = ref(props.modelValue);

// Watcher untuk menyinkronkan previewImage dengan perubahan pada prop modelValue
watch(
    () => props.modelValue,
    (newVal) => {
        previewImage.value = newVal;
    }
);

// Fungsi untuk submit form dan update nilai berdasarkan file path dari server
const submit = async () => {
    form.post(route("member.image-upload"), {
        preserveScroll: true,
        onSuccess: (page) => {
            // Mengambil file path dari flash response yang dikembalikan oleh controller
            if (page.props.flash && page.props.flash.response) {
                const filePath = page.props.flash.response[props.name];
                if (filePath) {
                    previewImage.value = filePath;
                    // Emit nilai file path ke komponen induk agar modelValue terupdate
                    emit("update:modelValue", filePath);
                }
            }
        },
    });
};

// Fungsi untuk menangani input file
const handleInput = (e: Event) => {
    const file = (e.target as HTMLInputElement).files?.[0];
    if (!file) return;

    form.image = file;
    submit();
};
</script>
