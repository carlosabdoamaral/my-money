import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/common/colors.dart';
import 'package:mobile/views/signin_view.dart';
import 'package:mobile/views/profile_view.dart';
import 'package:mobile/views/transaction_list_view.dart';
import 'package:mobile/widgets/add_transaction_modal.dart';
import 'package:mobile/widgets/dashboard_amount_widget.dart';
import 'package:mobile/widgets/transaction_row_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List<SalesData> chartData = [
    SalesData(DateTime.now(), 35),
    SalesData(DateTime.now().add(const Duration(days: 1)), 28),
    SalesData(DateTime.now().add(const Duration(days: 2)), 34),
    SalesData(DateTime.now().add(const Duration(days: 3)), 32),
    SalesData(DateTime.now().add(const Duration(days: 4)), 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(
            color: green,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfileView(),
              ),
            );
          },
          child: const Icon(
            Icons.person,
            color: green,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 20,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.logout,
                    color: green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DashboardAmountWidget(
                        amount: 100,
                        iconData: Icons.trending_down,
                        label: "Gasto acumulado",
                        color: red,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DashboardAmountWidget(
                        amount: 100,
                        iconData: Icons.trending_up,
                        label: "Gasto planejado",
                        color: green,
                      ),
                    ),
                  ],
                ),

                // Gasto diário
                const SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      "Gasto diários",
                      style: GoogleFonts.poppins(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.02),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SfCartesianChart(
                    primaryXAxis: const DateTimeAxis(
                      borderColor: Colors.transparent,
                    ),
                    plotAreaBorderColor: Colors.transparent,
                    series: <CartesianSeries>[
                      LineSeries<SalesData, DateTime>(
                        color: green,
                        dataSource: chartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                      )
                    ],
                  ),
                ),

                // Lista de transações
                const SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      "Gastos recentes",
                      style: GoogleFonts.poppins(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                for (var _ in [0, 1, 2]) const TransactionRowWidget(),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TransactionsListView(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Histórico completo",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const AddTransactionModal();
            },
          );
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
