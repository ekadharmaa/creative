<script setup lang="ts">
import InputError from "@/Components/InputError.vue";
import InputLabel from "@/Components/InputLabel.vue";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import TextInput from "@/Components/TextInput.vue";
import { Link, useForm, usePage } from "@inertiajs/vue3";
import { ref, watch } from "vue";

defineProps<{
    mustVerifyEmail?: Boolean;
    status?: String;
}>();

const user = usePage().props.auth.admin;

const form = useForm({
    name: user.name,
    email: user.email,
    avatar: null,
});

form.transform((data) => {
    const formData = new FormData();
    formData.append('name', data.name); // pastikan ini dikirim
    formData.append('email', data.email); // pastikan ini dikirim
    if (data.avatar) {
        formData.append('avatar', data.avatar);
    }
    return formData;
});

function onFileChange(e: Event) {
    const target = e.target as HTMLInputElement;
    if (target?.files?.[0]) {
        form.avatar = target.files[0];
    }
}

const avatarPreview = ref(user.avatar);

watch(() => form.avatar, (newVal) => {
    if (newVal && typeof newVal !== "string") {
        avatarPreview.value = URL.createObjectURL(newVal);
    } else {
        avatarPreview.value = user.avatar;
    }
});
</script>

<template>
    <section>
        <header>
            <h2 class="text-lg font-medium text-gray-900">
                Profile Information
            </h2>

            <p class="mt-1 text-sm text-gray-600">
                Update your account's profile information and email address.
            </p>
        </header>

        <form
            @submit.prevent="form.submit('patch', route('profile.update'), { forceFormData: true })"
            class="mt-6 space-y-6"
        >
            <div>
                <InputLabel for="name" value="Name" />
                <TextInput
                    id="name"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.name"
                    required
                    autofocus
                    autocomplete="name"
                />
                <InputError class="mt-2" :message="form.errors.name" />
            </div>

            <div>
                <InputLabel for="email" value="Email" />
                <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full"
                    v-model="form.email"
                    required
                    autocomplete="username"
                />
                <InputError class="mt-2" :message="form.errors.email" />
            </div>

            <div>
                <InputLabel for="avatar" value="Avatar" />
                <img
                    :src="avatarPreview"
                    class="w-20 h-20 rounded-full my-2"
                />

                <input
                    id="avatar"
                    type="file"
                    class="mt-1 block w-full"
                    accept="image/*"
                    @change="onFileChange"
                />

                <InputError class="mt-2" :message="form.errors.avatar" />
            </div>

            <div v-if="mustVerifyEmail && user.email_verified_at === null">
                <p class="text-sm mt-2 text-gray-800">
                    Your email address is unverified.
                    <Link
                        :href="route('verification.send')"
                        method="post"
                        as="button"
                        class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                        Click here to re-send the verification email.
                    </Link>
                </p>

                <div
                    v-show="status === 'verification-link-sent'"
                    class="mt-2 font-medium text-sm text-green-600"
                >
                    A new verification link has been sent to your email address.
                </div>
            </div>

            <div class="flex items-center gap-4">
                <PrimaryButton :disabled="form.processing">Save</PrimaryButton>

                <Transition
                    enter-active-class="transition ease-in-out"
                    enter-from-class="opacity-0"
                    leave-active-class="transition ease-in-out"
                    leave-to-class="opacity-0"
                >
                    <p
                        v-if="form.recentlySuccessful"
                        class="text-sm text-gray-600"
                    >
                        Saved.
                    </p>
                </Transition>
            </div>
        </form>
    </section>
</template>
