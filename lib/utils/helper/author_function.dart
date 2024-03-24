
String removeHttpsAndCom(String url) {
  String result = url.replaceAll('https://', ''); // Removing "https://"
  result = result.replaceAll('www.', ''); // Removing "www."
  result = result.replaceAll('.com', ''); // Removing ".com"
  return result;
}
