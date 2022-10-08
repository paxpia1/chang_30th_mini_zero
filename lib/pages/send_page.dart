import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

const List<String> bankList = <String>[
  '시티은행',
  '신한은행',
  '카카오뱅크',
];

class SendPage extends StatefulWidget {
  const SendPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  String bankDropdownValue = bankList.first;
  TextEditingController moneyValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      builder: (context, service, child) {
        return GestureDetector(
          onTap: () {},
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "송금하기",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        "어디로 보낼까요?",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                    DropdownButton<String>(
                      value: bankDropdownValue,
                      items: bankList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          bankDropdownValue = value!;
                        });
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        controller: moneyValueController,
                        decoration: InputDecoration(labelText: "원"),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        child: Text(
                          '보내기',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          print(double.parse(moneyValueController.text));
                          service.sendMoney(
                              moneyAmount:
                                  double.parse(moneyValueController.text),
                              onError: (errText) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errText),
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
