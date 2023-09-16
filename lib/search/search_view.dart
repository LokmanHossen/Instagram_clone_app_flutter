import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final List<Map<String, dynamic>> searchUser = [
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
      'username': 'johndoe',
      'fullName': 'John Doe',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2017/09/26/17/34/ballet-2789416_640.jpg',
      'username': 'janedoe',
      'fullName': 'Jane Doe',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2019/05/28/05/06/female-4234344_640.jpg',
      'username': 'mikebrown',
      'fullName': 'Mike Brown',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg',
      'username': 'emilyjones',
      'fullName': 'Emily Jones',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg',
      'username': 'alexsmith',
      'fullName': 'Alex Smith',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
      'username': 'sarahwilliams',
      'fullName': 'Sarah Williams',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg',
      'username': 'davidlee',
      'fullName': 'David Lee',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg',
      'username': 'laurajohnson',
      'fullName': 'Laura Johnson',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg',
      'username': 'emilyjones',
      'fullName': 'Emily Jones',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg',
      'username': 'alexsmith',
      'fullName': 'Alex Smith',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
      'username': 'sarahwilliams',
      'fullName': 'Sarah Williams',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg',
      'username': 'davidlee',
      'fullName': 'David Lee',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg',
      'username': 'laurajohnson',
      'fullName': 'Laura Johnson',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg',
      'username': 'emilyjones',
      'fullName': 'Emily Jones',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg',
      'username': 'alexsmith',
      'fullName': 'Alex Smith',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
      'username': 'sarahwilliams',
      'fullName': 'Sarah Williams',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg',
      'username': 'davidlee',
      'fullName': 'David Lee',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg',
      'username': 'laurajohnson',
      'fullName': 'Laura Johnson',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color.fromARGB(255, 39, 39, 39),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchUser.length,
        itemBuilder: (context, index) {
          var data = searchUser[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(data['profileImageUrl']),
            ),
            title: Text(data['username']),
            subtitle: Text(data['fullName']),
          );
        },
      ),
    );
  }
}
