import { defineStore } from "pinia";

export const useSidebarStore = defineStore('sidebar', {
    state: () => ({
        menu: [
            {
                name: 'Dashboard',
                href: 'admin/dashboard',
                icon: 'material-symbols:space-dashboard-sharp',
                current: 'dashboard'
            },
            {
                name: 'Orders',
                href: 'admin/orders',
                icon: 'mdi:receipt-text',
                current: 'orders'
            },
            {
                name: 'Users',
                href: 'admin/users',
                icon: 'mdi:users',
                current: 'users'
            },
            // {
            //     name: 'Templates',
            //     href: '#',
            //     icon: 'mdi:folder-multiple',
            //     current: '#'
            // },
            {
                name: 'Settings',
                href: 'admin/web-settings/edit',
                icon: 'mdi:cog',
                current: 'settings'
            },
            // {
            //     name: 'Calendar',
            //     href: '#',
            //     icon: 'mdi:calendar-month',
            //     current: '#'
            // },
            // {
            //     name: 'Documents',
            //     href: '#',
            //     icon: 'mdi:file-document',
            //     current: '#'
            // },
            {
                name: 'Reports',
                href: 'admin/reports',
                icon: 'mdi:chart-bar',
                current: 'reports'
            }
        ],
        webMenu: [
            {
                name: 'Home',
                href: '',
                icon: 'material-symbols:space-dashboard-sharp',
                current: 'home'
            },
            {
                name: 'Template',
                href: 'template',
                icon: 'mdi:receipt-text',
                current: 'template'
            },
            {
                name: 'Price',
                href: 'price',
                icon: 'mdi:folder-multiple',
                current: 'price'
            },
            // {
            //     name: 'Tutorial',
            //     href: 'tutorial',
            //     icon: 'mdi:calendar-month',
            //     current: 'tutorial'
            // }
        ],
        memberMenu: [
            {
                name: 'Dashboard',
                href: 'member/dashboard',
                icon: 'material-symbols:space-dashboard-sharp',
                current: 'dashboard'
            },
            {
                name: 'My Invitation',
                href: 'member/dashboard',
                icon: 'mdi:receipt-text',
                current: 'invitation'
            }
        ]
    }),
    actions: {
    },
});
