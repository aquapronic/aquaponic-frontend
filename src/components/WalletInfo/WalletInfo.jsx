import { Button } from 'semantic-ui-react';
import { useAppData } from '~/src/context/AppDataContext';
import styles from './WalletInfo.module.scss';

function WalletInfo() {
  const { signerAddr, setSigner, connectWallet } = useAppData();

  const disconnectWallet = () => {
    setSigner(null);
  };

  const handleClick = async () => {
    if (!window.ethereum) {
      alert('Metamask is not installed');
      return;
    }
    connectWallet();
  };

  if (signerAddr) {
    return (
      <div className={styles.container}>
        <div className={styles.signerAddress}>{signerAddr}</div>
      </div>
    );
  }

  return (
    <div className={styles.container}>
      <Button className={styles.connectBtn} onClick={handleClick}>
        Connect
      </Button>
    </div>
  );
}

export default WalletInfo;
