<script setup lang="ts">
import { useForm } from "@inertiajs/vue3";
import { toast } from "vue3-toastify";
import FormDynamic from "@/Components/FormDynamic.vue";
import ImageUpload from "@/Components/ImageUpload.vue";

const props = defineProps({
    invitation: Object,
    response: Object,
});

const form = useForm({
    dataJson: null,
});

const submit = (data: any) => {
    if (!data) return;

    form.dataJson = data;
    // console.log(form.data())

    form.post("/member/invitation/" + props.invitation.uuid, {
        onSuccess: () => {
            toast.success("Data berhasil disimpan");
        },
        onError: (err) => {
            if (err.message) toast.error(err.message);
        },
    });
};
</script>

<template>
    <div>
        <FormDynamic
            :jsonData="props.invitation.data"
            :editableFields="props.invitation.editableFields"
            @submit="submit"
            :response="response"
        />
    </div>
</template>
