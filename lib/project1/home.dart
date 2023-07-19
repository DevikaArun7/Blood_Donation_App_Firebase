import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final CollectionReference donor = FirebaseFirestore.instance.collection('donor');

void deleteDonor(docId){
donor.doc(docId).delete();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Blood Donation App") ,
        backgroundColor: Colors.red,
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/add');
        },
         backgroundColor: Color.fromARGB(255, 230, 191, 189),
         child: Icon(Icons.add,
         size: 30,
         ),
        ) ,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: StreamBuilder(
          stream: donor.orderBy('Name').snapshots(),
          builder: (context,AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder:(context, index) {
                  final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 30,
                              child: Text(donorSnap['group'],
                              style:TextStyle(fontSize:25 ) ,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(donorSnap['Name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              Text(donorSnap['Phone'].toString(),style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){
                                Navigator.pushNamed(context,'/update',
                                arguments: {
                                  'Name':donorSnap['Name'],
                                  'Phone':donorSnap['Phone'].toString(),
                                  'group':donorSnap['group'],
                                  'id':donorSnap.id,
                                }
                                );
                              }, 
                              icon: Icon(Icons.edit),color: Colors.blue,),
                              IconButton(onPressed: (){
                                deleteDonor(donorSnap.id);
                              },
                               icon: Icon(Icons.delete),color: Colors.red,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }, );
            }
            return Container();
          },),
    );
  }
}