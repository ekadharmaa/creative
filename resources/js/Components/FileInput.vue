<template>
    <div>
        <div v-if="modelValue && isAudio" class="mb-3">
            <audio controls :src="modelValue" class="w-full"></audio>
        </div>
        <input
            type="file"
            @change="handleInput"
            class="border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm disabled:text-neutral-400"
        />
    </div>
</template>

<script setup lang="ts">
import { computed } from "vue";
import { useForm } from "@inertiajs/vue3";

const props = defineProps({
    modelValue: String,
    name: String,
});

const emit = defineEmits(["update:modelValue"]);

const form = useForm({
    name: props.name,
    file: null,
});

const isAudio = computed(() => {
    if (!props.modelValue) return false;
    const extension = props.modelValue.split(".").pop()?.toLowerCase();
    return extension
        ? ["mp3", "wav", "ogg", "aac", "flac"].includes(extension)
        : false;
});

const submit = async () => {
    form.post(route("member.file-upload"), {
        preserveScroll: true,
        onSuccess: (page) => {
            if (page.props.flash && page.props.flash.response) {
                const filePath = page.props.flash.response[props.name];
                if (filePath) {
                    emit("update:modelValue", filePath);
                }
            }
        },
    });
};

const handleInput = (e: Event) => {
    const file = (e.target as HTMLInputElement).files?.[0];
    if (!file) return;
    form.file = file;
    submit();
};
</script>
