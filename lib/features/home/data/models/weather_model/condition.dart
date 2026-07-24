class Condition {

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json['text'] as String?,
    icon: json['icon'] as String?,
    code: json['code'],
  );
  String? text;
  String? icon;
  num? code;

  Map<String, dynamic> toJson() => {'text': text, 'icon': icon, 'code': code};
}
