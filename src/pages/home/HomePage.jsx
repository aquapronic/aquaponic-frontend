import classNames from 'classnames';
import { Segment } from 'semantic-ui-react';
import styles from './HomePage.module.scss';

function HomePage() {
  return (
    <Segment basic className={classNames(styles.container, 'page-root')}>
      <img className={styles.logo} src="/img/aquapronic_logo.svg" alt="Aquapronic Logo" />
      <p className={styles.paragraph}>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum.
      </p>
    </Segment>
  );
}

export default HomePage;
