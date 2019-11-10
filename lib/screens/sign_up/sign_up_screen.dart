import 'dart:io';

import 'package:face_security/commons/widgets/loading_widget.dart';
import 'package:face_security/screens/sign_up/bloc/bloc.dart';
import 'package:face_security/screens/sign_up/widgets/enter_password_widget.dart';
import 'package:face_security/screens/sign_up/widgets/enter_photo_widget.dart';
import 'package:face_security/screens/sign_up/widgets/enter_username_widget.dart';
import 'package:face_security/utils/image_names.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PageController _controller;
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  File _file;
  final Duration _duration = const Duration(milliseconds: 500);
  final Curve _curve = Curves.linear;
  final GlobalKey<FormState> _usernameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpBloc bloc = BlocProvider.of(context);
    return Stack(
      children: <Widget>[
        Container(
          child: SvgPicture.asset(
            FSImageNames.background,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: FSColors.primaryColor,
            title: Text(
              FSStrings.signUp(context),
              style: FSTextStyles.appBar,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              EnterUsernameWidget(
                formKey: _usernameFormKey,
                title: FSStrings.next(context),
                controller: _usernameController,
                onSuccess: () {
                  bloc.dispatch(
                      ChangedUsernameEvent(username: _usernameController.text));
                  _controller.animateToPage(1,
                      duration: _duration, curve: _curve);
                },
              ),
              EnterPasswordWidget(
                formKey: _passwordFormKey,
                title: FSStrings.next(context),
                controller: _passwordController,
                onSuccess: () {
                  bloc.dispatch(
                      ChangePasswordEvent(password: _passwordController.text));
                  _controller.animateToPage(2,
                      duration: _duration, curve: _curve);
                },
              ),
              EnterPhotoWidget(
                onTap: () async {
                  var image =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  bloc.dispatch(ChangePhotoEvent(image: image));
                  setState(() {
                    _file = image;
                  });
                },
                title: FSStrings.signUp(context),
                onSuccess: () {
                  bloc.dispatch(SingUpTapped());
                },
                file: _file,
              ),
            ],
          ),
        ),
        LoadingWidget(),
      ],
    );
  }
}
