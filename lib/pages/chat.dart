import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/aappBarr.dart';
final _firestore = FirebaseFirestore.instance;
late User signedInUser;

class Chats extends StatefulWidget {
  Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final messageTextController =TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
      }
    } catch (e) {
      print(signedInUser.email);
    }
  }

  void messagesStreams()async{
    await for (var snapshot in _firestore.collection('chats').snapshots()){
      for (var message in snapshot.docs){
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:AppBBar('Chat'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText =value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: InputBorder.none,
                        hintText: 'Write Your massage here',
                      ),
                    ),),
                  TextButton(onPressed: () {
                    messageTextController.clear();
                    _firestore.collection('chats').add({
                      'text':messageText,
                      'sender':signedInUser.email,
                      'time':FieldValue.serverTimestamp()
                    });
                  }, child: Text('send',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('chats').orderBy('time').snapshots(),
        builder: (context,snapshot){
          List<MessageLine> messageWidgets = [

          ];
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            );
          }
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages){
            final messageText =message.get('text');
            final messageSender =message.get('sender');
            final currentUser= signedInUser.email;

            if(currentUser==messageSender){

            }
            final messageWidget =MessageLine(sender: messageSender,text: messageText,isMe: currentUser==messageSender,);
            messageWidgets.add(messageWidget);

          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              children: messageWidgets,
            ),
          );
        });
  }
}


class MessageLine extends StatelessWidget {
  const MessageLine({required this.isMe,this.text,this.sender,Key? key}) : super(key: key);
  final String? sender;
  final String? text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text('$sender',style: TextStyle(fontSize: 12,color: Colors.black45),),
          Material(
              elevation: 5,
              borderRadius: isMe?BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ):BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),

              ),
              color:isMe? Colors.blue[800]:Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text('$text',style: TextStyle(fontSize: 15,color: isMe?Colors.white:Colors.black),),
              )),
        ],
      ),
    );
  }
}