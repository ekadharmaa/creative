<template>
    <AuthenticatedLayout>
        <div class="max-w-lg mx-auto p-6 bg-white shadow rounded-lg my-3">
            <h2 class="text-xl font-semibold mb-4">Create Member</h2>
            <form @submit.prevent="submit">
                <div class="mb-4">
                    <label class="block text-sm font-medium">Email</label>
                    <input
                        v-model="form.email"
                        type="email"
                        class="w-full p-2 border rounded"
                        required
                    />
                </div>
                <div class="mb-4">
                    <label class="block text-sm font-medium">Username</label>
                    <input
                        v-model="form.username"
                        type="text"
                        class="w-full p-2 border rounded"
                        required
                    />
                </div>
                <div class="mb-4">
                    <label class="block text-sm font-medium"
                        >Phone Number</label
                    >
                    <input
                        v-model="form.phone"
                        type="tel"
                        class="w-full p-2 border rounded"
                        required
                    />
                </div>
                <div class="mb-4">
                    <label class="block text-sm font-medium">Password</label>
                    <input
                        v-model="form.password"
                        type="password"
                        class="w-full p-2 border rounded"
                        required
                    />
                </div>
                <button
                    type="submit"
                    class="bg-green-500 text-white px-4 py-2 rounded"
                >
                    Create Member
                </button>
            </form>
        </div>
    </AuthenticatedLayout>
</template>

<script>
import { useForm } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";

export default {
    components: { AuthenticatedLayout },
    setup() {
        const form = useForm({
            email: "",
            username: "",
            phone: "",
            password: "",
        });

        const submit = () => {
            form.post(route("members.store"), {
                onSuccess: () => form.reset(),
            });
        };

        return { form, submit };
    },
};
</script>
