
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtm_weather_app/blocs/weather_state.dart';
import 'package:dio/dio.dart';
import 'package:wtm_weather_app/models/weather_response.dart';

class WeatherBloc extends Cubit<WeatherState>{
  WeatherBloc():super(WeatherState());
  var dio = Dio();

  void fetchWeather()async{
    emit(state.copyWith(weatherStatus: WeatherStatus.processing));
    try{
      
    // takes url
    String url = "https://api.open-meteo.com/v1/forecast?latitude=7.3775&longitude=3.947&current=temperature_2m,rain,showers&timezone=auto&forecast_days=1";
    // makes request
    Response response = await dio.get(url);
    if(response.statusCode == 200){
      var  weatherRes = WeatherResponse.fromJson(response.data);
      emit(state.copyWith(weatherResponse: weatherRes, weatherStatus: WeatherStatus.success));
     } 
     } catch (e) {
    emit(state.copyWith(weatherStatus: WeatherStatus.error));
  }

    // emit success or failure state
}
}