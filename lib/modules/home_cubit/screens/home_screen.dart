import '../../../components/components.dart';
import '../../../modules/home_cubit/cubit/cubit.dart';
import '../../../modules/home_cubit/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/messages/message_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                buildNewNotification(
                  context,
                  onTap: () {
                    navigateTo(context, MessageScreen());
                  },
                ),
                buildOldNotification(context, onTap: () {}),
                buildOldNotification(context),
              ],
            ),
          ),
        );
      },
    );
  }
}
