import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/chat.dart';

List<Chat> chatList = [];

Future<void> refreshData() async {
  final respose = await http.get(Uri.parse("https://slaychatgpt.com/api.php"));

  if (respose.statusCode == 200) {
    addDataToChatList(respose.body);
  }

  return;
}

void addDataToChatList(String body) {
  final jsonMap = json.decode(body);
  final List<dynamic> chatListJson = jsonMap['chatList'];

  chatList = chatListJson.map((json) => Chat.fromJson(json)).toList();
}
