import { ethers } from 'ethers';
import React, { createContext, useContext, useEffect, useState } from 'react';
import { CONTRACT_ADDRESS } from '~/src/constants';

const airTempMeasurementContractJson = require('~/contracts/compiled/AirTempMeasurement.json');
const farmContractJson = require('~/contracts/compiled/Farm.json');
const waterExchangeRecordContractJson = require('~/contracts/compiled/WaterExchangeRecord.json');
const waterPHMeasurementContractJson = require('~/contracts/compiled/WaterPHMeasurement.json');
const waterTANMeasurementContractJson = require('~/contracts/compiled/WaterTANMeasurement.json');
const waterTempMeasurementContractJson = require('~/contracts/compiled/WaterTempMeasurement.json');
const fishLotContractJson = require('~/contracts/compiled/FishLot.json');
const plantLotContractJson = require('~/contracts/compiled/PlantLot.json');

const ContractContext = createContext();

export function ContractProvider({ children }) {
  const [airTempMeasurementContract, setAirTempMeasurementContract] = useState();
  const [farmContract, setFarmContract] = useState();
  const [waterExchangeRecordContract, setWaterExchangeRecordContract] = useState();
  const [waterPHMeasurementContract, setWaterPhMeasurementContract] = useState();
  const [waterTANMeasurementContract, setWaterTANMeasurementContract] = useState();
  const [waterTempMeasurementContract, setWaterTempMeasurementContract] = useState();
  const [plantLotContract, setPlantLotContract] = useState();
  const [fishLotContract, setFishLotContract] = useState();

  useEffect(() => {
    setAirTempMeasurementContract(new ethers.Contract(CONTRACT_ADDRESS.AIR_TEMP_MEASUREMENT, airTempMeasurementContractJson.abi));
    setFarmContract(new ethers.Contract(CONTRACT_ADDRESS.FARM, farmContractJson.abi));
    setWaterExchangeRecordContract(new ethers.Contract(CONTRACT_ADDRESS.WATER_EXCHANGE_RECORD, waterExchangeRecordContractJson.abi));
    setWaterPhMeasurementContract(new ethers.Contract(CONTRACT_ADDRESS.WATER_PH_MEASUREMENT, waterPHMeasurementContractJson.abi));
    setWaterTANMeasurementContract(new ethers.Contract(CONTRACT_ADDRESS.WATER_TAN_MEASUREMENT, waterTANMeasurementContractJson.abi));
    setWaterTempMeasurementContract(new ethers.Contract(CONTRACT_ADDRESS.WATER_TEMP_MEASUREMENT, waterTempMeasurementContractJson.abi));
    setPlantLotContract(new ethers.Contract(CONTRACT_ADDRESS.PLANT_LOT, plantLotContractJson.abi));
    setFishLotContract(new ethers.Contract(CONTRACT_ADDRESS.FISH_LOT, fishLotContractJson.abi));
  }, []);

  return (
    <ContractContext.Provider
      value={{
        airTempMeasurementContract,
        farmContract,
        waterExchangeRecordContract,
        waterPHMeasurementContract,
        waterTANMeasurementContract,
        waterTempMeasurementContract,
        plantLotContract,
        fishLotContract,
      }}
    >
      {children}
    </ContractContext.Provider>
  );
}

export function useContract() {
  const context = useContext(ContractContext);
  if (context === undefined) {
    throw new Error('Context must be used within a Provider');
  }
  return context;
}
