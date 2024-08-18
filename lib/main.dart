import 'package:emprest_ai/calendar/calendar.dart';
import 'package:emprest_ai/historic/historic.dart';
import 'package:emprest_ai/loan/loan.dart';
import 'package:emprest_ai/register/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emprest.ai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoanManagementHome(),
    );
  }
}

class LoanManagementHome extends StatefulWidget {
  @override
  _LoanManagementHomeState createState() => _LoanManagementHomeState();
}

class _LoanManagementHomeState extends State<LoanManagementHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emprest.ai'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.calendar_today), text: 'Calendário'),
            Tab(icon: Icon(Icons.add), text: 'Empréstimo'),
            Tab(icon: Icon(Icons.history), text: 'Histórico'),
            Tab(icon: Icon(Icons.person), text: 'Cadastro'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Cada widget aqui corresponde a uma aba.
          CalendarScreen(),
          NewLoanScreen(),
          HistoricScreen(),
          RegisterScreen(),
        ],
      ),
    );
  }
}

