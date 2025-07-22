<script setup lang="ts">
import { useForm } from '@inertiajs/vue3';
import { computed } from 'vue';
import { type PropType } from 'vue';
import PrimaryButton from './PrimaryButton.vue';
import InputLabel from './InputLabel.vue';
import InputError from './InputError.vue';
import TextInput from './TextInput.vue';
import { toast } from 'vue3-toastify';

interface SelectOption {
    value: string,
    label: string,
}

interface Field {
    name: string,
    label: string,
    type: string,
    placeholder: string,
    options?: SelectOption[],
    readOnly?: boolean,
}

interface SectionFields {
    title: string,
    fields: Field[],
}

export interface Options {
    title: string,
    description?: string,
    method: string,
    url: string,
    default?: { [key: string]: any }
    sections: SectionFields[],
    onSubmit?: (data: any) => void,
}

const props = defineProps({
    options: {
        type: Object as PropType<Options>,
        required: true,
    }
})


const formFields = computed(() => {
    //    return with format { fieldName: ''}
    const fields: any = {};
    props.options.sections.forEach((section) => {
        section.fields.forEach((field) => {
            fields[field.name] = props.options.default ? props.options.default[field.name] : '';
        });
    });
    return fields;
})

const formData = useForm(formFields.value);

const onSubmit = () => {
    console.log(formData);
    formData.submit(props.options.method, props.options.url, {
        onBefore: () => {
            console.log('Submitting form...');
        },
        onSuccess: () => {
            toast.success('Data submitted successfully');
        },
        onError: (errors) => {
            console.log(errors);
            toast.error('Form submission failed');
        },
    });
}

</script>

<template>

    <div class="p-5">
        <h2 class="text-2xl font-semibold">{{ props.options.title }}</h2>
        <p v-if="props.options.description" class="text-neutral-400 mb-4">
            {{ props.options.description }}
        </p>
        <form @submit.prevent="onSubmit">
            <div v-for="section in props.options.sections" :key="section.title" class="mb-5">
                <h3 class="mb-4 py-1 border-b text-neutral-500">{{ section.title }}</h3>
                <div class="grid lg:grid-cols-2 gap-5">
                    <div v-for="field in section.fields" :key="field.name">
                        <InputLabel :for="field.name" :value="field.label" />

                        <!-- Text Input -->
                        <TextInput v-if="field.type === 'text'" v-model="formData[field.name]"
                            :placeholder="field.placeholder" class="mt-1 w-full" :disabled="field.readOnly" />

                        <!-- Number Input -->
                        <TextInput v-else-if="field.type === 'number'" v-model="formData[field.name]"
                            :placeholder="field.placeholder" class="mt-1 w-full" type="number"
                            :disabled="field.readOnly" />

                        <!-- Select Input -->
                        <select v-else-if="field.type === 'select'" v-model="formData[field.name]"
                            :disabled="field.readOnly"
                            class="mt-1 w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm">
                            <option value="">{{ field.placeholder }}</option>
                            <option v-for="option in field.options" :key="option.value" :value="option.value">
                                {{ option.label }}
                            </option>
                        </select>

                        <InputError class="mt-2" :message="formData.errors[field.name]" />
                    </div>
                </div>
            </div>
            <div class="mt-5 flex justify-end">
                <PrimaryButton type="submit">Submit</PrimaryButton>
            </div>
        </form>
    </div>

</template>

<style lang="scss"></style>