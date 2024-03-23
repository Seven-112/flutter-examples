import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chat_summary_view.dart';
import 'package:whatsapp_ui/chat_summary_view_model.dart';
import 'package:whatsapp_ui/chats.dart';

const Color textUnreadGreenColor = Color.fromARGB(255, 8, 211, 111);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 7, 94, 85),
      ),
      home: ChatsView(
        title: 'WhatsApp',
        chatSummaryViewModel: Chats().chatSummaryViewModels,
      ),
    );
  }
}

class ChatsView extends StatelessWidget {
  final String title;
  final List<ChatSummaryViewModel> chatSummaryViewModel;

  const ChatsView(
      {super.key, required this.title, required this.chatSummaryViewModel});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: buildTabBarView(),
          actions: buildActions(),
        ),
        body: buildChatList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: textUnreadGreenColor,
          child: const Icon(Icons.message),
        ),
      ),
    );
  }

  PreferredSizeWidget buildTabBarView() {
    return const TabBar(
      indicatorColor: Colors.white,
      tabs: [
        Tab(text: 'CALLS'),
        Tab(text: 'CHATS'),
        Tab(text: 'CONTACTS'),
      ],
    );
  }

  List<Widget> buildActions() {
    return <Widget>[
      IconButton(icon: const Icon(Icons.search), onPressed: () {}),
      IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
    ];
  }

  Widget buildChatList() {
    return SafeArea(
      child: ListView.separated(
        itemCount: chatSummaryViewModel.length,
        separatorBuilder: (BuildContext context, int index) => buildDivider(),
        itemBuilder: (BuildContext context, int index) {
          return ChatSummaryView(chatSummaryViewModel[index]);
        },
      ),
    );
  }

  Widget buildDivider() {
    return const Divider(
      height: 0.0,
      color: Colors.black38,
      indent: 95.0,
      endIndent: 10.0,
    );
  }
}
