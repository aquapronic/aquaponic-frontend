import { ethers } from 'ethers';
import React, { createContext, useCallback, useContext, useEffect, useMemo, useState } from 'react';

const AppDataContext = createContext();

export function AppDataProvider({ children }) {
  const [isInitialized, setIsInitialized] = useState(false);
  const [signer, setSigner] = useState(null);
  const [signerAddr, setSignerAddr] = useState(null);

  const isConnected = useMemo(() => Boolean(signerAddr), [signerAddr]);

  const connectWallet = useCallback(async () => {
    try {
      const provider = new ethers.providers.Web3Provider(window.ethereum, 'any');
      await provider.send('eth_requestAccounts', []);
      const signer = provider.getSigner();
      setSigner(signer);
    } catch (e) {
      console.error(e);
    }
  }, []);

  useEffect(() => {
    async function getSignerAddress() {
      try {
        if (signer) {
          const addr = await signer.getAddress();
          setSignerAddr(addr);
        } else {
          setSignerAddr(null);
        }
      } catch (e) {
        setSigner(null);
      }
    }
    getSignerAddress();
  }, [signer]);

  useEffect(() => {
    async function init() {
      if (window.ethereum) {
        const provider = new ethers.providers.Web3Provider(window.ethereum, 'any');
        const signer = provider.getSigner();
        setSigner(signer);
        window.ethereum.on('accountsChanged', async () => {
          const newSigner = provider.getSigner();
          setSigner(newSigner);
        });
      }

      setTimeout(() => setIsInitialized(true), 500);
    }
    init();
  }, []);

  return (
    <AppDataContext.Provider value={{ isInitialized, isConnected, signer, signerAddr, setSigner, connectWallet }}>
      {children}
    </AppDataContext.Provider>
  );
}

export function useAppData() {
  const context = useContext(AppDataContext);
  if (context === undefined) {
    throw new Error('Context must be used within a Provider');
  }
  return context;
}
