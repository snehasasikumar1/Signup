import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {

late Position position;
String placeName='';
String pinCode='';

Future getPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return false;
  }
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Geolocator.openLocationSettings();
    return false;
  }
  return true;
}
Future getAddressFromPosition(Position position)async{
  try{
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    print('placemark= $placemark');
    Placemark place =placemark[0];
    print('place= $place');
    setState(() {
      placeName=place.locality!;
      pinCode=place.postalCode!;
    });
  }catch(e){
    print('Error=$e');
  }
}

Future getLocation() async{
  bool result = await getPermission();
  if(result== true){
    print('permission granted');
    position= await Geolocator.getCurrentPosition();
    getAddressFromPosition(position);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Location'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Place=$placeName"),
            Text("Pincode=$pinCode"),
            ElevatedButton(
                onPressed: (){
                  getLocation();
                }
                , child: Text('Get My Location'))
          ],
        ),
      ),
    );
  }
}
