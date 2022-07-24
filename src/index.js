import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import App from '~/src/components/App/App';
import { AppDataProvider } from '~/src/context/AppDataContext';
import { ContractProvider } from '~/src/context/ContractContext';
import reportWebVitals from '~/src/reportWebVitals';
import 'semantic-ui-css/semantic.min.css';
import './index.scss';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <AppDataProvider>
    <ContractProvider>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </ContractProvider>
  </AppDataProvider>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
