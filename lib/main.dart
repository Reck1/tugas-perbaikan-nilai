import 'package:flutter/material.dart';
import 'package:perbaikan_nilai/DBHelper.dart';
import 'package:perbaikan_nilai/perbaikan.dart';
import '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

//halaman Login////////////////////////////////////////////////////////////////////////////////////////////////////
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool secured;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ausername = TextEditingController();
  final apassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        color: Colors.blue,
        child: Column(
          key: _formKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang, Silahkan Login",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                // validator: (val) =>
                //     (val.length == 0 ? 'this field is required' : null),
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon:
                        Icon(Icons.person, size: 40, color: Colors.black),
                    hintText: "Username",
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.transparent)),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                // validator: (val) =>
                //     (val.length == 0 ? 'this field is required' : null),
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.lock, size: 40, color: Colors.black),
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.transparent)),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.black,
              elevation: 5,
              child: Container(
                height: 50,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));

                    // if (_formKey.currentState.validate()) {
                    // } else {
                    //   print("gagal?");
                    // }

                    // print("hallo?");
                  },
                  child: Center(
                    child: Text(
                      "Masuk",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "belum punya Akun? klik Register",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Card(
              color: Colors.black,
              elevation: 5,
              child: Container(
                height: 50,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterPage();
                    }));
                  },
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//halaman register/////////////////////////////////////////////////////////////////////////////////////////////////
class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final cusername = TextEditingController();
  final cpassword = TextEditingController();
  final cemail = TextEditingController();

  Future regisnow() async {
    var db = DBHelper();
    var perbaikan = Perbaikan(cusername.text, cpassword.text, cemail.text);
    await db.saveNote(perbaikan);
    print("saved");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }

  void _saveData() {
    regisnow();
    // var form = _formKey.currentState;
    // if (form.validate()) {}
  }

  // _onSubmit() async {
  //   var form = _formKey.currentState;
  //   if (form.validate()) {
  //     print("ada berhasil mungkin?");
  //   } else {
  //     print(Text("gagal?"));
  //   }
  //   print(Text("tidak terjadi apa-apa?"));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        color: Colors.blue,
        child: Column(
          key: _formKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang, Silahkan isi Data Anda",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: cusername,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Username",
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.transparent),
              validator: (val) =>
                  (val.length == 0 ? 'this field is required' : null),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: cpassword,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.transparent),
              validator: (val) =>
                  (val.length == 0 ? 'this field is required' : null),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: cemail,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.transparent),
              validator: (val) =>
                  (val.length == 0 ? 'this field is required' : null),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.black,
              elevation: 5,
              child: Container(
                height: 50,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: _saveData,
                  // _saveData,
                  // if (_formKey.currentState.validate()) {
                  //     print("ada berhasil mungkin?");
                  //   } else {
                  //     print(Text("gagal?"));
                  //   }
                  //   print(Text("tidak terjadi apa-apa?"));
                  // if (_formKey.currentState.validate()) {}
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "ATAU",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.black,
              elevation: 5,
              child: Container(
                height: 50,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Center(
                    child: Text(
                      "Kembali Ke Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//halaman Home//////////////////////////////////////////////////////////////////////////////////////////////////////
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
      ),
      body: Center(
          child: Text(
        "Selamat Datang Di Halaman Utama",
        style: TextStyle(fontSize: 20, color: Colors.black),
      )),
    );
  }
}
