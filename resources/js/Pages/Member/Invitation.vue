<script setup lang="ts">
import { Head, router } from "@inertiajs/vue3";
import WebLayout from "@/Layouts/WebLayout.vue";
import Edit from "./Partials/Edit.vue";
import AddGuest from "./Partials/AddGuest.vue";
import type { Guest } from "@/types/index";
import type { PropType } from "vue";
import { Icon } from "@iconify/vue";
import { ref, computed, onMounted } from "vue";
import { toast } from "vue3-toastify";

const props = defineProps({
  invitation: Object,
  guests: {
    type: Array as PropType<Guest[]>,
    required: true,
    default: () => [],
  },
  template: Object,
  sessionResponse: Object,
});

const activeTab = ref("guests");
const isAddGuest = ref(false);

const attendanceStatus = {
  pending: "Menunggu Konfirmasi",
  yes: "Hadir",
  no: "Tidak Hadir",
};

const attendanceClass = {
  yes: "bg-green-500 text-white",
  no: "bg-red-500 text-white",
  pending: "bg-yellow-300 text-black",
};

const attendGuest = computed(() =>
  props.guests.filter((guest) => guest.attendance === "yes")
);
const notAttendGuest = computed(() =>
  props.guests.filter((guest) => guest.attendance === "no")
);
const pendingGuest = computed(() =>
  props.guests.filter((guest) => guest.attendance === "pending")
);
const wish = computed(() =>
  props.guests.filter((guest) => guest.wish !== null)
);

const changeTab = (tab: string) => (activeTab.value = tab);

const deleteGuest = (id: number) => {
  router.delete(`/member/invitation/guests/${id}`, {
    onBefore: () => confirm("Apakah kamu yakin ingin menghapus tamu ini?"),
    onSuccess: () => toast.success("Tamu berhasil dihapus"),
  });
};

const copyLink = (name: string) => {
  const link = (window.location.href + "?for=" + name).replace(
    "member/invitation",
    "undangan"
  );
  const input = document.createElement("input");
  input.value = link;
  document.body.appendChild(input);
  input.select();
  document.execCommand("copy");
  document.body.removeChild(input);
  toast.success("Link berhasil disalin");
};

onMounted(() => {
  if (props.sessionResponse) {
    router.post(route("web.resetSession"));
  }
});

// Search, Sort, Pagination
const searchQuery = ref("");
const sortField = ref<'number' | 'name'>('number');
const sortDirection = ref<'asc' | 'desc'>('asc');

const toggleSort = (field: 'number' | 'name') => {
  if (sortField.value === field) {
    sortDirection.value = sortDirection.value === 'asc' ? 'desc' : 'asc';
  } else {
    sortField.value = field;
    sortDirection.value = 'asc';
  }
};

const filteredGuests = computed(() => {
  let result = props.guests;

  if (searchQuery.value.trim() !== "") {
    result = result.filter((guest) =>
      guest.name.toLowerCase().includes(searchQuery.value.toLowerCase())
    );
  }

  if (sortField.value === "name") {
    result = [...result].sort((a, b) =>
      sortDirection.value === "asc"
        ? a.name.localeCompare(b.name)
        : b.name.localeCompare(a.name)
    );
  } else {
    result = [...result].sort((a, b) =>
      sortDirection.value === "asc" ? a.id - b.id : b.id - a.id
    );
  }

  return result;
});

const currentPage = ref(1);
const perPage = 10;

const totalPages = computed(() =>
  Math.ceil(filteredGuests.value.length / perPage)
);

const paginatedGuests = computed(() => {
  const start = (currentPage.value - 1) * perPage;
  return filteredGuests.value.slice(start, start + perPage);
});

const nextPage = () => {
  if (currentPage.value < totalPages.value) currentPage.value++;
};

const prevPage = () => {
  if (currentPage.value > 1) currentPage.value--;
};
</script>

<template>
  <Head title="Member Area" />
  <WebLayout>
    <div class="py-12">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <div class="bg-white shadow-sm rounded-lg p-6">
          <!-- Header -->
          <div class="flex flex-col lg:flex-row justify-between items-start border-b pb-4 gap-4">
            <div>
              <h1 class="text-lg font-bold mb-1">
                {{ invitation.order_id }}
                <span class="ml-2 text-xs py-1 px-3 rounded-full bg-green-100 uppercase">
                  {{ invitation.status }}
                </span>
              </h1>
              <p class="text-sm text-gray-600">
                <span class="font-semibold">Template:</span>
                {{ template.name }} - {{ template.category }}
              </p>
            </div>

            <div class="flex flex-wrap gap-2">
              <button @click="changeTab('guests')"
                :class="['px-4 py-2 rounded-full text-sm', activeTab === 'guests' ? 'bg-gray-900 text-white' : 'bg-gray-200']">
                Daftar Tamu
              </button>
              <button @click="changeTab('wishes')"
                :class="['px-4 py-2 rounded-full text-sm', activeTab === 'wishes' ? 'bg-gray-900 text-white' : 'bg-gray-200']">
                Ucapan
              </button>
              <button @click="changeTab('edit')"
                :class="['px-4 py-2 rounded-full text-sm', activeTab === 'edit' ? 'bg-gray-900 text-white' : 'bg-gray-200']">
                Edit
              </button>
            </div>
          </div>

          <!-- Guests Tab -->
          <div v-if="activeTab === 'guests'" class="mt-6">
            <!-- Stats -->
            <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-5 mb-6">
              <div class="bg-gray-900 text-white p-5 rounded-lg flex justify-between text-3xl items-end">
                <Icon icon="mdi:account" />
                <div class="text-right">
                  {{ filteredGuests.length }}<div class="text-base font-normal">Tamu</div>
                </div>
              </div>
              <div class="bg-green-600 text-white p-5 rounded-lg flex justify-between text-3xl items-end">
                <Icon icon="mdi:check" />
                <div class="text-right">
                  {{ attendGuest.length }}<div class="text-base font-normal">Hadir</div>
                </div>
              </div>
              <div class="bg-red-600 text-white p-5 rounded-lg flex justify-between text-3xl items-end">
                <Icon icon="mdi:close" />
                <div class="text-right">
                  {{ notAttendGuest.length }}<div class="text-base font-normal">Tidak Hadir</div>
                </div>
              </div>
              <div class="bg-yellow-400 text-black p-5 rounded-lg flex justify-between text-3xl items-end">
                <Icon icon="mdi:clock-outline" />
                <div class="text-right">
                  {{ pendingGuest.length }}<div class="text-base font-normal">Menunggu</div>
                </div>
              </div>
            </div>

            <!-- Tambah Tamu -->
            <div class="flex justify-between items-center border-b pb-4 mb-4">
              <h2 class="font-semibold text-lg">Daftar Tamu</h2>
              <button @click="isAddGuest = !isAddGuest"
                class="bg-blue-500 hover:bg-blue-700 text-white px-4 py-2 rounded-lg text-sm">
                Tambah Tamu
              </button>
            </div>

            <AddGuest v-if="isAddGuest" :invitation="invitation" :guests="guests" />

            <!-- Search - posisi kanan dengan ikon -->
            <div class="mb-4 flex justify-end">
            <div class="relative w-full sm:w-1/2">
                <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400">
                <Icon icon="mdi:magnify" class="w-4 h-4" />
                </span>
                <input
                v-model="searchQuery"
                type="text"
                placeholder="Cari nama tamu..."
                class="pl-10 pr-3 py-2 w-full border rounded shadow-sm text-sm focus:ring focus:outline-none"
                />
            </div>
            </div>

            <!-- Table -->
            <div class="overflow-x-auto mt-4">
              <table class="min-w-full border text-sm">
                <thead class="bg-gray-100 text-center">
                  <tr>
                    <th class="px-4 py-2 border cursor-pointer" @click="toggleSort('number')">
                      No
                      <Icon :icon="sortField === 'number' && sortDirection === 'asc' ? 'mdi:arrow-up' : 'mdi:arrow-down'" class="ml-1 w-4 h-4 inline" />
                    </th>
                    <th class="px-4 py-2 border cursor-pointer" @click="toggleSort('name')">
                      Nama
                      <Icon :icon="sortField === 'name' && sortDirection === 'asc' ? 'mdi:arrow-up' : 'mdi:arrow-down'" class="ml-1 w-4 h-4 inline" />
                    </th>
                    <th class="px-4 py-2 border">Status Kehadiran</th>
                    <th class="px-4 py-2 border">Aksi</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(guest, index) in paginatedGuests" :key="guest.id" class="hover:bg-gray-50 text-center">
                    <td class="px-4 py-2 border">
                      {{ (currentPage - 1) * perPage + index + 1 }}
                    </td>
                    <td class="px-4 py-2 border">{{ guest.name }}</td>
                    <td class="px-4 py-2 border">
                      <span
                        :class="['inline-block rounded-full px-3 py-1 text-xs font-semibold', attendanceClass[guest.attendance]]"
                      >
                        {{ attendanceStatus[guest.attendance] }}
                      </span>
                    </td>
                    <td class="px-4 py-2 border">
                      <div class="flex flex-col sm:flex-row justify-center gap-2">
                        <button @click="deleteGuest(guest.id)" class="bg-red-500 hover:bg-red-700 text-white px-3 py-1 rounded text-xs flex items-center justify-center">
                          <Icon icon="mdi:delete" class="mr-1" /> Hapus
                        </button>
                        <button @click="copyLink(guest.name)" class="bg-green-500 hover:bg-green-700 text-white px-3 py-1 rounded text-xs flex items-center justify-center">
                          <Icon icon="mdi:content-copy" class="mr-1" /> Copy Link
                        </button>
                      </div>
                    </td>
                  </tr>
                  <tr v-if="paginatedGuests.length === 0">
                    <td colspan="4" class="text-center py-4 text-gray-500">Tidak ada tamu yang ditampilkan.</td>
                  </tr>
                </tbody>
              </table>

              <!-- Pagination -->
              <div class="mt-4 flex justify-between items-center">
                <button @click="prevPage" :disabled="currentPage === 1" class="px-4 py-2 bg-gray-200 rounded disabled:opacity-50">Sebelumnya</button>
                <span class="text-sm text-gray-600">Halaman {{ currentPage }} dari {{ totalPages }}</span>
                <button @click="nextPage" :disabled="currentPage === totalPages" class="px-4 py-2 bg-gray-200 rounded disabled:opacity-50">Selanjutnya</button>
              </div>
            </div>
          </div>

          <!-- Wishes Tab -->
          <div v-if="activeTab === 'wishes'" class="mt-6">
            <h2 class="font-semibold text-lg mb-3">Ucapan Tamu</h2>
            <div v-if="wish.length > 0" class="space-y-4">
              <div v-for="guest in wish" :key="guest.id" class="border p-4 rounded-lg bg-gray-50">
                <div class="font-semibold text-gray-800">{{ guest.name }}</div>
                <div class="text-sm text-gray-600 mt-1">{{ guest.wish }}</div>
              </div>
            </div>
            <div v-else class="text-gray-500">Belum ada ucapan dari tamu.</div>
          </div>

          <!-- Edit Tab -->
          <div v-if="activeTab === 'edit'" class="mt-6">
            <Edit :invitation="invitation" />
          </div>
        </div>
      </div>
    </div>
  </WebLayout>
</template>
