<script setup lang="ts">
import { ref } from 'vue';
import { Icon } from '@iconify/vue';
import { toast } from 'vue3-toastify';
import { onMounted } from 'vue';
import { router } from '@inertiajs/vue3';

const props = defineProps({
    modelValue: {
        type: [Array, FileList, null],
        required: true
    },
    uuid: {
        type: String,
        required: true
    }
})

const selectedFiles = ref(props.modelValue);
const fileInputRef = ref(null);

const onFileClick = () => {
    fileInputRef.value.click();
}

const emit = defineEmits(['update:modelValue'])

const handleFileChange = (e: any) => {
    const files = e.target.files;

    // max file is 5, if more than 5, get only 5 files
    if (files.length > 5) {
        return toast.error('Maksimal file yang diupload adalah 5');
    }

    selectedFiles.value = [...selectedFiles.value, ...Array.from(files).map((file: any) => {
        return {
            name: file.name,
            url: URL.createObjectURL(file),
            isNew: true
        }
    })]

    emit('update:modelValue', files);
}

const handleDeleteFile = (file, index) => {

    if (file.isNew)
        selectedFiles.value = (selectedFiles.value as any).filter((f: any) => f.url !== file.url);
    else
        router.visit('/member/invitation/' + props.uuid + '/gallery/' + index, {
            method: 'post',
            onBefore: () => {
                toast.info('Menghapus file...');
            },
            onSuccess: () => {
                selectedFiles.value = (selectedFiles.value as any).filter((f: any) => f.url !== file.url);
                toast.success('File berhasil dihapus');
            },
            onError: (err) => {
                if (err.message)
                    toast.error(err.message)
            }
        })
}

onMounted(() => {
    if (props.modelValue) {
        selectedFiles.value = Array.from(props.modelValue).map((file: any) => {
            return {
                name: '',
                url: file,
                isNew: false
            }
        });

        emit('update:modelValue', null);
    }
})
</script>

<template>
    <div>
        <input ref="fileInputRef" type="file" multiple @change="handleFileChange" hidden />

        <div class="p-5 bg-gray-50 rounded border border-gray-300">
            <ul class="flex gap-5 flex-wrap">
                <li v-for="(file, index) in (selectedFiles as any)" :key="index" class="relative">
                    <img :src="file.url" alt="file.name" class="w-auto h-24 object-cover rounded" />
                    <button type="button" @click="handleDeleteFile(file, index)"
                        class="absolute top-2 right-2 rounded-full bg-red-500 p-2">
                        <Icon icon="bi:trash" class="h-4 w-4 text-white" />
                    </button>
                </li>
                <li>
                    <button type="button" @click="onFileClick"
                        class="border-4 border-dotted border-gray-300 h-24 w-24 text-gray-300 rounded-lg py-2 px-5">
                        <Icon icon="bi:plus" class="h-12 w-12" />
                    </button>
                </li>
            </ul>
        </div>
    </div>
</template>