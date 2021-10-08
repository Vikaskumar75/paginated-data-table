import 'package:flutter/material.dart';
import 'custom_paginated_data_table.dart';
import 'fetch_data.dart';
import 'user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paginated Data Table',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const PaginatedDataTable(),
    );
  }
}

class PaginatedDataTable extends StatefulWidget {
  const PaginatedDataTable({Key? key}) : super(key: key);

  @override
  State<PaginatedDataTable> createState() => _PaginatedDataTableState();
}

class _PaginatedDataTableState extends State<PaginatedDataTable> {
  List<Users> _users = [];

  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        _users = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Paginated Data Table'),
      ),
      body: _users.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomPaginatedDataTable(userData: _users),
    );
  }
}
