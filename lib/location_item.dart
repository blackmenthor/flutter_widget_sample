import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationData {
  String getOutletName();
  String getService();
  String getService2();
  int getServiceOpenHour();
  int getServiceCloseHour();
  double getLat();
  double getLng();
}

class LocationItem<T extends LocationData> extends StatelessWidget {
  final T item;
  final Function(T) onTap;
  final double latDevice;
  final double lngDevice;

  LocationItem({
    @required this.onTap,
    @required this.item,
    @required this.latDevice,
    @required this.lngDevice,
  });

  int calculateDistance() {
    try {
      double distanceInMeters = Geolocator.distanceBetween(
          item.getLat(), item.getLng(), latDevice, lngDevice);

      return distanceInMeters ~/ 1000;
    } catch (ex) {}

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: GestureDetector(
        onTap: () {
          onTap(item);
        },
        child: Card(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.getOutletName(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              item.getService(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(width: 5),
                            Text(
                              item.getService2(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "${(item.getServiceOpenHour())}:00",
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              " - ",
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${(item.getServiceCloseHour())}:00",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${calculateDistance() ?? '-'} Km",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 20),
                        DateTime.now().hour < item.getServiceOpenHour() &&
                                DateTime.now().hour < item.getServiceCloseHour()
                            ? Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red)),
                                child: Text("Closed"))
                            : SizedBox()
                        // : SizedBox()
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
