<script setup lang="ts">
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';


const props = defineProps({
    verifyCode: {
        type: Number,
        required: true
    }
})

const form = useForm({
    code: props.verifyCode
})

const submit = () => {
    form.post(route('verify.code'), {
        preserveState: true
    })
}

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
                <p class="mb-5">
                    Kode XXXXXX telah dikirim ke email anda. Silahkan masukkan kode tersebut untuk melanjutkan. Periksa
                    folder spam jika tidak ada di inbox.
                </p>

                <form @submit.prevent="submit">
                    <div>
                        <TextInput id="code" type="number" class="mt-1 block w-full" v-model="form.code" required
                            autofocus />

                        <InputError class="mt-2" :message="form.errors.code" />
                    </div>

                    <div class="flex items-center justify-end mt-4">
                        <PrimaryButton class="w-full" :class="{ 'opacity-25': form.processing }"
                            :disabled="form.processing">
                            <span class="text-center w-full py-1">Verifikasi</span>
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