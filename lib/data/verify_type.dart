enum VerifyType {

  join('1','회원가입'),
  findPassword('3','비밀번호찾기'),
  findId('2','아이디찾기'),
  changePassInfo('4','비밀번호정보변경'),
	changePhoneInfo('5', '핸드폰 번호변경'),
	undefined('undefined','');

	const VerifyType(this.code, this.name);

	final String code;
	final String name;

	factory VerifyType.getByCode(String code) {
		return VerifyType.values.firstWhere((value) => value.code == code,
		orElse: () => VerifyType.undefined);
	}
}