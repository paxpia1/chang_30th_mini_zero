import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      builder: (context, service, child) {
        return Scaffold(
          appBar: AppBar(backgroundColor: TossColor.grey1, actions: [
            Image.asset(
              'assets/toss_appbar_icon_1.png',
              height: 47,
            ),
            const SizedBox(width: 15),
            Image.asset(
              'assets/toss_appbar_icon_2.png',
              height: 47,
            ),
            const SizedBox(width: 15),
            Image.asset(
              'assets/toss_appbar_icon_3.png',
              height: 47,
            ),
          ]),
        );
      },
    );
  }
}
