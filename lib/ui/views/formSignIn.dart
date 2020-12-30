part of 'views.dart';

class FormSignIn extends StatelessWidget {
  const FormSignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.fromLTRB(24, 0, 24, 10),
      padding: EdgeInsets.fromLTRB(8, 0, 8, 24),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.green,
                ),
                hintText: "Email Adress",
                hintStyle: TextStyle(color: Colors.green),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.vpn_key,
                  color: Colors.green,
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.green),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
          ),
        ],
      ),
    );
  }
}
