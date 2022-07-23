import classNames from 'classnames';
import { useState } from 'react';
import { Header, Loader, Segment } from 'semantic-ui-react';
import DashboardFarmItem from '~/src/components/DashboardFarmItem/DashboardFarmItem';
import styles from './DashboardListPage.module.scss';

function DashboardListPage() {
  const [loading, setLoading] = useState(true);

  const farmList = [
    {
      id: '213',
      name: 'my farm',
      fishType: 'aa',
      plantType: 'xx',
    },
    {
      id: '214',
      name: 'my farm',
      fishType: 'aa',
      plantType: 'xx',
    },
    {
      id: '215',
      name: 'my farm',
      fishType: 'aa',
      plantType: 'xx',
    },
    {
      id: '216',
      name: 'my farm',
      fishType: 'aa',
      plantType: 'xx',
    },
  ];

  return (
    <Segment basic className={classNames('page-root')}>
      <Header size="huge">Farms</Header>
      {farmList.map((farm) => (
        <DashboardFarmItem key={farm.id} farm={farm} />
      ))}
      {/* <Loader active /> */}
    </Segment>
  );
}

export default DashboardListPage;
