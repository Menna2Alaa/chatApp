import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<Message> messagesList = [];

  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );

  void sendMessage({required String message, required String email}) {
    messages.add({
      kMessage: (message),
      kCreatedTime: DateTime.now(),
      kId: email,
    });
  }

  void getMessages() {
    messages.orderBy(kCreatedTime, descending: true).snapshots().listen((
      event,
    ) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
