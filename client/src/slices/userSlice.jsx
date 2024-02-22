import { createSlice } from "@reduxjs/toolkit"

export const userSlice = createSlice({
    name: "user",
    initialState: {
        user: null,
        loggedIn: false,
        admin: false,
        errors: []
    },
    reducers: {
        login: (state, action) => {
            state.user = action.payload
            state.loggedIn = true
            state.admin = action.payload.admin
        },
        logout: (state) => {
            state.user = null
            state.loggedIn = false
            state.admin = false
        },
        setErrors: (state, action) => {
            state.errors = action.payload
        }
    }
})

export const { login, logout, setErrors } = userSlice.actions;

export default userSlice.reducer;