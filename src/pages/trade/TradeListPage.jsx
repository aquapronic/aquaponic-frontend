import classNames from 'classnames';
import _ from 'lodash';
import moment from 'moment';
import { useEffect, useState } from 'react';
import { Header, Loader, Segment, Tab } from 'semantic-ui-react';
import FishLotTable from '~/src/components/FishLotTable/FishLotTable';
import Placeholder from '~/src/components/Placeholder/Placeholder';
import PlantLotTable from '~/src/components/PlantLotTable/PlantLotTable';
import { useAppData } from '~/src/context/AppDataContext';
import { DEFAULT_TIMESTAMP_FORMAT, LOT_STATUS } from '~/src/constants';
import { useContract } from '~/src/context/ContractContext';
import { fetchFarmInfoByIds } from '~/src/utils/api';
import styles from './TradeListPage.module.scss';

function TradeListPage() {
  const { isInitialized, isConnected, signer } = useAppData();
  const { farmContract, plantLotContract, fishLotContract } = useContract();
  const [plantLots, setPlantLots] = useState([]);
  const [fishLots, setFishLots] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchData() {
      if (isConnected && signer) {
        setLoading(true);

        const fetchedPlantLots = await plantLotContract.connect(signer).getByStatus(LOT_STATUS.HARVESTED);
        const fetchedFishLots = await fishLotContract.connect(signer).getByStatus(LOT_STATUS.HARVESTED);

        const farmIds = _([...fetchedPlantLots, ...fetchedFishLots]).map('farm_id').uniq().value(); // prettier-ignore
        const farmInfoMap = await fetchFarmInfoByIds(farmIds, farmContract.connect(signer));

        const newPlantLots = fetchedPlantLots.map((lot) => ({
          lotNumber: lot.lot_number.toString(),
          farmName: farmInfoMap[lot.farm_id]?.name || 'N/A',
          plantType: farmInfoMap[lot.farm_id]?.plantType || 'N/A',
          startDatetime: moment(lot.start_datetime * 1000).format(DEFAULT_TIMESTAMP_FORMAT),
          harvestDatetime: moment(lot.harvest_datetime * 1000).format(DEFAULT_TIMESTAMP_FORMAT),
          harvestedQuantity: `${lot.harvested_quantity} g`,
          unitPrice: `$${parseInt(lot.unit_price) / 100}`,
        }));
        const newFishLots = fetchedFishLots.map((lot) => ({
          lotNumber: lot.lot_number.toString(),
          farmName: farmInfoMap[lot.farm_id]?.name || 'N/A',
          fishType: farmInfoMap[lot.farm_id]?.fishType || 'N/A',
          startDatetime: moment(lot.start_datetime * 1000).format(DEFAULT_TIMESTAMP_FORMAT),
          harvestDatetime: moment(lot.harvest_datetime * 1000).format(DEFAULT_TIMESTAMP_FORMAT),
          harvestedQuantity: `${lot.harvested_quantity} g`,
          unitPrice: `$${parseInt(lot.unit_price) / 100}`,
        }));
        setPlantLots(newPlantLots);
        setFishLots(newFishLots);

        setLoading(false);
      } else {
        setLoading(false);
      }
    }
    fetchData();
  }, [isConnected, signer, farmContract, plantLotContract, fishLotContract]);

  const renderContent = () => {
    if (!isInitialized || loading) {
      return <Loader size="large" active />;
    }

    if (!isConnected) {
      return <Placeholder content="Please connect your wallet first" />;
    }

    return (
      <Tab
        menu={{ secondary: true, pointing: true }}
        panes={[
          { menuItem: 'Plant', render: () => <PlantLotTable data={plantLots} /> },
          { menuItem: 'Fish', render: () => <FishLotTable data={fishLots} /> },
        ]}
      />
    );
  };

  return (
    <Segment basic className={classNames('page-root')}>
      <Header className={styles.header} size="huge">
        Trades
      </Header>
      {renderContent()}
    </Segment>
  );
}

export default TradeListPage;
