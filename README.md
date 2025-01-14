# Caelum - Modern Hava Durumu Uygulaması

Caelum, Flutter ile geliştirilmiş modern ve kullanıcı dostu bir hava durumu uygulamasıdır. Latin dilinde "gökyüzü" anlamına gelen Caelum, kullanıcılara güncel hava durumu bilgilerini, tahminleri ve hava kalitesi verilerini sunar.

## Özellikler

- 🌤️ Anlık hava durumu bilgileri
- 📅 5 günlük hava durumu tahmini
- 🌬️ Hava kalitesi indeksi
- 🔍 Şehir arama
- 🌙 Karanlık mod desteği
- 🔐 Kullanıcı hesap yönetimi
- 🌡️ Sıcaklık birimi değiştirme (Celsius/Fahrenheit)

## Teknolojiler

- Flutter
- GetX (Durum yönetimi)
- Firebase Authentication
- OpenWeatherMap API
- Material Design 3

## Kurulum

1. Projeyi klonlayın:
```bash
git clone https://github.com/kullaniciadi/caelum.git
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Firebase yapılandırmasını ekleyin:
   - Firebase Console'dan yeni bir proje oluşturun
   - Android/iOS uygulamanızı kaydedin
   - google-services.json ve GoogleService-Info.plist dosyalarını ilgili dizinlere ekleyin

4. OpenWeatherMap API anahtarını ekleyin:
   - OpenWeatherMap'ten bir API anahtarı alın
   - lib/utils/constants.dart dosyasında API_KEY değerini güncelleyin

5. Uygulamayı çalıştırın:
```bash
flutter run
```

## Katkıda Bulunma

1. Bu depoyu fork edin
2. Yeni bir özellik dalı oluşturun (`git checkout -b yeni-ozellik`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni özellik eklendi'`)
4. Dalınıza push yapın (`git push origin yeni-ozellik`)
5. Bir Pull Request oluşturun

## Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Daha fazla bilgi için [LICENSE](LICENSE) dosyasına bakın.
