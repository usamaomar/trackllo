import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // TrackingPage
  {
    'tdr2806z': {
      'en': 'You Have To Select Trip',
      'ar': 'عليك أن تختار الرحلة',
    },
    'vp2rc41u': {
      'en': 'Trip',
      'ar': 'رحلة',
    },
    'dmkb37id': {
      'en': 'Home',
      'ar': '',
    },
  },
  // LoginPage
  {
    'tc6ropa3': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'xi1mw0mv': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'ceu5evk3': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    'czfe1gfg': {
      'en': 'Login ',
      'ar': 'تسجيل الدخول',
    },
    'dx1v36m0': {
      'en': 'Home',
      'ar': '',
    },
  },
  // OilChangereCordsPage
  {
    '8946s229': {
      'en': 'Oil Change Records',
      'ar': 'سجلات تغيير الزيت',
    },
    'x75363b7': {
      'en': 'Add',
      'ar': 'اضافة',
    },
    'oldxzv2a': {
      'en': 'Meter reading while filling : ',
      'ar': 'قراءة العداد أثناء التعبئة :',
    },
    '0lpass12': {
      'en': 'Quantity packed in litres : ',
      'ar': 'الكمية المعبأة باللتر :',
    },
    'nnmt7vk8': {
      'en': 'Oil quality : ',
      'ar': 'جودة الزيت :',
    },
    '4cwg0hfg': {
      'en': 'The cash value : ',
      'ar': 'القيمة النقدية :',
    },
    '0jnd9olu': {
      'en': 'Home',
      'ar': '',
    },
  },
  // GasChangereCordsPage
  {
    'obr19ayc': {
      'en': 'Meter reading while filling : ',
      'ar': 'قراءة العداد أثناء التعبئة :',
    },
    'z0ecb2ay': {
      'en': 'Quantity packed in litres : ',
      'ar': 'الكمية المعبأة باللتر :',
    },
    'mbmrh9g5': {
      'en': 'The cash value : ',
      'ar': 'القيمة النقدية :',
    },
    '9rmi6ukr': {
      'en': 'Gas Change Records',
      'ar': 'سجلات تغيير الوقود',
    },
    '1py1ygsu': {
      'en': 'Add',
      'ar': 'اضافة',
    },
    'k1y0h0au': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CounterInformationPage
  {
    'ns2jmdtr': {
      'en': 'Last Trips',
      'ar': 'الرحلات الأخيرة',
    },
    'ehh563z5': {
      'en': 'Add',
      'ar': 'اضافة',
    },
    'wrn8qcff': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SettingsPage
  {
    'r1p1ex1k': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'a5pjg41g': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SideMenuComponent
  {
    'atmylffv': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'm7pzf71e': {
      'en': 'Fuel filling records',
      'ar': 'سجلات تعبئة الوقود',
    },
    'gce65n6v': {
      'en': 'Oil change records',
      'ar': 'سجلات تغيير الزيت',
    },
    'bjclm60c': {
      'en': 'Counter information',
      'ar': 'معلومات العداد',
    },
    '4vf6x3ie': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'y0vxiwob': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
    },
  },
  // OileComponent
  {
    '2klo8yzx': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'o86y0yu0': {
      'en': 'Oil Change',
      'ar': 'تغيير زيت',
    },
    '6yzldoto': {
      'en': 'Meter reading while filling',
      'ar': 'قراءة العداد أثناء التعبئة',
    },
    'f8ophfab': {
      'en': 'Quantity packed in litres',
      'ar': 'الكمية معبأة باللتر',
    },
    'iiguwfzu': {
      'en': 'Oil quality',
      'ar': 'جودة الزيت',
    },
    'wcobc97m': {
      'en': 'The cash value',
      'ar': 'القيمة النقدية',
    },
  },
  // GasComponent
  {
    'mm0vrt49': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'oqicxa0j': {
      'en': 'Gas Change',
      'ar': 'تغيير الغاز',
    },
    '52se8dtd': {
      'en': 'Meter reading while filling',
      'ar': 'قراءة العداد أثناء التعبئة',
    },
    'ne0cwiwk': {
      'en': 'Quantity packed in litres',
      'ar': 'الكمية معبأة باللتر',
    },
    '50cth9so': {
      'en': 'The cash value',
      'ar': 'القيمة النقدية',
    },
  },
  // CounterInformationDialog
  {
    '1u7fvsxk': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'g0c3407i': {
      'en': 'Counter Information',
      'ar': 'معلومات العداد',
    },
    '2wwujjvs': {
      'en': 'Current Counter Information Number',
      'ar': 'رقم معلومات العداد الحالي',
    },
    'av4kc783': {
      'en': 'Uploade Counter Image',
      'ar': 'تحميل صورة العداد',
    },
  },
  // TravelListComponent
  {
    'a9et6heg': {
      'en': 'Travel Selection',
      'ar': 'اختيار الرحلة',
    },
  },
  // Miscellaneous
  {
    'ltkaq2x3': {
      'en': 'We would like to get your location',
      'ar': '',
    },
    '7huprjjn': {
      'en': '',
      'ar': '',
    },
    '6vf168zf': {
      'en': '',
      'ar': '',
    },
    'e8g0aun2': {
      'en': '',
      'ar': '',
    },
    'r4k2ix86': {
      'en': '',
      'ar': '',
    },
    '9prr7tdk': {
      'en': '',
      'ar': '',
    },
    '4zkjjvir': {
      'en': '',
      'ar': '',
    },
    'n2apglyc': {
      'en': '',
      'ar': '',
    },
    'jzv0jxvg': {
      'en': '',
      'ar': '',
    },
    'lubanqfe': {
      'en': '',
      'ar': '',
    },
    'hychiw05': {
      'en': '',
      'ar': '',
    },
    'ap6qp03g': {
      'en': '',
      'ar': '',
    },
    'k3c2dxu3': {
      'en': '',
      'ar': '',
    },
    'a4xrlare': {
      'en': '',
      'ar': '',
    },
    'wmatesp6': {
      'en': '',
      'ar': '',
    },
    'e4whvqwn': {
      'en': '',
      'ar': '',
    },
    '6yydvuyf': {
      'en': '',
      'ar': '',
    },
    'h827hbww': {
      'en': '',
      'ar': '',
    },
    'ob9kjhps': {
      'en': '',
      'ar': '',
    },
    'q0w010s1': {
      'en': '',
      'ar': '',
    },
    'ctp6tc20': {
      'en': '',
      'ar': '',
    },
    'yx9za2yt': {
      'en': '',
      'ar': '',
    },
    '79ow3sd6': {
      'en': '',
      'ar': '',
    },
    'mow395w8': {
      'en': '',
      'ar': '',
    },
    'n2czjpq8': {
      'en': '',
      'ar': '',
    },
    'aanza29k': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
