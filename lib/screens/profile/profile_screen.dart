import 'package:face_security/utils/image_names.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          FSStrings.profile(context),
          style: FSTextStyles.appBar,
        ),
      ),
      body: Center(
        child: SvgPicture.asset(
          FSImageNames.profile,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
