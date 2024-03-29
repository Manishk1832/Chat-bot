import 'package:chat_bot/data/remote/api/api_helper.dart';
import 'package:chat_bot/data/remote/api/urls.dart';
import 'package:flutter/cupertino.dart';

import '../models/ai_generated_model.dart';
import '../models/message_model.dart';

class ChatProvider extends ChangeNotifier {
  List<MessageModel> listMsg = [];

  void sendMyPrompt({required String prompt}) async {
    listMsg.insert(
        0,
        MessageModel(
            msg: prompt,
            sentAt: DateTime.now().millisecondsSinceEpoch,
            senderId: 0));

    notifyListeners();

    //ai Bot answering
    try {
      var mData = await ApiHelper()
          .generateAIMsg(url: Urls.CHAT_COMPLETION_API, prompt: prompt);
      Autogenerated aiModel = Autogenerated.fromJson(mData);
      listMsg.insert(
          0,
          MessageModel(
              msg: aiModel.choices![0].message!.content!,
              sentAt: DateTime.now().millisecondsSinceEpoch,
              senderId: 1));
       notifyListeners();

    } catch (e) {
      listMsg.insert(
          0,
          MessageModel(
              msg: e.toString(),
              sentAt: DateTime.now().millisecondsSinceEpoch,
              senderId: 1));

      notifyListeners();
    }
  }

  List<MessageModel> getAllMessages() {
    return listMsg;
  }
}
