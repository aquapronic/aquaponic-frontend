import classNames from 'classnames';
import { useEffect, useState } from 'react';
import { Header, Loader, Segment } from 'semantic-ui-react';
import DashboardFarmItem from '~/src/components/DashboardFarmItem/DashboardFarmItem';
import Placeholder from '~/src/components/Placeholder/Placeholder';
import { useAppData } from '~/src/context/AppDataContext';
import { useContract } from '~/src/context/ContractContext';
import styles from './DashboardListPage.module.scss';

function DashboardListPage() {
  const { signer } = useAppData();
  const { farmContract } = useContract();
  const [farmList, setFarmList] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchData() {
      if (signer && farmContract) {
        setLoading(true);
        const newFarmList = await farmContract.connect(signer).getAllMyFarms();
        setFarmList(
          newFarmList.map((farm) => ({
            id: farm.id.toString(),
            name: farm.name,
            fishType: farm.fishType,
            plantType: farm.plantType,
          }))
        );
        setLoading(false);
      }
    }
    fetchData();
  }, [signer, farmContract]);

  const renderContent = () => {
    if (loading) {
      return <Loader active />;
    }

    if (farmList.length === 0) {
      return <Placeholder />;
    }

    return farmList.map((farm) => <DashboardFarmItem key={farm.id} farm={farm} />);
  };

  return (
    <Segment basic className={classNames('page-root')}>
      <Header size="huge">Farms</Header>
      {renderContent()}
    </Segment>
  );
}

export default DashboardListPage;
