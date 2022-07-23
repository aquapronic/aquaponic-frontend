export function truncateAddress(addr) {
  if (typeof addr === 'string' || addr instanceof String) {
    return addr.substring(0, 6) + '...' + addr.substring(addr.length - 4);
  }
  return addr;
}
