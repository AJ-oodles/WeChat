import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class messsageScreen extends StatefulWidget {
  final String name;
  const messsageScreen({super.key, required this.name});

  @override
  State<messsageScreen> createState() => _messsageScreenState();
}

class _messsageScreenState extends State<messsageScreen> {
  Stream<QuerySnapshot> messagestream=FirebaseFirestore.instance.collection("Message").orderBy('time').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: messagestream, builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
      if(snapshot.hasError){
        return Text("Something weird happen");
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(
          child:CircularProgressIndicator(),
        );
      }
      return ListView.builder(itemCount: snapshot.data!.docs.length,
      physics: ScrollPhysics(),
        shrinkWrap: true,
          primary: true,
        itemBuilder: (context,index){
        QueryDocumentSnapshot qds=snapshot.data!.docs[index];
        Timestamp time=qds['time'];
        DateTime date=time.toDate();
        return Padding(padding: EdgeInsets.symmetric(horizontal: 5,
        vertical: 10),
          child: Column(
            crossAxisAlignment: widget.name==qds['name']?CrossAxisAlignment.end:CrossAxisAlignment.start,
            children: [
              SizedBox(width: 300,
              child:ListTile(
                shape: RoundedRectangleBorder(
                side:BorderSide(color:Colors.purple
                ),
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(15),
  topRight: Radius.circular(15),
  bottomLeft: Radius.circular(15)
),
              ),
                title: Text(qds['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),
                ),
                subtitle: Row(children: [
                  SizedBox(
                  width:200,child: Text(qds["message"],
                    softWrap:true,
                    style: TextStyle(fontSize: 20 ,color: Colors.black),),
                  ),
                  Text("${date.hour}:%${date.minute}")
                ],),
              )
              )
            ],
          ),
        );
        },
      );
    }

    );


  }
}
