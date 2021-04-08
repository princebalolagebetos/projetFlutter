import 'package:flutter/material.dart';
import 'employee.dart';
import 'Services.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();
  final String title = 'Flutter  data table';
  @override
  State<StatefulWidget> createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  List<Employee> _employees;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  Employee _selectEmploye;
  bool _isUpdating;
  String _titleProgress;
  @override
  void initState() {
    super.initState();
    _employees = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  //methode to update title in the appbar title
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _createTable() {
   _showProgress('create table....');
    Services.createTable().then((result) {
      print(result);
      if ('succes' == result) {
        _showSnackBar(context, result);
        _showProgress(widget.title);
      }
    });
  }

  _addEmployee() {
    //
  }
  _getEmployer() {
    //
  }

  _updateEmployee() {
    //
  }
  _deleteEmployee() {
    //
  }

  // methode to clear Textfield value
  _clearValues() {
    _firstNameController.text = '';
    _lastNameController.text = '';
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(_titleProgress),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _createTable();
                  });
                }),
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _getEmployer();
                }),
          ],
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                        controller: _firstNameController,
                        decoration:
                            InputDecoration.collapsed(hintText: 'First Name'))),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                        controller: _lastNameController,
                        decoration:
                            InputDecoration.collapsed(hintText: 'last name'))),
                // add an update button and a cancel Button
                _isUpdating
                    ? Row(
                        children: <Widget>[
                          OutlineButton(
                              child: Text('UPDATE'),
                              onPressed: () {
                                _updateEmployee();
                              }),
                          OutlineButton(
                              child: Text('CANCEL'),
                              onPressed: () {
                                setState(() {
                                  _isUpdating = false;
                                });
                                _clearValues();
                              })
                        ],
                      )
                    : Container(),
              ]),
        ));
  }
}
