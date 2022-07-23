import { useNavigate } from 'react-router-dom';
import { Icon, Segment, Label } from 'semantic-ui-react';
import styles from './DashboardFarmItem.module.scss';

function DashboardFarmItem({ farm }) {
  const navigate = useNavigate();

  return (
    <Segment className={styles.farmItem} onClick={() => navigate(`/dashboard/${farm.id}`)}>
      <div className={styles.farmName}>{farm.name}</div>
      <div>
        <b>Fish Type:</b> {farm.fishType}
      </div>
      <div>
        <b>Plant Type:</b> {farm.plantType}
      </div>
      <Icon name="chevron right" />
    </Segment>
  );
}

export default DashboardFarmItem;
