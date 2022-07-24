import { useMemo } from 'react';
import { matchRoutes, useLocation, useNavigate } from 'react-router-dom';
import { Menu, Icon, Sidebar } from 'semantic-ui-react';
import WalletInfo from '~/src/components/WalletInfo/WalletInfo';
import { MENU, ROUTES } from '~/src/constants';
import styles from './SidebarMenu.module.scss';

function SidebarMenu() {
  const location = useLocation();

  const activeMenu = useMemo(() => {
    const matches = matchRoutes(ROUTES, location);
    return matches && matches[0].route.name;
  }, [location]);

  const navigate = useNavigate();
  return (
    <Sidebar className={styles.sidebar} as={Menu} animation="push" icon="labeled" vertical visible>
      <WalletInfo />
      <Menu.Item as="a" onClick={() => navigate('/')} active={activeMenu === MENU.HOME}>
        <Icon name="home" />
        Home
      </Menu.Item>
      <Menu.Item as="a" onClick={() => navigate('/dashboards')} active={activeMenu === MENU.DASHBOARDS}>
        <Icon name="chart area" />
        Dashboards
      </Menu.Item>
      <Menu.Item as="a" onClick={() => navigate('/trades')} active={activeMenu === MENU.TRADES}>
        <Icon name="balance scale" />
        Trades
      </Menu.Item>
      <Menu.Item
        as="a"
        onClick={() => navigate('/certificates')}
        active={activeMenu === MENU.CERTIFICATES}
        disabled
      >
        <Icon name="certificate" />
        Certificates
      </Menu.Item>
    </Sidebar>
  );
}

export default SidebarMenu;
