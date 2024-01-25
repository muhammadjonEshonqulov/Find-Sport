abstract class Language {
  int get id;
  String get userName;
  String get name;

  static const int UZ = 1;
  static const int RU = 2;
  static const int KR = 3;
  static const int EN = 4;
  static const int QQ = 5;

  static String getNameByLanguage(String? uz, String? ru, String? en, String? kr, String? qq, Language language) {
    switch (language.id) {
      case UZ:
        return uz ?? "";
      case RU:
        return ru ?? uz ?? "";
      case EN:
        return en ?? uz ?? "";
      case QQ:
        return qq ?? uz ?? "";
      case KR:
        return kr ?? uz ?? "";
      default:
        return "";
    }
  }
}