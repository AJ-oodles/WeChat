import 'package:flutter/material.dart';
import 'package:wechat/chat/message.dart';
import 'package:wechat/widges/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../authentication/authentication.dart';
import '../login.dart';
class chatScreen extends StatefulWidget {
  final String? name;
  const chatScreen({super.key,  this.name});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final TextEditingController messageController=TextEditingController();
  final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  final FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello ${widget.name}"),
          backgroundColor: Colors.purple,
          elevation: 4.0,


        ),
        body: SingleChildScrollView(child: Column(children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.8,
          child: messsageScreen(name: widget.name! ),
          ),
          Padding(padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Jo v likhna hai likh dee!Jaida soch maatt",

                  enabled: true,
                  contentPadding: EdgeInsets.only(left: 15,bottom: 8,top: 8),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
                validator: (value){
                  return null;
                },
                onSaved: (value){
                  messageController.text=value!;
                },
              ),),
         IconButton(onPressed: (){
           if(messageController.text.isNotEmpty){
             firebaseFirestore.collection("Message").doc().set({
               'message':messageController.text.trim(),
               'time':DateTime.now(),
               'name':widget.name,

             });
             //after sending the msg clearing the textbox
             messageController.clear();
           }

         }, icon: Icon(Icons.send,size: 35,color: Colors.purple

           ,))
            ],
          ),
          )
        ],),),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Text(
                  'WeChat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info,),
                title: Text('About',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23)),
                // onTap: _navigateToAbout,
              ),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
                  onTap: ()async{
                    await  Authentication().signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Loginscreen()));
                  }
              ),
            ],
          ),
        )
    );
  }
}
