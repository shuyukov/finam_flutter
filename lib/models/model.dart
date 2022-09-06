import 'package:intl/intl.dart';

class Model {
  List<Children> children;

  Model({
    required this.children,
  });

  factory Model.fromJSON(Map<String, dynamic> json) {
    return Model(
      children: (json["data"]["children"] as List<dynamic>)
          .map((e) => Children.fromJSON(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Children {
  String? image;
  String title;
  String ups;
  String? text;
  String created;

  Children(
      {required this.image,
      required this.title,
      required this.ups,
      required this.text,
      required this.created});

  factory Children.fromJSON(Map<String, dynamic> json) {
    var parsedDate =
        DateTime.fromMillisecondsSinceEpoch(json["data"]["created"].toInt());
    var date = DateFormat('EEEE').format(parsedDate);
    return Children(
      image: json["data"]["thumbnail"],
      title: json["data"]["title"],
      ups: json["data"]["ups"].toString(),
      text: json["data"]["selftext"],
      created: date,
    );
  }
}
