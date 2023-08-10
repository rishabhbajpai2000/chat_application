import 'dart:math';

import 'package:flutter/material.dart';

import 'networking/network.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await refreshData();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () async {
            await refreshData();
            setState(() {});
          },
          child: Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              const Text(
                'Chat App',
                style: TextStyle(color: Colors.white),
              ),
              Expanded(child: Container()),
              Icon(Icons.search, color: Colors.white)
            ],
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Center(
                  child: Text('Personal Chats',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500))),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(chatList[index].profileImage),
                      ),
                      title: Text(chatList[index].userName),
                      subtitle: Text(chatList[index].message.substring(
                          0, min(20, chatList[index].message.length))),
                      trailing: Text(chatList[index].timeSent.toString()),
                    );
                  }),
            )
          ],
        ));
  }
}
