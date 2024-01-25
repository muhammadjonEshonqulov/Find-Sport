import 'package:meta/meta.dart';

@immutable
abstract class ChooseLanguageEvent {}

class ChooseLanguageEventData extends ChooseLanguageEvent {
  final String languageIcon;
  final String languageName;

  ChooseLanguageEventData(this.languageIcon, this.languageName);
}
