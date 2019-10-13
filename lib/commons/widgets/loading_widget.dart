import 'package:face_security/commons/blocs/loading/bloc/bloc.dart';
import 'package:face_security/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoadingBloc bloc = BlocProvider.of(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (_, LoadingState state) {
        if (state is BusyState) {
          return Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.4,
                child: ModalBarrier(
                  color: FSColors.modalBarrier,
                  dismissible: false,
                ),
              ),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
