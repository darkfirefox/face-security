import 'package:face_security/screens/about/about_builder.dart';
import 'package:face_security/screens/menu/bloc/bloc.dart';
import 'package:face_security/screens/profile/profile_builder.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MenuBloc bloc = BlocProvider.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              FSStrings.menu(context),
              style: FSTextStyles.menuTitle,
            ),
            decoration: BoxDecoration(
              color: FSColors.primaryColor,
            ),
          ),
          ListTile(
            title: Text(
              FSStrings.profile(context),
              style: FSTextStyles.menuProfile,
            ),
            onTap: () =>
                Navigator.push(context, ProfileBuilder().build(context)),
          ),
          ListTile(
            title: Text(
              FSStrings.about(context),
              style: FSTextStyles.menuAbout,
            ),
            onTap: () => Navigator.push(context, AboutBuilder().build(context)),
          ),
          ListTile(
            title: Text(
              FSStrings.logout(context),
              style: FSTextStyles.menuLogout,
            ),
            onTap: () => bloc.dispatch(LogoutTappedEvent()),
          ),
        ],
      ),
    );
  }
}
