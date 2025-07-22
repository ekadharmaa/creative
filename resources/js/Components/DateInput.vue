<script setup lang="ts">
import { computed } from 'vue';


const props = defineProps({
    modelValue: String,
})

const emits = defineEmits(['update:modelValue'])
const updateValue = (e: any) => {
    emits('update:modelValue', e.target.value)
}

const value = computed(() => {
    // convert to iso format
    return props.modelValue ? new Date(props.modelValue).toISOString().slice(0, 16) : null
})

</script>

<template>
    <input type="datetime-local" :value="value" @input="updateValue" />
</template>