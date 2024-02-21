class MemberInfo {
  dynamic mbId;
  dynamic mbName;
  dynamic mbHp;
  String? code;
  dynamic fcmKey;
  dynamic mbEmail;
  String? type;
  String? isJoin;

  MemberInfo({
    this.mbId,
    this.mbName,
    this.mbHp,
    this.code,
    this.fcmKey,
    this.mbEmail,
    this.type,
    this.isJoin,
  });

  factory MemberInfo.fromJson(Map<String, dynamic> json) => MemberInfo(
        mbId: json["mb_id"],
        mbName: json["mb_name"],
        mbHp: json["mb_hp"],
        code: json["code"],
        fcmKey: json["fcm_key"],
        mbEmail: json["mb_email"],
        type: json["type"],
        isJoin: json["isjoin"],
      );

  Map<String, dynamic> toJson() => {
        "mb_id": mbId,
        "mb_name": mbName,
        "mb_hp": mbHp,
        "code": code,
        "fcm_key": fcmKey,
        "mb_email": mbEmail,
        "type": type,
        "isjoin": isJoin,
      };
}