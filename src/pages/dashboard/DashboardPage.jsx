import classNames from 'classnames';
import moment from 'moment';
import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Breadcrumb, Grid, Header, Loader, Segment } from 'semantic-ui-react';
import AirTempChart from '~/src/components/AirTempChart/AirTempChart';
import TANChart from '~/src/components/TANChart/TANChart';
import WaterChangeTable from '~/src/components/WaterChangeTable/WaterChangeTable';
import WaterPhChart from '~/src/components/WaterPhChart/WaterPhChart';
import WaterTempChart from '~/src/components/WaterTempChart/WaterTempChart';
import { useAppData } from '~/src/context/AppDataContext';
import { useContract } from '~/src/context/ContractContext';
import { DEFAULT_TIMESTAMP_FORMAT } from '~/src/constants';
import styles from './DashboardPage.module.scss';

function DashboardPage() {
  const navigate = useNavigate();
  const params = useParams();
  const { signer } = useAppData();
  const {
    farmContract,
    airTempMeasurementContract,
    waterPHMeasurementContract,
    waterTempMeasurementContract,
    waterTANMeasurementContract,
    waterExchangeRecordContract,
  } = useContract();
  const [loading, setLoading] = useState(true);
  const [farmInfo, setFarmInfo] = useState({});
  const [airTempData, setAirTempData] = useState([]);
  const [waterPHData, setWaterPHData] = useState([]);
  const [waterTempData, setWaterTempData] = useState([]);
  const [waterTANData, setWaterTANData] = useState([]);
  const [waterExchangeData, setWaterExchangeData] = useState([]);

  useEffect(() => {
    async function fetchFarmInfo() {
      const farmInfo = await farmContract.connect(signer).getById(params.farmId);
      setFarmInfo(farmInfo);
    }
    async function fetchAirTempData() {
      const airTempRecords = await airTempMeasurementContract.connect(signer).getAllMeasurementForAFarm(params.farmId);
      const newAirTempRecords = airTempRecords.map((record) => [
        parseInt(record.timestamp.toString()) * 1000,
        parseFloat(record.value.toString()) / 10,
      ]);
      setAirTempData(newAirTempRecords);
    }
    async function fetchWaterPHData() {
      const waterPhRecords = await waterPHMeasurementContract.connect(signer).getAllMeasurementForAFarm(params.farmId);
      const newWaterPhRecords = waterPhRecords.map((record) => [
        parseInt(record.timestamp.toString()) * 1000,
        parseFloat(record.value.toString()) / 10,
      ]);
      setWaterPHData(newWaterPhRecords);
    }
    async function fetchWaterTempData() {
      const waterTempRecords = await waterTempMeasurementContract
        .connect(signer)
        .getAllMeasurementForAFarm(params.farmId);
      const newWaterTempRecords = waterTempRecords.map((record) => [
        parseInt(record.timestamp.toString()) * 1000,
        parseFloat(record.value.toString()) / 10,
      ]);
      setWaterTempData(newWaterTempRecords);
    }
    async function fetchWaterTANData() {
      const waterTANRecords = await waterTANMeasurementContract
        .connect(signer)
        .getAllMeasurementForAFarm(params.farmId);
      const newWaterTANRecords = waterTANRecords.map((record) => [
        parseInt(record.timestamp.toString()) * 1000,
        parseFloat(record.value.toString()) / 100,
      ]);
      setWaterTANData(newWaterTANRecords);
    }
    async function fetchWaterExchangeData() {
      const waterExchangeRecords = await waterExchangeRecordContract
        .connect(signer)
        .getByFarmIdSince(params.farmId, 0);
      const newWaterExchangeRecords = waterExchangeRecords.map((record) => ({
        id: record.id.toString(),
        timestamp: moment(parseInt(record.timestamp.toString()) * 1000).format(DEFAULT_TIMESTAMP_FORMAT),
      }));
      setWaterExchangeData(newWaterExchangeRecords);
    }

    async function fetchData() {
      if (signer && farmContract) {
        setLoading(true);
        await Promise.all([
          fetchFarmInfo(),
          fetchAirTempData(),
          fetchWaterPHData(),
          fetchWaterTempData(),
          fetchWaterTANData(),
          fetchWaterExchangeData(),
        ]);
        setLoading(false);
      }
    }
    fetchData();
  }, [signer, farmContract]);

  const renderContent = () => {
    if (loading) {
      return <Loader size='large' active />;
    }

    return (
      <Grid stackable>
        <Grid.Row>
          <Grid.Column width={8}>
            <WaterTempChart data={waterTempData} />
            <WaterPhChart data={waterPHData} />
            <WaterChangeTable data={waterExchangeData} />
          </Grid.Column>
          <Grid.Column width={8}>
            <AirTempChart data={airTempData} />
            <TANChart data={waterTANData} />
          </Grid.Column>
        </Grid.Row>
      </Grid>
    );
  };

  return (
    <Segment basic className={classNames('page-root')}>
      <Header size="huge">
        <Breadcrumb
          className={styles.breadcrumb}
          icon="right angle"
          sections={[
            { key: 'farms', content: 'Dashboards', link: true, onClick: () => navigate('/dashboards') },
            { key: 'farmName', content: farmInfo.name, active: true },
          ]}
        />
      </Header>
      {renderContent()}
    </Segment>
  );
}

export default DashboardPage;
