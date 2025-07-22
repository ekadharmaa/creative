<template>
    <div class="mt-1">
        <!-- Input untuk memilih gambar -->
        <div>
            <input
                type="file"
                multiple
                @change="handleInput"
                class="border rounded-lg p-2 w-full disabled:opacity-70"
            />
        </div>
        <!-- Tampilkan gallery gambar -->
        <ul class="flex flex-wrap gap-2 mt-2">
            <li
                v-for="(image, index) in props.modelValue"
                :key="index"
                class="relative"
            >
                <img
                    :src="image"
                    alt="Gallery Image"
                    class="w-auto h-32 rounded-lg"
                />
                <button
                    type="button"
                    @click="handleDelete(image)"
                    class="bg-red-500 hover:bg-red-600 text-white px-2 py-1 rounded-full w-8 h-8 flex items-center justify-center absolute top-2 right-2"
                >
                    <Icon icon="mdi:trash-can" class="w-5 h-5" />
                </button>
            </li>
        </ul>
    </div>
</template>

<script setup lang="ts">
import { ref, watch } from "vue";
import { useForm } from "@inertiajs/vue3";
import { toast } from "vue3-toastify";
import { Icon } from "@iconify/vue";

// Pastikan modelValue berupa array, default jika tidak ada
const props = defineProps({
    modelValue: {
        type: Array,
        default: () => [],
    },
    name: String,
});

const emit = defineEmits(["update:modelValue"]);

// Buat form dengan Inertia, sertakan current (gallery saat ini) dan images (file baru)
const form = useForm({
    name: props.name,
    current: props.modelValue, // gallery saat ini
    images: [] as File[],
});

// Sinkronisasi nilai current jika props.modelValue berubah
watch(
    () => props.modelValue,
    (newVal) => {
        form.current = newVal;
    }
);

// Fungsi submit untuk mengupload file ke endpoint bulk
const submit = () => {
    form.post(route("member.image-upload.bulk"), {
        onSuccess: (page) => {
            // Backend mengembalikan flash response dengan key [props.name]
            if (page.props.flash && page.props.flash.response) {
                const filePaths = page.props.flash.response[props.name];
                if (filePaths) {
                    // Emit gallery baru ke parent
                    emit("update:modelValue", filePaths);
                }
            }
        },
        onError: (err) => {
            if (err.message) toast.error(err.message);
        },
    });
};

// Fungsi untuk menangani input file
const handleInput = (e: Event) => {
    const input = e.target as HTMLInputElement;
    if (!input.files) return;

    // Konversi FileList ke array
    const fileArray = Array.from(input.files);

    // Validasi jumlah gambar: current + file baru tidak boleh lebih dari 4
    const max = 4;
    if (form.current.length + fileArray.length > max) {
        toast.error(`Maksimal upload ${max} gambar.`);
        return;
    }

    form.images = fileArray;

    // Upload langsung setelah gambar dipilih
    submit();
};

// Fungsi hapus gambar dari gallery
const handleDelete = (filePath: string) => {
    const updated = form.current.filter((img: string) => img !== filePath);
    form.current = updated;
    // Emit gallery yang sudah diupdate ke parent
    emit("update:modelValue", updated);
};
</script>
