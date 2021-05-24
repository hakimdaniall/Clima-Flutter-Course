import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = 'a62f5ff2c87dd6aed7e8cb93b9ca09c6';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'
    );

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(
        builder: (context){
      return LocationScreen(locationWeather: weatherData
        ,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}