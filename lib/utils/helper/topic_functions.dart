String convertToSpaces(String input) {
  List<String> characters = input.split('');
  String result = characters.join(' ');
  return result;
}
