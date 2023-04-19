import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetPasswordForm extends StatefulWidget {
  String email;
  final String token;

  ResetPasswordForm({required this.email, required this.token});

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  TextEditingController emailC = TextEditingController();

  void _submitForm() async {
    String url = "'http://192.168.43.109/flutter_app/reset.php?token=${widget.token}'";
    Uri uri = Uri.parse(url);
    final response = await http.post(uri,
      body: {'email': widget.email, 'password': _passwordController.text},
    );
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text(response.body),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Column(children: [
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(),
        ),
         TextField(controller: emailC,
          decoration: InputDecoration(),
        ),
        ElevatedButton(onPressed: () {
          setState(() {
           widget.email = emailC.text;
          });
          _submitForm();
        }, child: Text("reset"))
      ]),
     );
  }
}
