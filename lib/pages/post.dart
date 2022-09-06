import 'package:finam_flutter/models/model.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post(this.data, this.index, {Key? key}) : super(key: key);
  final List<Children> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.grey,
        title: const Text(
          "Post",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                data[index].title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text("ups: ${data[index].ups}",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(data[index].text!),
            ],
          ),
        ),
      ),
    );
  }
}
