
enum AppType {
  app('p', '플라스틱히어로앱'),
  wallet('w', '플라스틱히어로지갑'),
  undefined('undefined','');
  const AppType(this.code, this.name);
  final String code;
  final String name;

  factory AppType.getByCode(String code) {
    return AppType.values.firstWhere((value) => value.code == code,
        orElse: ()=> AppType.undefined);
  }
}

