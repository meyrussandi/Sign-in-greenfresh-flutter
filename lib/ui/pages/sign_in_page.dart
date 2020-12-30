part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Pengguna dataPengguna = Pengguna();
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 6 / 8;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void showSnackBar(String title) {
    final snackbar = SnackBar(
      content: Text("${title}"),
      duration: Duration(seconds: 2),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  void validateForm() {
    if (formKey.currentState.validate()) {
      login();
    } else {
      showSnackBar("Please Check your Field");
    }
  }

  void login() {
    progressDialog(context);
    apiService.loginPengguna(dataPengguna).then((value) {
      Navigator.pop(context);
      if (value != null) {
        PenggunaModel response = value;
        if (response.status == 200) {
          showSnackBar("${response.message}");
        } else {
          showSnackBar("${response.message}");
        }
      } else {
        showSnackBar("Please Check your Connection");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFFEEEEEE),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                right: -getSmallDiameter(context) / 4,
                top: -getSmallDiameter(context) / 3,
                child: Container(
                    width: getSmallDiameter(context),
                    height: getSmallDiameter(context),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.green[700], Colors.green[100]],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter))),
              ),
              Positioned(
                left: -getBigDiameter(context) / 5,
                top: -getBigDiameter(context) / 5,
                child: Container(
                    width: getBigDiameter(context),
                    height: getBigDiameter(context),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: 
                        LinearGradient(
                            colors: [Colors.green[700], Colors.green[200]],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter))),
              ),
              Positioned(
                right: -getSmallDiameter(context) / 3,
                bottom: -getSmallDiameter(context) / 3,
                child: Container(
                    width: getSmallDiameter(context),
                    height: getSmallDiameter(context),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.green[200], Colors.green[100]],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter))),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(
                          right: 24, top: getSmallDiameter(context) / 7),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/header.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              bottom: 4,
                              left: 24,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.fromLTRB(24, 0, 24, 10),
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 24),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              autovalidate: true,
                              style: TextStyle(color: Colors.green),
                              initialValue: dataPengguna?.email ?? "",
                              validator: (val) => val.isEmpty
                                  ? "Kolom tidak boleh kosong"
                                  : null,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.green,
                                  ),
                                  hintText: "Email Adress",
                                  hintStyle: TextStyle(color: Colors.green),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              onChanged: (value) {
                                setState(() {
                                  dataPengguna.email = value;
                                });
                              },
                            ),
                            TextFormField(
                              autovalidate: true,
                              style: TextStyle(color: Colors.green),
                              initialValue: dataPengguna?.password ?? "",
                              validator: (val) => val.length < 6
                                  ? "Password terlalu pendek"
                                  : null,
                              obscureText: true,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.green,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.green),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              onChanged: (value) {
                                setState(() => dataPengguna?.password = value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("lupa password");
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 24, bottom: 18),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.green, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            "OR",
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            print("fb");
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 24),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/fbicon.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("instagram");
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 24),
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/igicon.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("google");
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 24),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/googleicon.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("twitter");
                          },
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/twittericon.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 24, left: 24),
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 17,
                                  offset: Offset(0, 3))
                            ],
                            color: Colors.green[600],
                          ),
                          child: Center(
                            child: Text("Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24)),
                          ),
                        ),
                        onTap: () {
                          validateForm();
                        }),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text(
                            "Don't you have account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
