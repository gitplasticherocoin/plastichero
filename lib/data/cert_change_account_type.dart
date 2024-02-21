enum CertChangeType {
  phone('phone','번호변경', '1'),
  pass('pass', '비밀번호변경', '2'),
  email('email', '이메일변경','3'),
  out('out','회원탈퇴','4'),
	undefined('undefined','','');

	const CertChangeType(this.code, this.name ,this.type);

	final String code;
	final String name;
  final String type;


	factory CertChangeType.getByCode(String code) {
		return CertChangeType.values.firstWhere((value) => value.code == code,
		orElse: ()=> CertChangeType.undefined);
	}
}