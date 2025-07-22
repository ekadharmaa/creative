<script setup lang="ts">
import Popper from "vue3-popper";
</script>

<template>
    <Popper placement="left" class="!block !border-none !m-0">
        <slot name="trigger"></slot>
        <template #content>
            <div class="bg-white shadow min-w-40">
                <slot name="content"></slot>
            </div>
        </template>
    </Popper>
</template>