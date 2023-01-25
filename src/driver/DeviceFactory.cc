#include "include/DeviceProvider.hpp"
#include <openvr_driver.h>

DeviceProvider
    deviceProvider; // a class that provides openvr with all of your devices

void *HMdDriverFactory(const char *interfaceName, int *returnCode) {
  if (strcmp(interfaceName, IServerTrackedDeviceProvider_Version) == 0) {
    return &deviceProvider;
  }

  if (returnCode) {
    *returnCode = vr::VRInitError_Init_InterfaceNotFound;
  }

  return NULL;
}
