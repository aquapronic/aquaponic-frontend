import classNames from 'classnames';
import { useEffect, useState } from 'react';
import { Header, Loader, Segment } from 'semantic-ui-react';
import DashboardFarmItem from '~/src/components/DashboardFarmItem/DashboardFarmItem';
import Placeholder from '~/src/components/Placeholder/Placeholder';
import { useAppData } from '~/src/context/AppDataContext';
import { useContract } from '~/src/context/ContractContext';
import styles from './DashboardListPage.module.scss';

function DashboardListPage() {
  const { isInitialized, isConnected, signer } = useAppData();
  const { farmContract } = useContract();
  const [farmList, setFarmList] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchData() {
      if (isConnected && signer) {
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
      } else {
        setLoading(false);
      }
    }
    fetchData();
  }, [isConnected, signer, farmContract]);

  const renderContent = () => {
    if (!isInitialized || loading) {
      return <Loader size="large" active />;
    }

    if (!isConnected) {
      return <Placeholder content="Please connect your wallet first" />;
    }

    if (farmList.length === 0) {
      return <Placeholder />;
    }

    return farmList.map((farm) => <DashboardFarmItem key={farm.id} farm={farm} />);
  };

  return (
    <Segment basic className={classNames('page-root')}>
      <Header className={styles.header} size="huge">
        Dashboards
      </Header>
      {renderContent()}
    </Segment>
  );
}

export default DashboardListPage;
