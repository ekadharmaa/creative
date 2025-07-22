<script setup>
import { computed } from 'vue'
import { Head } from '@inertiajs/vue3';
import NavLink from '@/Components/NavLink.vue';
import WebLayout from '@/Layouts/WebLayout.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';

const props = defineProps({ status: Number })

const title = computed(() => {
    return {
        503: '503: Service Unavailable',
        500: '500: Server Error',
        404: '404: Page Not Found',
        403: '403: Forbidden',
    }[props.status]
})

const description = computed(() => {
    return {
        503: 'Sorry, we are doing some maintenance. Please check back soon.',
        500: 'Whoops, something went wrong on our servers.',
        404: 'Sorry, the page you are looking for could not be found.',
        403: 'Sorry, you are forbidden from accessing this page.',
    }[props.status]
})
</script>

<template>

    <Head :title="title" />

    <WebLayout>
        <div class="bg-white h-[calc(100dvh-4rem)] w-screen flex items-center justify-center">
            <div class="text-center">
                <img src="https://img.freepik.com/free-vector/tiny-people-examining-operating-system-error-warning-web-page-isolated-flat-illustration_74855-11104.jpg?size=626&ext=jpg&ga=GA1.1.1700460183.1712534400&semt=ais"
                    class="h-72 mb-5 -mt-10" alt="error">

                <h1 class="text-xl font-bold">{{ title }}</h1>
                <div>{{ description }}</div>

                <NavLink href="/">
                    <PrimaryButton class="mt-5">
                        Back to Home
                    </PrimaryButton>
                </NavLink>
            </div>
        </div>
    </WebLayout>
</template>