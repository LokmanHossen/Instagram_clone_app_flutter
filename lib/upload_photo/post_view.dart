import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Upload'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('"Write Something"'),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    hintText: 'Description',
                    filled: true,
                    fillColor: const Color(0xFF5E5B5B),
                  ),
                ),
                // TextField(
                //   maxLines: null,
                //   keyboardType: TextInputType.multiline,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide.none,
                //     ),
                //     contentPadding:
                //         const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                //     hintText: 'Description',
                //     filled: true,
                //     fillColor: const Color(0xFF5E5B5B),
                //   ),
                // )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 100,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.amber,
                child: Center(
                  child: Text('$index'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
