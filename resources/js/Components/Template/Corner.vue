<script setup lang="ts">

const props = defineProps({
    src: {
        type: String,
        required: true
    }
})

</script>

<template>
    <div>
        <img :src="props.src" />
    </div>
</template>