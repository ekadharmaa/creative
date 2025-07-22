<script setup lang="ts">
import { Head, useForm, usePage } from "@inertiajs/vue3";
import WebLayout from "@/Layouts/WebLayout.vue";
import type { PropType } from "vue";
import type { Template } from "@/types";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import InputError from "@/Components/InputError.vue";
import { toast } from "vue3-toastify";
import { ref } from "vue";

const props = defineProps({
    template: {
        type: Object as PropType<Template>,
        required: true,
    },
    settings: {
        type: Object as PropType<{
            basic_price: number;
            premium_price: number;
        }>,
        default: () => ({
            basic_price: 50000,
            premium_price: 80000,
        }),
    },
});

const page = usePage();
const errorMsg = ref(null);

const form = useForm({
    name: page.props.auth.member?.name || "",
    email: page.props.auth.member?.email || "",
    phone: page.props.auth.member?.phone || "",
    password: page.props.auth.member ? null : "",
    template: props.template.slug,
    total: props.template.membership === "Basic"
        ? props.settings.basic_price
        : props.settings.premium_price,
});

const submit = () => {
    form.post("/checkout", {
        onSuccess: () => {
            toast.success("Checkout berhasil!");
        },
        onError: (err) => {
            if (err.message) errorMsg.value = err.message;
        },
    });
};
</script>


<template>
    <Head title="Checkout" />

    <WebLayout>
        <div class="py-12">
            <div class="max-w-7xl mx-auto px-3 lg:px-8">
                <div
                    class="bg-white overflow-hidden shadow-sm p-5 lg:p-0 sm:rounded-lg"
                >
                    <div class="p-2 lg:p-6 text-gray-900">
                        <h1 class="font-semibold text-2xl mb-5 pb-3 border-b">
                            Check Out
                        </h1>

                        <form @submit.prevent="submit">
                            <div>
                                <div class="grid lg:grid-cols-2 gap-8">
                                    <div>
                                        <h3 class="font-semibold pb-3 border-b">
                                            Detail Template
                                        </h3>

                                        <div
                                            class="rounded bg-gray-100 p-3 mt-5 border border-gray-300 flex gap-5"
                                        >
                                            <img
                                                :src="template.image"
                                                :alt="template.name"
                                                class="rounded-lg w-24"
                                            />

                                            <div
                                                class="flex flex-col items-start"
                                            >
                                                <h2
                                                    class="font-semibold text-lg"
                                                >
                                                    {{ template.name }}
                                                </h2>
                                                <div
                                                    class="text-sm text-gray-500"
                                                >
                                                    {{ template.category }}
                                                </div>
                                                <div
                                                    class="text-xs text-white bg-gray-900 p-1 px-5 rounded-full mt-auto"
                                                >
                                                    {{ template.membership }}
                                                </div>
                                            </div>
                                        </div>

                                        <InputError
                                            :message="errorMsg"
                                            class="p-4 bg-red-100 rounded mt-3"
                                        />
                                    </div>

                                    <div class="grid gap-2 lg:order-first">
                                        <h3 class="font-semibold pb-3 border-b">
                                            Detail Informasi
                                        </h3>

                                        <div class="flex flex-col gap-1">
                                            <label
                                                for="name"
                                                class="text-sm text-gray-500"
                                                >Nama</label
                                            >
                                            <input
                                                type="text"
                                                id="name"
                                                class="border rounded-lg p-2 w-full disabled:opacity-70"
                                                v-model="form.name"
                                                :disabled="
                                                    $page.props.auth.member !==
                                                    null
                                                "
                                            />
                                            <InputError
                                                :message="form.errors.name"
                                            />
                                        </div>

                                        <div class="flex flex-col gap-1">
                                            <label
                                                for="email"
                                                class="text-sm text-gray-500"
                                                >Email</label
                                            >
                                            <input
                                                type="email"
                                                id="email"
                                                class="border rounded-lg p-2 w-full disabled:opacity-70"
                                                v-model="form.email"
                                                :disabled="
                                                    $page.props.auth.member !==
                                                    null
                                                "
                                            />
                                            <InputError
                                                :message="form.errors.email"
                                            />
                                        </div>

                                        <!-- Form Input Phone (Hanya jika user belum login) -->
                                        <div
                                            v-if="!page.props.auth.member"
                                            class="flex flex-col gap-1"
                                        >
                                            <label
                                                for="phone"
                                                class="text-sm text-gray-500"
                                                >Nomor Telepon</label
                                            >
                                            <input
                                                type="text"
                                                id="phone"
                                                class="border rounded-lg p-2 w-full"
                                                v-model="form.phone"
                                            />
                                            <InputError
                                                :message="form.errors.phone"
                                            />
                                        </div>

                                        <!-- Form Input Password (Hanya jika user belum login) -->
                                        <div
                                            v-if="!page.props.auth.member"
                                            class="flex flex-col gap-1"
                                        >
                                            <label
                                                for="password"
                                                class="text-sm text-gray-500"
                                                >Password</label
                                            >
                                            <input
                                                type="password"
                                                id="password"
                                                class="border rounded-lg p-2 w-full"
                                                v-model="form.password"
                                            />
                                            <InputError
                                                :message="form.errors.password"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div
                                class="flex justify-between border-t mt-5 pt-5 items-center"
                            >
                                <PrimaryButton> Checkout </PrimaryButton>

                                <div class="text-2xl font-black">
                                    Rp. {{ form.total.toLocaleString("id-ID") }}
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </WebLayout>
</template>
