enum CertType {
  platform('platform','플랫폼 로그인 본인인증','cert_res_login.php' ),
  join('join', '플랫폼 회원가입 본인인증', 'cert_res_signup.php'),
  sns('sns','SNS 로그인 본인인증','cert_res_sns_login.php'),
  login('login','계정 정보변경 본인인증','cert_res_account_info.php'),
  find('find', '플랫폼 아이디, 비밀번호 찾기 본인인증','cert_res_find_account.php'),
  changePhone('changePhone','플랫폼 아이디, 비밀번호 (변경) 본인인증','cert_res_change_account.php'),
  changePaass('changePass','플랫폼 아이디, 비밀번호 (변경) 본인인증','cert_res_change_account.php'),
  undefined('undefined','','');

  const CertType(this.code, this.name, this.retUrl);

  final String code;
  final String name;
  final String retUrl;

  factory CertType.getByCode(String code) {
    return CertType.values.firstWhere((value) => value.code == code,
        orElse: ()=> CertType.undefined);
  }
}