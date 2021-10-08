import 'package:flutter/material.dart';
import 'package:paginated_data_table/fetch_data.dart';

import 'package:paginated_data_table/user_model.dart';

class CustomPaginatedDataTable extends StatelessWidget {
  const CustomPaginatedDataTable({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final List<Users> userData;

  @override
  Widget build(BuildContext context) {
    int _rowsPerPage = userData.length > 4 ? 4 : userData.length;

    return SingleChildScrollView(
      child: PaginatedDataTable(
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: <int>[
          _rowsPerPage,
          _rowsPerPage * 2,
          _rowsPerPage * 5,
          _rowsPerPage * 10
        ],
        columns: const <DataColumn>[
          DataColumn(
            label: Text('ID'),
          ),
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(
            label: Text('Email'),
          ),
          DataColumn(
            label: Text('Phone'),
          ),
          DataColumn(
            label: Text('Website'),
          ),
          DataColumn(
            label: Text('Other Details'),
          ),
        ],
        source: UserDataSource(usersData: userData),
        header: const Text('Users'),
        actions: <IconButton>[
          IconButton(
            onPressed: () {
              fetchData();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class UserDataSource extends DataTableSource {
  UserDataSource({
    required this.usersData,
  });
  final List<Users> usersData;

  @override
  DataRow? getRow(int index) {
    // if (index >= usersData.length) {
    //   return DataRow.byIndex(
    //     index: index,
    //     cells: <DataCell>[
    //       DataCell(SizedBox()),
    //       DataCell(SizedBox()),
    //       DataCell(SizedBox()),
    //       DataCell(SizedBox()),
    //       DataCell(SizedBox()),
    //       DataCell(SizedBox()),
    //     ],
    //   );
    // }
    final user = usersData[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${user.id}')),
        DataCell(Text('${user.name}')),
        DataCell(Text('${user.email}')),
        DataCell(Text('${user.phone}')),
        DataCell(Text('${user.website}')),
        DataCell(
          IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: const Icon(Icons.details),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => usersData.length;

  @override
  int get selectedRowCount => 0;
}
