import 'user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread});

  final User currentUser =
      User(id: 0, name: 'Current User', imageUrl: 'assets/images/greg.png');
}
