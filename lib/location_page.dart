import 'package:flutter/material.dart';
import 'package:flutter_widget_sample/location_item.dart';
import 'package:flutter_widget_sample/outlet.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Outlet outlet = new Outlet();
  double latitudeN;
  double longitudeN;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 5));
      latitudeN = position.latitude;
      longitudeN = position.longitude;
      print(latitudeN);
      print(longitudeN);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text("Choose Outlet"),
        actions: [
          Icon(Icons.list),
          SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.map),
          )
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
          );
        },
        padding: const EdgeInsets.all(10),
        itemCount: mockOutlet.length,
        itemBuilder: (context, i) {
          return LocationItem(
            onTap: (item) {
              setState(() {
                outlet = item;
              });
              // pushNewScreen(
              //   context,
              //   screen: FoodPage(outletNameLocation: outlet.outletName),
              //   withNavBar: true,
              //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
              // );
            },
            item: mockOutlet[i],
            latDevice: latitudeN,
            lngDevice: longitudeN,
          );
        },
      ),
    );
  }
}
