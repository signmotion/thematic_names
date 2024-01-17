enum SupportedLanguage {
  undefined,
  english,
}

final Map<SupportedLanguage, RegExp> acceptedLanguageSymbols =
    <SupportedLanguage, RegExp>{
  SupportedLanguage.english: RegExp('[^A-Za-z]'),
};
