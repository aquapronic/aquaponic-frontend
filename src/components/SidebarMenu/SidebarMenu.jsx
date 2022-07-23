import { useNavigate } from 'react-router-dom';
import { Menu, Icon, Sidebar } from 'semantic-ui-react';
import WalletInfo from '~/src/components/WalletInfo/WalletInfo';
import styles from './SidebarMenu.module.scss';

function SidebarMenu() {
  const navigate = useNavigate()
  return (
    <Sidebar className={styles.sidebar} as={Menu} animation="push" icon="labeled" vertical visible>
      <WalletInfo />
      <Menu.Item as="a" onClick={() => navigate('/')}>
        <Icon name="chart area" />
        Dashboards
      </Menu.Item>
      <Menu.Item as="a" onClick={() => navigate('/trades')} disabled>
        <Icon name="balance scale" />
        Trades
      </Menu.Item>
      <Menu.Item as="a" onClick={() => navigate('/certificates')} disabled>
        <Icon name="certificate" />
        Certificates
      </Menu.Item>
    </Sidebar>
  );
}

export default SidebarMenu;
