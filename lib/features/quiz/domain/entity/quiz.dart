import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Response
///
/// {
///
///   "id" : 1,
///   "name": "Sub Name"
///   "type": "1",
///   "chapter": 2
/// }

class Quiz extends Equatable {
  final int id;
  final String name;
  final String type;
  final int chapterId;

  Quiz({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.chapterId,
  });

  @override
  List<Object> get props => [
        id,
        name,
        type,
        chapterId,
      ];
}
