import 'package:flutter/foundation.dart';

class Chapter {
  final int id;
  final int subjectId;
  final String thumbnail;
  final String name;

  Chapter({
    @required this.id,
    @required this.subjectId,
    @required this.thumbnail,
    @required this.name,
  });
}
