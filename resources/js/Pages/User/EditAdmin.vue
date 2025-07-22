<template>
  <AuthenticatedLayout>
    <template #header>
      <h2>Edit Admin</h2>
    </template>

    <div class="py-12">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
          <form @submit.prevent="submit">
            <div class="p-6">
              <div class="mb-4">
                <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                <input
                  id="name"
                  type="text"
                  v-model="form.name"
                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                  required
                />
              </div>

              <div class="mb-4">
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input
                  id="email"
                  type="email"
                  v-model="form.email"
                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                  required
                />
              </div>

              <div class="mb-4">
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <input
                  id="password"
                  type="password"
                  v-model="form.password"
                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                  placeholder="Masukan Password Yang Baru"
                />
              </div>

              <div class="flex items-center justify-end mt-4">
                <button
                  type="submit"
                  class="bg-blue-500 text-white px-4 py-2 rounded-md"
                  :disabled="isProcessing"
                >
                  Update Admin
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </AuthenticatedLayout>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { useForm } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";

const props = defineProps({
  admin: Object, // Receive the 'admin' data passed from the controller
});

const form = ref({
  name: props.admin.name,
  email: props.admin.email,
  password: "", // Password field
});

const isProcessing = ref(false);

const submit = () => {
  // If password is not set, we avoid sending it in the form
  if (!form.value.password) {
    delete form.value.password; // Remove password if empty
  }

  isProcessing.value = true;

  // Submit the form to update the admin
  useForm(form.value).put(route("users.update", { id: props.admin.id }), {
    onFinish: () => {
      isProcessing.value = false;
    },
  });
};
</script>
