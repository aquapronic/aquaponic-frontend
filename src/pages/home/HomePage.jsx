import classNames from 'classnames';
import { Grid, Header } from 'semantic-ui-react';
import styles from './HomePage.module.scss';

function HomePage() {
  return (
    <Grid stackable padded className={classNames('page-root', styles.pageRoot)}>
      <Grid.Row>
        <Grid.Column width={16}>
          <Header size="huge">Home</Header>
        </Grid.Column>
      </Grid.Row>
    </Grid>
  );
}

export default HomePage;
