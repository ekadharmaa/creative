import { reactive } from 'vue';

export const useLocalStorage = <T>(key: string, initialValue: T) => {
    const storedValue = localStorage.getItem(key);

    if (!storedValue) {
        localStorage.setItem(key, JSON.stringify(initialValue));
    }

    const state = reactive({
        value: storedValue ? JSON.parse(storedValue) : initialValue,
    });

    const setValue = (value: T) => {
        state.value = value;
        localStorage.setItem(key, JSON.stringify(value));
    };

    return { state, setValue };
};