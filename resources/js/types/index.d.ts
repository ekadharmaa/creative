export interface User {
    id: number;
    name: string;
    email: string;
    email_verified_at: string;
    avatar: string;
}

export interface Member {
    id: number;
    uuid: string;
    name: string;
    email: string;
    phone: string;
}

export interface Template {
    name: string;
    slug: string;
    category: string;
    membership: string;
    image: string;
}

export interface InvitationDetail {
    uuid: string;
    title: string;
    slug: string;
    groom: string;
    bride: string;
    groom_photo: string;
    bride_photo: string;
    groom_desc: string;
    bride_desc: string;
    wedding_date: string;
    gallery: string[];
    location: string;
    qr_code: string;
    music: string;
    payment_token: string;
}

export interface Invitation extends InvitationDetail {
    id: string;
    order_id: string;
    slug: string;
    created_at: string;
    status: string;
    template: Template;
}

export interface Guest {
    id: number;
    name: string;
    wish: string;
    attendance: string;
}

export type PageProps<T extends Record<string, unknown> = Record<string, unknown>> = T & {
    auth: {
        user: User;
    };
    guard: {
        member: Member;
    },
    invitations: Invitation[];
};
