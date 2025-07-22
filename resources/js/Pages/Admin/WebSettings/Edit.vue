<script setup lang="ts">
import { useForm } from "@inertiajs/vue3";
import InputError from "@/Components/InputError.vue";
import InputLabel from "@/Components/InputLabel.vue";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import TextInput from "@/Components/TextInput.vue";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";

const props = defineProps({
    settings: {
        type: Object,
        default: () => ({}),
    },
});

const form = useForm({
  app_name: props.settings?.app_name || import.meta.env.VITE_APP_NAME,
  logo: null,
  favicon: null,
  basic_price: props.settings?.basic_price || 50000,
  premium_price: props.settings?.premium_price || 80000,
});

const submit = () => {
    form.post(route("web-settings.update"), {
        forceFormData: true,
        onSuccess: () => {
            form.reset("logo", "favicon");
        },
    });
};

</script>

<template>
    <AuthenticatedLayout>
        <template #default>
            <div class="max-w-4xl mx-auto mt-8 p-4 bg-white shadow rounded-lg">
                <h1 class="text-2xl font-bold mb-6">Edit Web Settings</h1>

                <form @submit.prevent="submit" enctype="multipart/form-data">
                    <!-- App Name -->
                    <div>
                        <InputLabel for="app_name" value="App Name" />
                        <TextInput
                            id="app_name"
                            v-model="form.app_name"
                            type="text"
                            class="mt-1 block w-full"
                            required
                        />
                        <InputError class="mt-2" :message="form.errors.app_name" />
                    </div>

                    <!-- Logo -->
                    <div class="mt-4">
                        <InputLabel for="logo" value="Logo" />
                        <input
                            type="file"
                            id="logo"
                            class="block mt-1 w-full border"
                            @change="e => form.logo = e.target.files[0]"
                        />
                        <InputError class="mt-2" :message="form.errors.logo" />
                        <div v-if="props.settings?.logo" class="mt-3">
                            <img :src="`/storage/${props.settings.logo}`" alt="Logo" class="h-16 rounded-md" />
                        </div>
                    </div>

                    <!-- Favicon -->
                    <div class="mt-4">
                        <InputLabel for="favicon" value="Favicon (.ico or .png)" />
                        <input
                            type="file"
                            id="favicon"
                            accept=".ico,.png"
                            class="block mt-1 w-full border"
                            @change="e => form.favicon = e.target.files[0]"
                        />
                        <InputError class="mt-2" :message="form.errors.favicon" />
                        <div v-if="props.settings?.favicon" class="mt-3">
                            <img :src="`/storage/${props.settings.favicon}`" alt="Favicon" class="h-10 w-10 rounded" />
                        </div>
                    </div>

                    <!-- Harga Basic -->
                    <div class="mt-4">
                        <InputLabel for="basic_price" value="Harga Basic (Rp)" />
                        <TextInput
                            id="basic_price"
                            v-model="form.basic_price"
                            type="number"
                            min="1000"
                            class="mt-1 block w-full"
                        />
                        <InputError class="mt-2" :message="form.errors.basic_price" />
                    </div>

                    <!-- Harga Premium -->
                    <div class="mt-4">
                        <InputLabel for="premium_price" value="Harga Premium (Rp)" />
                        <TextInput
                            id="premium_price"
                            v-model="form.premium_price"
                            type="number"
                            min="1000"
                            class="mt-1 block w-full"
                        />
                        <InputError class="mt-2" :message="form.errors.premium_price" />
                    </div>


                    <!-- Submit -->
                    <div class="mt-6">
                        <PrimaryButton :disabled="form.processing">Save Changes</PrimaryButton>
                    </div>
                </form>
            </div>
        </template>
    </AuthenticatedLayout>
</template>
