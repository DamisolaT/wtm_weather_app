
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:wtm_weather_app/blocs/weather_state.dart';

class WeatherBloc extends Cubit<WeatherState>{
  WeatherBloc(): super(WeatherState());

  void fetchWeather() async{
    // take url
    Uri url =Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=7.3775&longitude=3.947&current=temperature_2m,rain,showers&timezone=auto&forecast_days=1");
    //make request
    Response response = await http.get(url);
    if(response.statusCode == 200){
      // Everything is fine
      // Convert it to weatherResponse object
    }
    // emit  success or failure state
  }
  
}