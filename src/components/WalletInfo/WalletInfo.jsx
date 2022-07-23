import { ethers } from 'ethers';
import { Button, Icon, Label } from 'semantic-ui-react';
import { useAppData } from '~/src/context/AppDataContext';
import { truncateAddress } from '~/src/utils/index';
import styles from './WalletInfo.module.scss';

function WalletInfo() {
  const { signerAddr, setSigner } = useAppData();

  const connectWallet = async () => {
    try {
      const provider = new ethers.providers.Web3Provider(window.ethereum, 'any');
      await provider.send('eth_requestAccounts', []);
      const signer = provider.getSigner();
      setSigner(signer);
    } catch (e) {
      console.error(e);
    }
  };

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
        <div className={styles.signerAddress}>
          <Label basic>{truncateAddress(signerAddr)}</Label>
          {/* <Button onClick={disconnectWallet}>Disconnect</Button> */}
        </div>
      </div>
    );
  }

  return (
    <div className={styles.container}>
      <Button onClick={handleClick}>Connect Wallet</Button>
    </div>
  );
}

export default WalletInfo;
