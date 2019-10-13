import 'package:face_security/commons/widgets/loading_widget.dart';
import 'package:face_security/screens/sign_in/bloc/bloc.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _username;
  TextEditingController _password;
  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SignInBloc bloc = BlocProvider.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller: _username,
                                style: FSTextStyles.usernameTextForm,
                                textInputAction: TextInputAction.next,
                                validator: (String value) => value.isEmpty
                                    ? FSStrings.emptyUsername(context)
                                    : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: FSStrings.username(context),
                                ),
                              ),
                              TextFormField(
                                controller: _password,
                                style: FSTextStyles.passwordTextForm,
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                validator: (String value) => value.isEmpty
                                    ? FSStrings.emptyPassword(context)
                                    : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: FSStrings.password(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              bloc.dispatch(LoginTappedEvent(
                                  password: _password.text,
                                  username: _username.text));
                            }
                          },
                          child: Text(FSStrings.login(context)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          LoadingWidget(),
        ],
      ),
    );
  }
}
