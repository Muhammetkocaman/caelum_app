import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/services/ayarlar_servisi.dart';
import 'package:weather_app_flutter/services/weather_api_client.dart';
import 'package:weather_app_flutter/pages/ana_sayfa.dart';
import 'package:weather_app_flutter/controllers/hava_durumu_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Servisleri başlat
  await initServices();
  
  runApp(const HavaDurumuUygulamasi());
}

Future<void> initServices() async {
  // Ayarlar servisini başlat
  await Get.putAsync(() async {
    final servis = AyarlarServisi();
    await servis.ayarlariYukle();
    return servis;
  });
  // API istemcisini başlat
  Get.put(WeatherApiClient());
  // Controller'ı başlat
  Get.put(HavaDurumuController());

  print('Tüm servisler başlatıldı...');
}

class HavaDurumuUygulamasi extends StatelessWidget {
  const HavaDurumuUygulamasi({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hava Durumu Uygulaması',
      home: AnaSayfa(),
    );
  }
}

