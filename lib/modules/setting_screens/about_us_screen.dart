import 'package:flutter/material.dart';
import '../../components/components.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'About-Us'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'Currently, there are thousands of blind people all over the globe. This includes people with poor vision to people with a complete loss of vision.',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'They find difficulties in detecting obstacles in front of them, while walking in the streets, which makes it dangerous. The traditional stick cannot help to detect these obstacles. It is outdated. Hence there is a need to update it using today\'s technology'
                '\nSmart Eye comes as a proposed solution to enable them to identify the world around them. In this project, we propose a solution, represented in a combination of two parts.'
                '\nThe first part is a smart stick with three ultrasonic sensors to detect any obstacles in front of the user, within a range of one meter, a buzzer to alert the user in case there’s an obstacle in front of him, a Raspberry pi, and a Raspberry pi noir camera v2 to detect objects in front of the user. '
                '\nThe second part is an application to enable the family of the user to be always updated with his location and to be more confident that the user is not in danger, in case of the user felt that he is in danger, all that he has to do is just to click on the button on the smart stick and the camera will take a shot for the situation.'
                '\nThen, this shot, the user’s location, and a pre generated message (that the user is in danger) will automatically be directed to the application, to notify the family of the user (or the one who is responsible of him) that the user is in danger, so they could be able to save him before the situation becomes worse.',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
