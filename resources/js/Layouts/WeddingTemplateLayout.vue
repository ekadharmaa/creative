<script setup lang="ts">
import Top from "@/Components/Template/Top.vue";
import Right from "@/Components/Template/Right.vue";
import Bottom from "@/Components/Template/Bottom.vue";
import Left from "@/Components/Template/Left.vue";
import Corner from "@/Components/Template/Corner.vue";
import BotomNavigation from "@/Components/Template/BotomNavigation.vue";
import MusicControls from "@/Components/Template/MusicControls.vue";
import { ref } from "vue";

const props = defineProps({
    partials: {
        type: Object as any,
        required: true,
    },
    music: String,
    color: {
        type: String,
        default: "#000000",
    },
    navigation: Object,
    showNavigation: {
        type: Boolean,
        default: false,
    },
    playMusic: {
        type: Boolean,
        default: false,
    },
    background: Object,
    navigationType: {
        type: String,
        default: "wedding",
    },
    menu: Array,
});

const tabMenu = ref("opening");

const onChangeTab = (tab: string) => {
    tabMenu.value = tab;
};
</script>

<template>
    <div :style="{ backgroundColor: props.color }">
        <div
            class="h-[100dvh] overflow-y-hidden overflow-x-hidden max-w-[414px] mx-auto relative"
        >
            <!-- Main Layout -->
            <div
                class="px-4 py-8 relative bg-opacity-10"
                :style="{ backgroundColor: props.color }"
                :class="{
                    'h-[calc(100dvh-4rem)]': props.showNavigation,
                    'h-[calc(100dvh)]': !props.showNavigation,
                }"
            >
                <!-- Background Overlay from URL -->
                <div
                    v-if="props.background"
                    class="absolute top-0 left-0 w-full h-full bg-cover bg-center"
                    :style="props.background"
                ></div>

                <!-- Top -->
                <Top
                    v-if="props.partials?.top"
                    :src="props.partials.top.src"
                    :style="props.partials.top.style"
                />
                <!-- Right -->
                <Right
                    v-if="props.partials?.right"
                    :src="props.partials.right.src"
                    :style="props.partials.right.style"
                />
                <!-- Bottom -->
                <Bottom
                    v-if="props.partials?.bottom"
                    :src="props.partials.bottom.src"
                    :style="props.partials.bottom.style"
                />
                <!-- Left -->
                <Left
                    v-if="props.partials?.left"
                    :src="props.partials.left.src"
                    :style="props.partials.left.style"
                />
                <!-- Top Right -->
                <Corner
                    v-if="props.partials?.topRight"
                    :src="props.partials.topRight.src"
                    :style="props.partials.topRight.style"
                    class="w-1/2 top-right"
                />
                <!-- Bottom Right -->
                <Corner
                    v-if="props.partials?.bottomRight"
                    :src="props.partials.bottomRight.src"
                    :style="props.partials.bottomRight.style"
                    class="w-1/2 bottom-right"
                />
                <!-- Bottom Left -->
                <Corner
                    v-if="props.partials?.bottomLeft"
                    :src="props.partials.bottomLeft.src"
                    :style="props.partials.bottomLeft.style"
                    class="w-1/2 bottom-left"
                />
                <!-- Top Left -->
                <Corner
                    v-if="props.partials?.topLeft"
                    :src="props.partials.topLeft.src"
                    :style="props.partials.topLeft.style"
                    class="w-1/2 top-left"
                />

                <div
                    class="absolute top-0 left-0 w-full h-full text-white flex items-center justify-center"
                >
                    <slot :name="tabMenu" />
                </div>

                <MusicControls
                    v-if="showNavigation"
                    :color="props.navigation.primary"
                    :accentColor="props.navigation.secondary"
                    :play-music="props.playMusic"
                    :src="props.music"
                />
            </div>

            <BotomNavigation
                v-if="showNavigation"
                :accent-color="props.navigation.primary"
                :menu="props.menu"
                :color="props.navigation.secondary"
                @change-tab="onChangeTab"
                :type="navigationType"
            />

            <slot name="reservation" />
        </div>
    </div>
</template>

<style scoped lang="scss">
@keyframes top-right {
    0% {
        transform: translate(100%, -100%);
    }

    100% {
        transform: translate(0, 0);
    }
}

@keyframes bottom-right {
    0% {
        transform: translate(100%, 100%);
    }

    100% {
        transform: translate(0, 0);
    }
}

@keyframes bottom-left {
    0% {
        transform: translate(-100%, 100%);
    }

    100% {
        transform: translate(0, 0);
    }
}

@keyframes top-left {
    0% {
        transform: translate(-100%, -100%);
    }

    100% {
        transform: translate(0, 0);
    }
}

@keyframes top {
    0% {
        transform: translateY(-100%);
    }

    100% {
        transform: translateY(0);
    }
}

@keyframes right {
    0% {
        transform: translateX(100%);
    }

    100% {
        transform: translateX(0);
    }
}

@keyframes bottom {
    0% {
        transform: translateY(100%);
    }

    100% {
        transform: translateY(0);
    }
}

@keyframes left {
    0% {
        transform: translateX(-100%);
    }

    100% {
        transform: translateX(0);
    }
}

.top-right {
    animation: top-right 1s;
}

.bottom-right {
    animation: bottom-right 1s;
}

.bottom-left {
    animation: bottom-left 1s;
}

.top-left {
    animation: top-left 1s;
}

.top {
    animation: top 1s;
}

.right {
    animation: right 1s;
}

.bottom {
    animation: bottom 1s;
}

.left {
    animation: left 1s;
}
</style>
