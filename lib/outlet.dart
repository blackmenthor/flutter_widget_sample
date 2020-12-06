import 'package:flutter_widget_sample/location_item.dart';

class Outlet extends LocationData {
  final String outletName;
  final double latitude;
  final double longitude;
  final String service;
  final String service2;
  final int openHour;
  final int closeHour;
  double distance;
  bool isClosed;
  Outlet({
    this.outletName,
    this.latitude,
    this.longitude,
    this.service,
    this.service2,
    this.openHour = 11,
    this.closeHour = 19,
    this.distance,
    this.isClosed = false,
  });

  @override
  double getLat() => latitude;

  @override
  double getLng() => longitude;

  @override
  String getOutletName() => outletName;

  @override
  String getService() => service;

  @override
  String getService2() => service2;

  @override
  int getServiceCloseHour() => closeHour;

  @override
  int getServiceOpenHour() => openHour;
}

List<Outlet> mockOutlet = [
  Outlet(
    outletName: "Grand Indonesia",
    latitude: 106.818,
    longitude: -6.195,
    service: "Pick Up",
    service2: "Delivery",
  ),
  Outlet(
    outletName: "Lippo Mall Puri",
    latitude: 106.738,
    longitude: -6.187,
    service: "Pick Up",
    service2: "Delivery",
  ),
  Outlet(
    outletName: "AEON Mall BSD",
    latitude: 106.641,
    longitude: -6.304,
    service: "Pick Up",
    service2: "Delivery",
  ),
  Outlet(
    outletName: "Mall of Indonesia",
    latitude: 106.889,
    longitude: -6.150,
    service: "Pick Up",
    service2: "Delivery",
  ),
  Outlet(
    outletName: "Summarecon Mall Serpong",
    latitude: 106.627,
    longitude: -6.240,
    service: "Pick Up",
    service2: "Delivery",
  )
];
