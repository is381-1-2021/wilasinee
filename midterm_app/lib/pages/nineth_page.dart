import 'package:flutter/material.dart';

class NinethPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily quote'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 420.0,
              padding: EdgeInsets.all(50.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'What is your today quote?',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'You have not enter your quote.';
                  }
                },
                onSaved: (value) {
                  _message = value!;
                },
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF8B82D0),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                var response = '$_message';

                Navigator.pop(context, response);
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
