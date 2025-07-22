<script setup lang="ts">
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import DataTable from "@/Components/DataTable.vue";
import { Head, router } from "@inertiajs/vue3";
import { toast } from "vue3-toastify";

const props = defineProps({
    users: Object,
    members: Object, // Menambahkan properti untuk members
    sortFields: Array<string>,
});

const options = {
    title: "Manage Users",
    addUrl: "/admin/users/add",
    headers: ["name", "email"],
    customHeaders: {},
    sortFields: props.sortFields,
    actions: [
        {
            label: "Edit",
            icon: "octicon:pencil-16",
            onClick: (row: any) => {
                router.visit(route("users.edit", { id: row.id }));  // Perbaiki rute ke users.edit
            },
        },
        {
            label: "Delete",
            icon: "octicon:trash-16",
            onClick: (row: any) => {
                router.visit(route("users.destroy", { id: row.id }), {  // Perbaiki rute ke users.destroy
                    onBefore: () => {
                        confirm("Are you sure you want to delete this User?");
                    },
                    method: "delete",
                    onSuccess: (e) => {
                        toast.success("User deleted successfully");
                    },
                    onError: (errors) => {
                        toast.error(errors.message);
                    },
                });
            },
        },
    ],
};

const memberOptions = {
    title: "Manage Members",
    addUrl: "/admin/members/add",
    headers: ["name", "email", "created_at"],
    customHeaders: {},
    sortFields: props.sortFields,
    actions: [
        {
            label: "Edit",
            icon: "octicon:pencil-16",
            onClick: (row: any) => {
                router.visit(route("members.edit", { id: row.id }));
            },
        },
        {
            label: "Delete",
            icon: "octicon:trash-16",
            onClick: (row: any) => {
                router.visit(route("members.destroy", { id: row.id }), {
                    onBefore: () => {
                        confirm("Are you sure you want to delete this Member?");
                    },
                    method: "delete",
                    onSuccess: (e) => {
                        toast.success("Member deleted successfully");
                    },
                    onError: (errors) => {
                        toast.error(errors.message);
                    },
                });
            },
        },
    ],
};

const pagination = {
    total: props.users.total,
    perPage: props.users.per_page,
    currentPage: props.users.current_page,
    lastPage: props.users.last_page,
    firstPageUrl: props.users.first_page_url,
    lastPageUrl: props.users.last_page_url,
    nextPageUrl: props.users.next_page_url,
    prevPageUrl: props.users.prev_page_url,
};

const memberPagination = {
    total: props.members.total,
    perPage: props.members.per_page,
    currentPage: props.members.current_page,
    lastPage: props.members.last_page,
    firstPageUrl: props.members.first_page_url,
    lastPageUrl: props.members.last_page_url,
    nextPageUrl: props.members.next_page_url,
    prevPageUrl: props.members.prev_page_url,
};
</script>

<template>
    <Head title="Manage Users and Members" />

    <AuthenticatedLayout>
        <template #header>
            <h2>Manage Users</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <!-- Manage Users DataTable -->
                    <DataTable
                        title="Invitation Orders"
                        :data="users.data"
                        :options="options"
                        :pagination="pagination"
                    />
                </div>
            </div>

            <!-- Manage Members DataTable -->
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 mt-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <DataTable
                        title="Manage Members"
                        :data="members.data"
                        :options="memberOptions"
                        :pagination="memberPagination"
                    />
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
