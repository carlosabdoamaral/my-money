import 'package:flutter/material.dart';
import 'package:mobile/widgets/TransactionRowWidget.dart';

class TransactionsListView extends StatefulWidget {
  const TransactionsListView({super.key});

  @override
  State<TransactionsListView> createState() => _TransactionsListViewState();
}

class _TransactionsListViewState extends State<TransactionsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico de gastos"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                for (var i in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
                  const TransactionRowWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
