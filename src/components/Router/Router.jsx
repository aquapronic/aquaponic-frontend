import { Route, Routes } from 'react-router-dom';
import DashboardPage from '~/src/pages/dashboard/DashboardPage';
import DashboardListPage from '~/src/pages/dashboard/DashboardListPage';
import TradeListPage from '~/src/pages/trade/TradeListPage';
import HomePage from '~/src/pages/home/HomePage';

function Router() {
  return (
    <Routes>
      <Route path="/" element={<HomePage />} />
      <Route exact path="/dashboards" element={<DashboardListPage />} />
      <Route exact path="/dashboards/:farmId" element={<DashboardPage />} />
      <Route exact path="/trades" element={<TradeListPage />} />
    </Routes>
  );
}

export default Router;
