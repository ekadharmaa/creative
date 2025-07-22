<script setup lang="ts">
import { Head, router } from "@inertiajs/vue3";
import WebLayout from "@/Layouts/WebLayout.vue";
import type { Invitation } from "@/types/index";
import type { PropType } from "vue";
import NavLink from "@/Components/NavLink.vue";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import SecondaryButton from "@/Components/SecondaryButton.vue";
import SuccessButton from "@/Components/SuccessButton.vue";

const props = defineProps({
    user: {
        type: Object,
        required: true,
        default: null,
    },
    invitations: {
        type: Array as PropType<Invitation[]>,
        required: true,
        default: () => [],
    },
});

const payInvitation = (invitation: any) => {
    const token = invitation.payment_token;
    // @ts-ignore
    window.snap.pay(token, {
        onClose: function () {
            console.log(
                "customer closed the popup without finishing the payment"
            );
        },
    });
};

const invitationStatus = {
    pending: "py-1 px-3 bg-yellow-300 rounded-full text-xs uppercase",
    success: "py-1 px-3 bg-green-100 rounded-full text-xs uppercase",
    expired: "py-1 px-3 bg-red-100 rounded-full text-xs uppercase",
};
</script>

<template>
    <Head title="Member Area" />

    <WebLayout>
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-2 lg:p-6 text-gray-900">
                        <div class="p-3 bg-gray-900 text-white rounded-lg">
                            Selamat Datang Di Dashboard Undangan,
                            {{ user.name }}!
                        </div>

                        <h3 class="font-semibold text-2xl my-5 pb-3 border-b">
                            Undangan Saya
                        </h3>
                        <div v-if="invitations.length > 0">
                            <ul class="space-y-4">
                                <li
                                    v-for="(invitation, index) in invitations"
                                    :key="index"
                                >
                                    <div
                                        class="p-3 bg-gray-100 border rounded-xl flex flex-col gap-5 md:flex-row lg:flex-row justify-between"
                                    >
                                        <div class="flex gap-5">
                                            <img
                                                :src="invitation.template.image"
                                                :alt="invitation.template.name"
                                                class="w-24 h-24 object-cover rounded"
                                            />

                                            <div class="flex flex-col">
                                                <div
                                                    class="flex flex-col lg:flex-row lg:items-center lg:gap-5 mb-3"
                                                >
                                                    <h2
                                                        class="text-neutral-800 mb-1"
                                                    >
                                                        {{
                                                            invitation.order_id
                                                        }}
                                                    </h2>

                                                    <div class="flex gap-1">
                                                        <span
                                                            :class="{
                                                                'bg-blue-200 text-gray-800': invitation.template.membership === 'Basic',
                                                                'bg-yellow-600 text-white': invitation.template.membership === 'Premium'
                                                            }"
                                                            class="text-xs rounded-full py-1 px-3"
                                                        >
                                                            {{
                                                                invitation.template.membership
                                                            }}
                                                        </span>
                                                        <span
                                                            :class="
                                                                invitation
                                                                    ? invitationStatus[
                                                                          invitation
                                                                              .status
                                                                      ]
                                                                    : ''
                                                            "
                                                        >
                                                            {{
                                                                invitation.status ==
                                                                "success"
                                                                    ? "active"
                                                                    : invitation.status
                                                            }}
                                                        </span>
                                                    </div>
                                                </div>

                                                <h3
                                                    class="font-semibold text-lg mt-auto"
                                                >
                                                    {{
                                                        invitation.template.name
                                                    }}
                                                </h3>
                                                <p
                                                    class="text-sm text-gray-500"
                                                >
                                                    {{
                                                        invitation.template
                                                            .category
                                                    }}
                                                </p>
                                            </div>
                                        </div>

                                        <div class="flex flex-col">
                                            <div class="mt-auto flex gap-2">
                                                <button
                                                    v-if="
                                                        invitation.status ===
                                                        'pending'
                                                    "
                                                    @click="
                                                        payInvitation(
                                                            invitation
                                                        )
                                                    "
                                                >
                                                    <SecondaryButton
                                                        as="button"
                                                        class="min-w-32 flex justify-center"
                                                    >
                                                        Bayar
                                                    </SecondaryButton>
                                                </button>
                                                <a
                                                    v-else
                                                    target="_blank"
                                                    :href="`/undangan/${invitation.slug}?for=demouser`"
                                                >
                                                    <PrimaryButton
                                                        as="button"
                                                        class="min-w-32 flex justify-center"
                                                    >
                                                        Preview
                                                    </PrimaryButton>
                                                </a>

                                                <!-- Show 'Lihat Detail' button only if status is 'success' -->
                                                <NavLink
                                                    v-if="
                                                        invitation.status ===
                                                        'success'
                                                    "
                                                    :href="`/member/invitation/${invitation.slug}`"
                                                >
                                                    <SuccessButton as="button">
                                                        Lihat Details
                                                    </SuccessButton>
                                                </NavLink>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div v-else class="text-center py-10">
                            <h3 class="text-2xl font-semibold text-gray-500">
                                Belum ada undangan
                            </h3>
                            <p class="text-gray-500 mt-3">
                                Silakan gunakan template undangan yang tersedia
                            </p>
                            <NavLink href="/template">
                                <PrimaryButton as="button" class="mt-5">
                                    Gunakan Template
                                </PrimaryButton>
                            </NavLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </WebLayout>
</template>
