import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ixoye_chat/widgets/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({ Key? key }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{

  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [
    
  ];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('Te', style: TextStyle( fontSize: 12),),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox( height: 3,),
            Text('Melissa Flores', style: TextStyle( color: Colors.black87, fontSize: 12),)
          ],
        ),
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                physics: BouncingScrollPhysics(),
                reverse: true,
              )
            ),
            Divider( height: 1,),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      )
    );
  }

  Widget _inputChat(){

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child:  TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto){
                  setState(() {
                    if( texto.trim().length > 0){
                      _estaEscribiendo = true;
                    }else{
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              )
            ),

            //boton de enviar
            Container(
              margin: EdgeInsets.symmetric( horizontal: 4.0),
              child: Platform.isIOS ?
                CupertinoButton(
                  child: Text('Enviar'), 
                  onPressed: (){}
                )
                : Container(
                  margin: EdgeInsets.symmetric( horizontal: 4.0),
                  child: IconTheme(
                    data: IconThemeData( color: Colors.blue[400]),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: _estaEscribiendo
                        ? ()=>_handleSubmit(_textController.text)
                        : null, 
                      icon: Icon(Icons.send,),
                    ),
                  ),
                )

              ,
            )
          ],
        ),
      ),
    );


  }

  _handleSubmit(String texto){
    if (texto.length == 0) {
      return;
    }
    
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      texto: texto,
      uid: '123',
      animationController: AnimationController(
        vsync: this, 
        duration: Duration(milliseconds: 400)
      ),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: Off del socket

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}