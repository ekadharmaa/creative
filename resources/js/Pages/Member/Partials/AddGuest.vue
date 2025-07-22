<script setup lang="ts">
import InputError from '@/Components/InputError.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import type { InvitationDetail } from '@/types';
import { useForm } from '@inertiajs/vue3';
import type { PropType } from 'vue';
import { toast } from 'vue3-toastify';

const props = defineProps({
    invitation: Object,
})

const form = useForm({
    guests: ''
})

const submit = () => {
    form.post('/member/invitation/' + props.invitation.slug + '/guests', {
        onSuccess: () => {
            toast.success('Data berhasil disimpan')
            form.reset()
        },
        onError: (err) => {
            if (err.message)
                toast.error(err.message)
        },
        onFinish: () => {
            form.reset()
        }
    })
}

</script>

<template>
    <form class="pb-5" @submit.prevent="submit">
        <div class="grid grid-cols-1 gap-6">
            <div class="flex flex-col gap-1">
                <label for="guests" class="text-sm text-gray-500">Tamu</label>
                <textarea type="text" id="guests" class="border rounded-lg p-2 w-full" v-model="form.guests"
                    placeholder="contoh: Rina Hermawan, Dhani Aditya, Fulan Al Fathir, Dika Rohmat, dll..." />
                <p class="text-sm text-gray-400">
                    *Tamu yang sudah terdaftar, tidak akan di tambahkan lagi.
                </p>
                <InputError :message="form.errors.guests" />
            </div>
        </div>

        <div class="flex justify-end">
            <PrimaryButton as="button" type="submit" class="bg-primary text-white rounded-lg py-2 px-5 mt-3">
                Simpan
            </PrimaryButton>
        </div>
    </form>
</template>