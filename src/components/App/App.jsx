import { Sidebar } from 'semantic-ui-react';
import Router from '~/src/components/Router/Router';
import SidebarMenu from '~/src/components/SidebarMenu/SidebarMenu';
import styles from './App.module.scss';

function App() {
  return (
    <Sidebar.Pushable className={styles.sidebar}>
      <SidebarMenu />
      <Sidebar.Pusher>
        <Router />
      </Sidebar.Pusher>
    </Sidebar.Pushable>
  );
}

export default App;
