import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { Sidebar } from 'semantic-ui-react';
import SidebarMenu from '~/src/components/SidebarMenu/SidebarMenu';
import DashboardPage from '~/src/pages/dashboard/DashboardPage';
import HomePage from '~/src/pages/home/HomePage';
import styles from './App.module.scss';

function App() {
  return (
    <Sidebar.Pushable className={styles.sidebar}>
      <SidebarMenu />
      <Sidebar.Pusher>
          <Routes>
            <Route path="/" element={<HomePage />}></Route>
            <Route path="/dashboard" element={<DashboardPage />}></Route>
          </Routes>
      </Sidebar.Pusher>
    </Sidebar.Pushable>
  );
}

export default App;
