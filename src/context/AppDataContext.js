import { ethers } from 'ethers';
import React, { createContext, useContext, useEffect, useState } from 'react';

const AppDataContext = createContext();

export function AppDataProvider({ children }) {
  const [signer, setSigner] = useState(null);
  const [signerAddr, setSignerAddr] = useState(null);

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
        setSigner(null)
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
    }
    init();
  }, []);

  return <AppDataContext.Provider value={{ signer, signerAddr, setSigner }}>{children}</AppDataContext.Provider>;
}

export function useAppData() {
  const context = useContext(AppDataContext);
  if (context === undefined) {
    throw new Error('Context must be used within a Provider');
  }
  return context;
}
