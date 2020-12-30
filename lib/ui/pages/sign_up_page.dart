part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.png'), fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,
                  margin: EdgeInsets.only(right: 24),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/header.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 50,
                          left: 24,
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(left: 8, right: 8, top: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Full Name",
                                    prefixIcon: Icon(Icons.person),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8, right: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    prefixIcon: Icon(Icons.mail),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8, right: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.vpn_key),
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8, right: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.vpn_key),
                                    hintText: "Confirm Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 24),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "No HP",
                                    prefixIcon: Icon(Icons.smartphone),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
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
                  height: 8,
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
                            width: 15,
                            height: 15,
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
                            width: 15,
                            height: 15,
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
                            width: 15,
                            height: 15,
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
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.only(right: 24, left: 24),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 17,
                          offset: Offset(0, 3))
                    ],
                    color: Colors.green[300],
                  ),
                  child: Center(
                    child: Text("Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Text(
                        "Login to your account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
