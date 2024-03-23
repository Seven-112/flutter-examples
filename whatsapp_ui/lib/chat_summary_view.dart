import 'package:flutter/material.dart';
import 'chat_summary_view_model.dart';

class ChatSummaryView extends StatelessWidget {
  final Color textUnreadGreenColor = const Color.fromARGB(255, 8, 211, 111);

  final ChatSummaryViewModel chatSummaryViewModel;

  const ChatSummaryView(this.chatSummaryViewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(chatSummaryViewModel.avatar),
        ),
        title: Text(
          chatSummaryViewModel.name,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          chatSummaryViewModel.message,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildTextTime(),
            // buildUnreadMessages(),
          ],
        ),
      ),
    );
  }

  Widget buildTextTime() {
    return Text(
      chatSummaryViewModel.time,
      style: TextStyle(
        color: chatSummaryViewModel.time.contains(':')
            ? textUnreadGreenColor
            : Colors.grey,
      ),
    );
  }

  // Widget buildunreadMessages() {}
}
