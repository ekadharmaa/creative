<script setup lang="ts">
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';

defineProps<{
    canResetPassword?: boolean;
    status?: string;
}>();

const form = useForm({
    email: ''
});

const submit = () => {
    form.post(route('auth.member'));
};
</script>

<template>

    <Head title="Sign In to Member Area" />

    <div class="bg-gray-100 w-full rounded shadow min-h-screen">
        <div class="w-full h-full flex flex-col items-center py-36">
            <Link :href="route('web.index')">
            <ApplicationLogo class="w-auto h-10 fill-current mb-5" />
            </Link>

            <h2 class="font-bold text-2xl mb-5">Sign In to Member Area</h2>

            <div class="bg-white p-5 rounded lg:w-1/4 w-96">
                <form @submit.prevent="submit">
                    <div>
                        <InputLabel for="email" value="Email" />

                        <TextInput id="email" type="email" class="mt-1 block w-full" v-model="form.email" required
                            autofocus autocomplete="username" />

                        <InputError class="mt-2" :message="form.errors.email" />
                    </div>

                    <div class="flex items-center justify-end mt-4">
                        <PrimaryButton class="w-full" :class="{ 'opacity-25': form.processing }"
                            :disabled="form.processing">
                            <span class="text-center w-full py-1">Kirim Kode</span>
                        </PrimaryButton>
                    </div>
                </form>
            </div>

            <div class="mt-5">
                <p class="text-sm text-gray-600">Don't have an account?
                    <Link :href="route('register')" class="text-blue-500">Register</Link>
                </p>
            </div>
        </div>
    </div>
</template>
