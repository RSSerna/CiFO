import 'dart:convert';

import 'package:cifo_flutter/features/home/domain/entities/transfer_params.dart';

class TransferParamsModel extends TransferParams {
  const TransferParamsModel({
    required String transferID,
  }) : super(
          transferID: transferID,
        );

  Map<String, dynamic> toMap() {
    return {
      "name": transferID,
    };
  }

  String toJson() => jsonEncode(toMap());
}
