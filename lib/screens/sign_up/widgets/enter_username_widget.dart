import 'package:face_security/screens/sign_up/widgets/button_widget.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';

class EnterUsernameWidget extends StatelessWidget {
  EnterUsernameWidget(
      {@required this.controller,
      @required this.onSuccess,
      @required this.title,
      @required this.formKey})
      : assert(onSuccess != null),
        assert(title != null),
        assert(formKey != null);
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final Function() onSuccess;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: controller,
                validator: (String value) =>
                    value.isEmpty ? FSStrings.emptyUsername(context) : null,
                decoration: InputDecoration(
                  labelText: FSStrings.username(context),
                  labelStyle: FSTextStyles.usernameLabelStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ButtonWidget(
                  onTap: () {
                    if (formKey.currentState.validate()) {
                      FocusScope.of(context).nextFocus();
                      onSuccess();
                    }
                  },
                  title: title,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
