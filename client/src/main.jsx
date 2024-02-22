import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import { BrowserRouter as Router } from 'react-router-dom';
import { Provider } from 'react';
import { store } from './store.js';

ReactDOM.createRoot(document.getElementById('root')).render(
  <Router>
    <Provider>
      <App />
    </Provider>
  </Router>,
)
