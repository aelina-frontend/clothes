
enum DeviceSize
{
  mobile,
  tablet,
  desktop
}

DeviceSize getDevice(double width)
{
  if(width < 600){
    return DeviceSize.mobile;
  }else if(width < 1200){
    return DeviceSize.tablet;
  }else{
    return DeviceSize.desktop;
  }
}