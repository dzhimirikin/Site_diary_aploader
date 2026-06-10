import 'dart:convert';

class JsonService {

  String projectJson({
    required String project,
    required int photos,
    required String start,
    required String end,
  }) {

    return jsonEncode({
      "project": project,
      "photos": photos,
      "startDate": start,
      "endDate": end
    });
  }

  String dayJson(
    String day,
    List<String> files,
  ) {

    return jsonEncode({
      "day": day,
      "photos": files
    });
  }
}
