<script setup lang="ts">
import { watch, reactive, type PropType } from 'vue';
import { Icon } from '@iconify/vue';
import NavLink from './NavLink.vue';
import { useLocalStorage } from '@/Composable/useLocalStorage';
import { useSidebarStore } from '@/Stores/sidebar';

const props = defineProps({
    modelValue: {
        type: Boolean,
        required: true,
        default: true,
    },
    menu: {
        type: Array as PropType<{ name: string, href: string, icon: string, current: string }[]>,
        required: true,
        default: () => [],
    }
});
const currentRoute = (name: string) => {
    return route().current(name);
}

const store = useSidebarStore();
const sidebarMenu = props.menu.length ? props.menu : store.menu;

const state = reactive({
    sidebarOpen: props.modelValue,
})
const { setValue } = useLocalStorage('sidebar', state.sidebarOpen);
defineEmits(['update:modelValue']);
</script>

<template>

    <aside class="fixed bg-white border-r hidden lg:flex flex-col h-[calc(100dvh-4rem)] py-5"
        :class="{ 'w-[4.5rem]': !state.sidebarOpen, 'w-64': state.sidebarOpen }">
        <ul class="w-full">
            <li v-for="(item, index) in sidebarMenu" :key="index">
                <NavLink :href="`/${item.href}`"
                    class="w-full px-6 p-3 text-sm flex items-center gap-5 hover:bg-gray-200"
                    :active="route().current().includes(item.current)">
                    <Icon :icon="item.icon" class="w-5 h-5 inline-block"
                        :class="{ 'text-neutral-800': !route().current().includes(item.current), 'text-blue-700': route().current().includes(item.current) }" />
                    {{ state.sidebarOpen ? item.name : '' }}
                </NavLink>
            </li>
        </ul>

        <div class="mt-auto w-full px-4">
            <button @click="(() => {
            state.sidebarOpen = !state.sidebarOpen;
            setValue(state.sidebarOpen);
            $emit('update:modelValue', state.sidebarOpen);
        })" class="p-2 border border-gray-200 rounded-full hover:bg-gray-100">
                <Icon icon="octicon:arrow-switch-24" class="w-5 h-5 text-neutral-800" />
            </button>
        </div>
    </aside>


</template>