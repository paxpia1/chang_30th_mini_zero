import 'dart:ffi';

import 'package:chang_mini/model/bank.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const balance = 100.0;

class BankService extends ChangeNotifier {
  var f = NumberFormat('###,###,###,###');

  List<Bank> myBankList = [];

  void sendMoney({
    required double moneyAmount,
    // required Function onSuccess,
    required Function(String err) onError,
  }) {
    if (moneyAmount > balance) {
      onError("잔액이 부족합니다!");
    }
  }
}
