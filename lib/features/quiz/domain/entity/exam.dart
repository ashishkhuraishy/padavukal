import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'choice.dart';

class Exam extends Equatable {
  final int id;
  final String text;
  final int examId;
  final List<Choice> choices;

  Exam({
    @required this.id,
    @required this.text,
    @required this.examId,
    @required this.choices,
  });

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
