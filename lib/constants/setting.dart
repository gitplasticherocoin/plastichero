class Setting {
  static const bool isTest = false;
  /// server
  static const String domain = "https://app.plasticherocoin.com"; //"https://ph.sigmachain.co.kr";
  static const String domainDev = "https://ph.sgmchain.com"; //"https://ph.sgmchain.com" ; //"http://192.168.100.193:94"; //"https://ph.sgmchain.com" ;//"http://192.168.100.193:94";//"https://ph.sgmchain.com"; //"http://192.168.100.193:94";
  static const String nodeDomain = "https://wallet.plasticherocoin.com";
  static const String nodeDomainDev = "https://wallet-api-dev.plasticherocoin.com";
  static const String connectUrl = "$domain/api";
  static const String connectUrlDev = "$domainDev/api";


  static const String device = "mobile";
  static const String appFont = 'Pretendard';
  static const int bPthDecimalDigits = 18;
  static const int scaleNum = 8;
  static const int nickMaxLength = 10;
  /// hashtag
  static const int hashtagMaxNum = 10;
  static const int hashtagMaxLength = 20;
  static const String decimalFormat = '#,###.########';

}