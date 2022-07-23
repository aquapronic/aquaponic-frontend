import classNames from 'classnames';
import { Grid, Header } from 'semantic-ui-react';
import FishDataChart from '~/src/components/FishDataChart/FishDataChart';
import FishWaterChangeTable from '~/src/components/FishWaterChangeTable/FishWaterChangeTable';
import PlantDataChart from '~/src/components/PlantDataChart/PlantDataChart';
import styles from './DashboardPage.module.scss';

function DashboardPage() {
  return (
    <Grid stackable padded className={classNames('page-root', styles.pageRoot)}>
      <Grid.Row>
        <Grid.Column width={16}>
          <Header size="huge">Aquaponic Dashboard</Header>
        </Grid.Column>
      </Grid.Row>
      <Grid.Row>
        <Grid.Column width={8}>
          <FishDataChart />
          <PlantDataChart />
        </Grid.Column>
        <Grid.Column width={8}>
          <FishWaterChangeTable />
        </Grid.Column>
      </Grid.Row>
    </Grid>
  );
}

export default DashboardPage;
