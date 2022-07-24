export async function fetchFarmInfoByIds(farmIds, farmContractWithSigner) {
  const farmInfoMap = {};
  await Promise.all(
    farmIds.map(async (farmId) => {
      const farmInfo = await farmContractWithSigner.getById(farmId);
      if (farmInfo && farmInfo.name) {
        farmInfoMap[farmId] = farmInfo;
      }
    })
  );
  return farmInfoMap;
}
