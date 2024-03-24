 const List<Language> languages = [
  Language('English', 'EN'),
  Language('Mandarin Chinese', 'ZH_CN'),
  Language('Hindi', 'HI'),
  Language('Spanish', 'ES'),
  Language('French', 'FR'),
  Language('Arabic', 'AR'),
  Language('Bengali', 'BN'),
  Language('Russian', 'RU'),
  Language('Portuguese', 'PT'),
  Language('Urdu', 'UR'),
  Language('Indonesian', 'ID'),
  Language('German', 'DE'),
  Language('Japanese', 'JA'),
  Language('Punjabi', 'PA'),
  Language('Javanese', 'JV'),
  Language('Wu Chinese', 'WU'),
  Language('Telugu', 'TE'),
  Language('Marathi', 'MR'),
  Language('Vietnamese', 'VI'),
  Language('Tamil', 'TA'),
  Language('Italian', 'IT'),
  Language('Turkish', 'TR'),
  Language('Korean', 'KO'),
  Language('Cantonese', 'YUE'),
  Language('Gujarati', 'GU'),
  Language('Polish', 'PL'),
  Language('Ukrainian', 'UK'),
  Language('Malayalam', 'ML'),
  Language('Kannada', 'KN'),
  Language('Oriya', 'OR'),
  Language('Burmese', 'MY'),
  Language('Thai', 'TH'),
  Language('Hausa', 'HA'),
  Language('Dutch', 'NL'),
  Language('Yoruba', 'YO'),
  Language('Sindhi', 'SD'),
  Language('Nepali', 'NE'),
  Language('Pashto', 'PS'),
  Language('Amharic', 'AM'),
  Language('Serbo-Croatian', 'SH'),
  Language('Tagalog', 'TL'),
  Language('Kurdish', 'KU'),
  Language('Xhosa', 'XH'),
  Language('Somali', 'SO'),
  Language('Maithili', 'MAI'),
  Language('Uzbek', 'UZ'),
  Language('Zhuang', 'ZH'),
  Language('Azerbaijani', 'AZ'),
  Language('Khmer', 'KM'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}


// // Accessing languages and their codes
// print(Languages.English.name); // Output: English
// print(Languages.English.code); // Output: EN
//
// print(Languages.French.name); // Output: French
// print(Languages.French.code); // Output: FR