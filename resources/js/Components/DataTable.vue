<script setup lang="ts">
import Pagination from '@/Components/Pagination.vue';
import { debounce } from '@/utils/debounce';
import { Icon } from '@iconify/vue';
import { useRoute } from '../../../vendor/tightenco/ziggy/src/js';
import { reactive } from 'vue';
import { onMounted } from 'vue';
import { router } from '@inertiajs/vue3'
import { watch } from 'vue';
import { ref } from 'vue';
import Popover from '@/Components/Popover.vue';
import NavLink from './NavLink.vue';

const route = useRoute();
const { sort_by, direction, search_query } = route().params;

interface Actions {
    label: string;
    icon: string;
    onClick: (row: any) => void;
}

interface Options {
    headers: string[];
    customHeaders: { [key: string]: string };
    title: string;
    addUrl?: string;
    sortFields: string[];
    actions: Actions[];
}

const props = defineProps({
    data: {
        type: Array,
        required: true,
        default: () => [],
    },
    options: {
        type: Object as () => Options,
        required: true,
        default: () => ({
            headers: ['id'],
            customHeaders: {},
            title: null,
            sortFields: { sort_by: '', direction: '' },
            actions: [],
        }),
    },
    format: {
        type: Function,
        required: false,
        default: (value: any) => value,
    },
    pagination: {
        type: Object,
        required: true,
        default: () => ({
            total: 0,
            perPage: 10,
            currentPage: 1,
            lastPage: 1,
            firstPageUrl: '',
            lastPageUrl: '',
            nextPageUrl: '',
            prevPageUrl: '',
        }),
    },
})

const state = reactive({
    sort: {
        sort_by: sort_by || props.options.sortFields[0] || '',
        direction: direction || '',
    },
    search: search_query || '',
})

const searchInput = ref(null);

const actionColors = {
    'View': 'text-blue-500',
    'Edit': 'text-yellow-500',
    'Delete': 'text-red-500',
}

const camelToTitle = (camelCase: string): string => {
    return camelCase
        .replace(/([A-Z])/g, ' $1')
        .replace(/^./, (str) => str.toUpperCase());
}

const formatCurrency = (value: number): string => {
    return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR',
    }).format(value);
}

const formatDate = (date: string): string => {
    return new Date(date).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
    });
}

const handleSearchInput = debounce((event: any) => {
    state.search = event.target.value;
}, 100);

watch(() => state.sort, (sort) => {
    router.get('', (state.sort as any), { replace: true });
}, { deep: true });

watch(() => state.search, (value: any) => {
    router.get('', { search_query: value, page: 1 }, { replace: true });
}, { deep: true });

onMounted(() => {
    if (search_query && searchInput.value) {
        searchInput.value.focus();
    }
});

</script>

<template>

    <div class="p-5">
        <div class="flex flex-col lg:flex-row items-start lg:items-center justify-between">
            <h2 v-if="options.title" class="text-2xl font-semibold mb-5">{{ options.title }}</h2>

            <div class="flex gap-2 items-center justify-between lg:justify-normal mb-5 w-full lg:w-auto">
                <!-- Search -->
                <div>
                    <input ref="searchInput" type="text" class="p-2 border border-gray-300 rounded"
                        placeholder="Search..." :value="state.search" @input="handleSearchInput" />
                </div>

                <!-- Add Button -->
                <div v-if="options.addUrl">
                    <NavLink :href="options.addUrl"
                        class="p-[.70rem] border border-gray-300 rounded bg-blue-500 text-white">
                        + Add Data
                    </NavLink>
                </div>

            </div>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full">
                <thead>
                    <tr>
                        <template v-for="(value, index) in (options.headers)" :key="index">
                            <th>
                                <div class="flex gap-2 items-center justify-between">
                                    {{ options.customHeaders[value] ?? camelToTitle(value) }}

                                    <!-- sort -->
                                    <template v-for="(sortField, index) in options.sortFields" :key="index">
                                        <template v-if="sortField == value">
                                            <span class="float-right"
                                                :class="{ 'text-green-500': state.sort.sort_by == value && state.sort.direction == 'asc', 'text-red-500': state.sort.sort_by == value && state.sort.direction == 'desc' }">
                                                <Icon
                                                    v-if="state.sort.sort_by == value && state.sort.direction == 'desc'"
                                                    icon="bi:sort-up"
                                                    @click="state.sort.sort_by = value; state.sort.direction = 'asc'" />
                                                <Icon
                                                    v-else-if="state.sort.sort_by == value && state.sort.direction == 'asc'"
                                                    icon="bi:sort-down"
                                                    @click="state.sort.sort_by = value; state.sort.direction = 'desc'" />
                                                <Icon v-else icon="bi:sort-up"
                                                    @click="state.sort.sort_by = value; state.sort.direction = 'asc'" />
                                            </span>
                                        </template>
                                    </template>
                                </div>
                            </th>
                        </template>
                        <th v-if="props.options.actions.length > 0">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <template v-for="(row, index) in data" :key="index">
                        <tr>
                            <template v-for="(header, index) in (options.headers as any)" :key="index">
                                <!-- if type string -->
                                <template v-if="typeof row[header] == 'string'">
                                    <td v-if="header == 'created_at'">{{ formatDate(row[header]) }}</td>
                                    <td v-else>{{ row[header] }}</td>
                                </template>
                                <!-- if type number -->
                                <td v-else-if="typeof row[header] == 'number'">{{ formatCurrency(row[header]) }}</td>
                            </template>
                            <td v-if="props.options.actions.length > 0">
                                <div class="flex justify-end">
                                    <Popover>
                                        <template #trigger>
                                            <div>
                                                <Icon icon="bi:three-dots-vertical" class="w-4 h-4 cursor-pointer" />
                                            </div>
                                        </template>
                                        <template #content>
                                            <ul class="py-2">
                                                <li v-for="(action, index) in options.actions" :key="index">
                                                    <button @click="action.onClick(row)"
                                                        class="w-full text-left px-2 py-1 flex items-center gap-3 hover:bg-gray-200">
                                                        <Icon :icon="action.icon" class="w-4 h-4 inline-block"
                                                            :class="actionColors[action.label]" />
                                                        {{ action.label }}
                                                    </button>
                                                </li>
                                            </ul>
                                        </template>
                                    </Popover>
                                </div>
                            </td>
                        </tr>
                    </template>
                </tbody>
            </table>
        </div>

        <Pagination v-if="pagination.total > pagination.perPage" :total="pagination.total"
            :nextPageUrl="pagination.nextPageUrl" :prevPageUrl="pagination.prevPageUrl" :perPage="pagination.perPage"
            :currentPage="pagination.currentPage" :lastPage="pagination.lastPage"
            :firstPageUrl="pagination.firstPageUrl" :lastPageUrl="pagination.lastPageUrl"
            @update="($event) => $emit('update', $event)" />
    </div>

</template>

<style lang="scss">
table {
    border-collapse: collapse;
    width: 100%;
}

th,
td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
    font-size: 14px;
}

th {
    background-color: #f2f2f2;
    font-weight: 600;
    font-size: 16px;
    white-space: nowrap;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f1f1f1;
}

tr {
    white-space: nowrap;
}
</style>