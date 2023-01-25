#pragma once
#include "ControllerDriver.hpp"
#include <cstdio>
#include <openvr_driver.h>

using namespace vr;

/**
This class instantiates all the device drivers you have, meaning if you've
created multiple drivers for multiple different controllers, this class will
create instances of each of those and inform OpenVR about all of your devices.

Take a look at the comment blocks for all the methods in
IServerTrackedDeviceProvider too.
**/
class DeviceProvider : public IServerTrackedDeviceProvider {
public:
  /**
  Initiailze and add your drivers to OpenVR here.
  **/
  EVRInitError Init(IVRDriverContext *pDriverContext);
  
  /**
  Called right before your driver is unloaded.
  **/
  void Cleanup();

  /**
  Returns version of the openVR interface this driver works with.
  **/
  const char *const *GetInterfaceVersions();

  /**
  Called every frame. Update your drivers here.
  **/
  void RunFrame();

  void FunctionType();

  /**
  Return true if standby mode should be blocked. False otherwise.
  **/
  bool ShouldBlockStandbyMode();

  /**
  Called when OpenVR goes into stand-by mode, so you can tell your devices to go
  into stand-by mode
  **/
  void EnterStandby();

  /**
  Called when OpenVR leaves stand-by mode.
  **/
  void LeaveStandby();



private:
  ControllerDriver *controllerDriver; // this provider only provides this one
                                      // controller driver.
};
