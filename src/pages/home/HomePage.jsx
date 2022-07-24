import classNames from 'classnames';
import { Header, Segment } from 'semantic-ui-react';
import styles from './HomePage.module.scss';

function HomePage() {
  return (
    <Segment basic className={classNames('page-root')}>
      <Header size="huge">Home</Header>
    </Segment>
  );
}

export default HomePage;
