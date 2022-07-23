import { Route, Routes } from 'react-router-dom';
import DashboardListPage from '~/src/pages/dashboard/DashboardListPage';
import DashboardPage from '~/src/pages/dashboard/DashboardPage';

function Router() {
  return (
    <Routes>
      <Route path="/" element={<DashboardListPage />} />
      <Route exact path="/dashboard/:farmId" element={<DashboardPage />} />
    </Routes>
  );
}

export default Router;
