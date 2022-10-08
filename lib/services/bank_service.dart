import 'dart:ffi';

import 'package:chang_mini/model/bank.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const balance = 10000.0;

class BankService extends ChangeNotifier {
  var f = NumberFormat('###,###,###,###');

  List<Bank> myBankList = [
    '시티은행',
    '신한은행',
    '카카오뱅크',
  ];

  void sendMoney({
    required double moneyAmount,
    required Function onSuccess,
    required Function(String err) onError,
  }) {
    if (moneyAmount < balance) {
      onError("잔액이 부족합니다!");
    }
  }
}
