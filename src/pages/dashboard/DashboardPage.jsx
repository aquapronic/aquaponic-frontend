import classNames from 'classnames';
import { useParams } from 'react-router-dom';
import { Grid, Header, Segment } from 'semantic-ui-react';
import AirTempChart from '~/src/components/AirTempChart/AirTempChart';
import WaterChangeTable from '~/src/components/WaterChangeTable/WaterChangeTable';
import WaterPhChart from '~/src/components/WaterPhChart/WaterPhChart';
import WaterTempChart from '~/src/components/WaterTempChart/WaterTempChart';
import styles from './DashboardPage.module.scss';

function DashboardPage() {
  const params = useParams();

  return (
    <Segment basic className={classNames('page-root')}>
      <Header size="huge">Farms {'>'} {params.farmId}</Header>
      <Grid stackable>
        <Grid.Row>
          <Grid.Column width={8}>
            <WaterPhChart />
            <WaterTempChart />
            <AirTempChart />
          </Grid.Column>
          <Grid.Column width={8}>
            <WaterChangeTable />
          </Grid.Column>
        </Grid.Row>
      </Grid>
    </Segment>
  );
}

export default DashboardPage;
