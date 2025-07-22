<script setup lang="ts">
import { useForm } from '@inertiajs/vue3';
import PrimaryButton from '../PrimaryButton.vue';
import { Icon } from '@iconify/vue';
import InputError from '../InputError.vue';
import type { PropType } from 'vue';

const attendance = {
    'yes': 'Hadir',
    'no': 'Tidak Hadir'
}

const props = defineProps({
    modelValue: {
        type: Boolean,
        default: false,
    },
    default: {
        type: Object,
        default: () => ({
            name: '',
            attendance: 'yes',
            wish: '',
        })
    }
});

const emit = defineEmits(['update:modelValue'])

const form = useForm({
    name: props.default.name,
    attendance: props.default.attendance,
    wish: props.default.wish,
})

const submit = () => {
    const { slug } = route().params
    if (!slug) return;

    form.post(route('invitation.rsvp', { slug: slug }), {
        onFinish: () => {
            emit('update:modelValue', false)
        }
    })
}

</script>

<template>
    <div v-if="props.modelValue" class="absolute top-0 left-0 w-full h-screen flex items-center justify-center">
        <div class="bg-white bg-opacity-80 shadow rounded p-5 w-full mx-8 relative">
            <button @click="$emit('update:modelValue', !props.modelValue)">
                <Icon icon="mdi:close" class="absolute top-3 right-3" />
            </button>

            <div class="text-center">
                Konfirmasi Kehadiran
            </div>

            <form @submit.prevent="submit">
                <div class="flex flex-col gap-1">
                    <label for="attendance" class="text-sm text-gray-500">Kehadiran</label>
                    <select id="attendance" class="border rounded-lg p-2 w-full" v-model="form.attendance">
                        <option v-for="(item, index) in attendance" :value="index">
                            {{ item }}
                        </option>
                    </select>
                    <InputError :message="form.errors.attendance" />
                </div>
                <div class="flex flex-col gap-1">
                    <label for="wishes" class="text-sm text-gray-500">Ucapan</label>
                    <textarea id="wishes" class="border rounded-lg p-2 w-full" v-model="form.wish"
                        placeholder="Berikan ucapan untuk pasangan" />
                    <InputError :message="form.errors.wish" />
                </div>

                <div class="flex justify-end mt-3">
                    <PrimaryButton as="button">
                        Konfirmasi
                    </PrimaryButton>
                </div>
            </form>
        </div>
    </div>
</template>