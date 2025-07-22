<template>
    <form @submit.prevent="submitForm">
        <div class="grid gap-3 py-5" :class="{ 'lg:grid-cols-2': !oneLine }">
            <div
                v-for="(fieldConfig, fieldName) in editableFields"
                :key="fieldName"
            >
                <label class="text-sm text-gray-500">{{
                    fieldConfig.label
                }}</label>
                <input
                    v-if="fieldConfig.type === 'text'"
                    v-model="formData[fieldName]"
                    type="text"
                    class="border rounded-lg p-2 w-full disabled:opacity-70"
                />
                <input
                    v-else-if="fieldConfig.type === 'email'"
                    v-model="formData[fieldName]"
                    type="email"
                    class="border rounded-lg p-2 w-full disabled:opacity-70"
                />
                <ImageUpload
                    v-else-if="fieldConfig.type === 'image'"
                    v-model="formData[fieldName]"
                    :name="fieldName"
                />
                <Gallery
                    v-else-if="fieldConfig.type === 'gallery'"
                    v-model="formData[fieldName]"
                    :name="fieldName"
                />
                <DateInput
                    v-else-if="fieldConfig.type === 'date'"
                    v-model="formData[fieldName]"
                    class="border rounded-lg p-2 w-full disabled:opacity-70"
                />
                <FileInput
                    v-if="fieldConfig.type === 'file'"
                    v-model="formData[fieldName]"
                    :name="fieldName"
                    type="file"
                    class="border rounded-lg p-2 w-full disabled:opacity-70"
                />
                <textarea
                    v-else-if="fieldConfig.type === 'textarea'"
                    v-model="formData[fieldName]"
                    class="border rounded-lg p-2 w-full disabled:opacity-70"
                    rows="5"
                ></textarea>
            </div>
        </div>
        <div class="border-t pt-5 flex justify-end">
            <PrimaryButton> Submit </PrimaryButton>
        </div>
    </form>
</template>

<script setup lang="ts">
import { reactive, onMounted } from "vue";
import PrimaryButton from "./PrimaryButton.vue";
import { watch } from "vue";
import ImageUpload from "./ImageUpload.vue";
import Gallery from "./Gallery.vue";
import DateInput from "./DateInput.vue";
import FileInput from "./FileInput.vue";

const formData = reactive({});

const props = defineProps({
    jsonData: Object,
    editableFields: Object,
    oneLine: Boolean,
    response: Object,
});

const emit = defineEmits(["submit"]);

const initializeFormData = (data: any, formData: any, path = "") => {
    for (const [fieldName, fieldValue] of Object.entries(data)) {
        const fieldPath = path ? `${path}.${fieldName}` : fieldName;
        if (Array.isArray(fieldValue)) {
            formData[fieldPath] = fieldValue;
        } else if (typeof fieldValue === "object" && fieldValue !== null) {
            initializeFormData(fieldValue, formData, fieldPath);
        } else {
            formData[fieldPath] = fieldValue;
        }
    }
};

const submitForm = () => {
    for (const [fieldName, value] of Object.entries(formData)) {
        if (
            !value &&
            !fieldName.includes("partials") &&
            !fieldName.includes("option")
        ) {
            console.log(fieldName);
            // alert(`Field ${props.editableFields[fieldName].label} tidak boleh kosong`);
            return;
        }
    }

    const expectedJson = JSON.parse(JSON.stringify(props.jsonData)); // Clone jsonData
    for (const [fieldName, value] of Object.entries(formData)) {
        setJsonValue(expectedJson, fieldName, value);
    }

    emit("submit", expectedJson);
};

// const setJsonValue = (obj: any, path: string, value: any) => {
//     const keys = path.split('.');
//     let target = obj;
//     for (let i = 0; i < keys.length - 1; i++) {
//         target = target[keys[i]];
//     }
//     const lastKey = keys[keys.length - 1];
//     target[lastKey] = value;
// };

const setJsonValue = (obj: any, path: string, value: any) => {
    const keys = path.split(".");
    let target = obj;
    for (let i = 0; i < keys.length - 1; i++) {
        // Jika properti belum ada, buat objek baru
        if (!target[keys[i]]) {
            target[keys[i]] = {};
        }
        target = target[keys[i]];
    }
    target[keys[keys.length - 1]] = value;
};

onMounted(() => {
    initializeFormData(props.jsonData, formData);
});

watch(
    () => props.response,
    (response) => {
        if (response) {
            initializeFormData(response, formData);
        }
    },
    { immediate: true }
);
</script>
