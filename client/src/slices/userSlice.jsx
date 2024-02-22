import { createSlice } from "@reduxjs/toolkit"

export const userSlice = createSlice({
    name: "user",
    initialState: {
        user: null,
        loggedIn: false,
        errors: []
    },
    reducers: {
        login: (state, action) => {
            state.user = action.payload
            state.loggedIn = true
        },
        logout: (state) => {
            state.user = null
            state.loggedIn = false
        },
        setErrors: (state, action) => {
            state.errors = action.payload
        }
    }
})

export const { login, logout, setErrors } = userSlice.actions;

export default userSlice.reducer;