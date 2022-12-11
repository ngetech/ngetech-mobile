class Cookie {
  String name;
  String value;
  int? expireTimestamp;

  Cookie(
    this.name,
    this.value,
    this.expireTimestamp,
  );

  Cookie.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        value = json['value'],
        expireTimestamp = json['expireTimestamp'];

  Map toJson() => {
        "name": name,
        "value": value,
        "expireTimestamp": expireTimestamp,
      };
}
