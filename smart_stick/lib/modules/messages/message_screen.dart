import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../components/constants.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Messages'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/alert.png',
              width: 25,
              height: 25,
            ),
            Center(
              child: Text(
                '${DateTime.now().hour}:${DateTime.now().minute} ',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return buildMessageImage(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildMessageImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.5,
      width: MediaQuery.of(context).size.width * 5,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          qrcode,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
