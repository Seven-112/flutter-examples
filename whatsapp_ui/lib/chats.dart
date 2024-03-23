import 'package:whatsapp_ui/chat_summary_view_model.dart';

class Chats {
  final List<ChatSummaryViewModel> chatSummaryViewModels = [
    ChatSummaryViewModel(
      avatar:
          'https://www.centennialanimalhospital.com/wp-content/uploads/sites/45/2018/01/dogsmile.jpg',
      name: 'Doggy',
      message: 'I love Flutter! ❤️',
      time: '11:35',
      unreadMessages: 1,
    ),
    ChatSummaryViewModel(
      avatar:
          'https://images-production.freetls.fastly.net/uploads/posts/teaser_image/171208/cats-with-flat-faces.jpg',
      name: 'Catty',
      message: 'You do not know what happened ... Doggy broke all glasses ...',
      time: 'YESTERDAY',
      unreadMessages: 0,
    ),
    ChatSummaryViewModel(
      avatar:
          'https://images-na.ssl-images-amazon.com/images/I/51JJGcU6xGL._SL1000_.jpg',
      name: 'Doggy Brother',
      message: 'Catty blames me for everything!',
      time: 'FRIDAY',
      unreadMessages: 0,
    ),
  ];
}
