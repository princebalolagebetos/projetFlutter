import 'package:flutter/material.dart';
import 'package:up_user/models/widgets/dataTableMysqlDemo/DatatableDemo.dart';
import 'package:up_user/pages/homePage.dart';
import 'package:up_user/pages/powerPage.dart';
//import 'package:http/http.dart' as http;

void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'testing',
      //  home: LoginPage(),
       home: DataTableDemo(),
        routes: <String, WidgetBuilder>{
          '/powerPage': (BuildContext context) => new Power(),
          '/homePage': (BuildContext context) => new HomePage(),
          '/LoginPage': (BuildContext context) => new LoginPage()
        });
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controlerUser = new TextEditingController();
  TextEditingController controlerPass = new TextEditingController();

  String message = '';

  // Future<List> login() async {
  //   final response = await http.post('http//198.168.43.158', body: {
  //     "username": controlerUser.text,
  //     "password": controlerPass.text,
  //   });

  //   //var datauser = json.decode(response.body);
  //   // if(datauser.length == 0){
  //   //   setState(() {
  //   //      message = 'bien';
  //   //   });
  //   // }else{
  //   //   if(datauser[0]['nivel'] == 'admin'){
  //   //     Navigator.pushReplacementNamed(context, "/powerPage");
  //   //   }else if( datauser[0]['nivel'] == 'prince' {
  //   //     Navigator.pus(context,'/homePage');
  //   //   })
  //   //   setState(() {
  //   //     username = datauser[0]['username'];
  //   //   });
  //   // }
  //   //  return datauser;
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: new AssetImage('assets/images/digital.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 70.0),
                child: Icon(Icons.person, color: Color(0xff033250), size: 100),
                width: 170,
                height: 170,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 93),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: controlerUser,
                          decoration: InputDecoration(
                              icon: Icon(Icons.email, color: Colors.black),
                              hintText: 'Email'),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: controlerPass,
                          obscureText: true,
                          decoration: InputDecoration(
                              icon: Icon(Icons.vpn_key, color: Colors.black),
                              hintText: 'Password'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 6,
                            right: 32,
                          ),
                          // child: Text(
                          //   'pass',
                          //   style: TextStyle(color: Colors.grey),
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        child: Text('valider'),
                        color: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          LoginApp();
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        message,
                        style: TextStyle(fontSize: 25.0, color: Colors.red),
                      )
                    ],
                  ))
            ],
          ),
        )));
  }
}
