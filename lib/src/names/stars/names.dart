import '../name_r.dart';
import '../supported_language.dart';
import 'en.dart';

const Map<SupportedLanguage, String> title = <SupportedLanguage, String>{
  SupportedLanguage.english: 'Stars',
};

const Map<SupportedLanguage, Set<NameR>> names =
    <SupportedLanguage, Set<NameR>>{
  SupportedLanguage.english: en,
};
