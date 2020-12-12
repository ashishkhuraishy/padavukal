import 'package:json_annotation/json_annotation.dart';

import '../../../../core/config/json_config.dart';
import '../../domain/entity/sucess_message.dart';

part 'sucess_message_model.g.dart';

@JsonSerializable(nullable: false)
class SucessMessageModel extends SucessMessage
    implements JsonModel<SucessMessageModel> {
  @JsonKey(name: "payment")
  final String paymentId;
  final String message;
  @JsonKey(name: "status")
  final String stausCode;

  SucessMessageModel({
    this.paymentId,
    this.message,
    this.stausCode,
  });

  @override
  SucessMessageModel fromJson(Map<String, dynamic> json) =>
      _$SucessMessageModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SucessMessageModelToJson(this);
}
