import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/pages/ayarlar_sayfasi.dart';
import 'package:weather_app_flutter/pages/hava_kalitesi_sayfasi.dart';
import 'package:weather_app_flutter/pages/tahmin_sayfasi.dart';
import '../controllers/hava_durumu_controller.dart';
import '../widgets/mevcut_hava_durumu_widget.dart';
import '../widgets/detay_bilgiler_widget.dart';
import '../utils/constanst.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _seciliSayfa = 0;
  final _aramaController = TextEditingController();
  final _controller = Get.find<HavaDurumuController>();
  
  final List<Widget> _sayfalar = [
    const GuncelHavaDurumuSayfasi(),
    const TahminSayfasi(),
    const HavaKalitesiSayfasi(),
    const AyarlarSayfasi(),
  ];

  @override
  void initState() {
    super.initState();
    _controller.veriGetir('Istanbul');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arkaplan gradyanı
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade700,
                  Colors.blue.shade500,
                ],
              ),
            ),
          ),
          // Ana içerik
          Column(
            children: [
              // Arama alanı
              _aramaAlani(),
              // Sayfa içeriği
              Expanded(
                child: PageView(
                  onPageChanged: (index) => setState(() => _seciliSayfa = index),
                  children: _sayfalar,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: _altNavigasyonBar(),
    );
  }

  Widget _aramaAlani() {
    return Container(
      margin: EdgeInsets.only(top: h * 0.05, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: _aramaController,
        style: const TextStyle(color: kTextColor1),
        decoration: InputDecoration(
          hintText: 'Şehir Ara'.tr,
          hintStyle: const TextStyle(color: kTextColor2),
          prefixIcon: const Icon(Icons.search, color: kTextColor2),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            _controller.veriGetir(value);
          }
        },
      ),
    );
  }

  Widget _altNavigasyonBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade500.withOpacity(0.8),
            Colors.blue.shade700,
          ],
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _seciliSayfa,
        onTap: (index) => setState(() => _seciliSayfa = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.cloud),
            label: 'Hava Durumu'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            label: 'Tahmin'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.air),
            label: 'Hava Kalitesi'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'Ayarlar'.tr,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _aramaController.dispose();
    super.dispose();
  }
}

class GuncelHavaDurumuSayfasi extends StatelessWidget {
  const GuncelHavaDurumuSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HavaDurumuController>();

    return Obx(() {
      if (controller.yukleniyor.value) {
        return const Center(child: CircularProgressIndicator(color: Colors.white));
      }

      final hava = controller.havaDurumu.value;
      if (hava == null) {
        return Center(
          child: Text(
            'Veri bulunamadı'.tr,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }

      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              mevcutHavaDurumu(
                yenile: () => controller.veriGetir(hava.sehirAdi),
                sicaklik: controller.sicaklikDonustur(hava.sicaklik),
                sehir: hava.sehirAdi,
                ulke: hava.ulke,
                durum: hava.durum,
              ),
              const SizedBox(height: 20),
              detayBilgiler(
                ruzgar: "${hava.ruzgar}",
                basinc: "${hava.basinc}",
                nem: "${hava.nem}",
                hissedilen: controller.sicaklikDonustur(hava.hissedilen),
              ),
            ],
          ),
        ),
      );
    });
  }
} 