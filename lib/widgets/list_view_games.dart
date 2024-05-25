import 'package:flutter/material.dart';
import 'package:netflix_ui/Screens/details_page.dart';
import 'package:netflix_ui/constant.dart';

class CustomListView extends StatelessWidget {
  final List list;
  final List newList;
  final String s;

  CustomListView({
    Key? key,
    required this.list,
    required this.s,
    required this.newList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (s.isEmpty)
        ? ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SizedBox(
                    width: 48, 
                    height: 48, 
                    child: Image.network(
                      imagePath + list[index]['backdrop_path'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(list[index]['title']),
                  trailing: IconButton(
                    icon: Icon(Icons.play_circle_outline),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            image: imagePath + list[index]['backdrop_path'],
                            title: list[index]['title'],
                            details: list[index]['overview'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          )
        : (newList.isEmpty)
            ? const Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Oops. We haven't got that.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Try searching for another movie",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            : ListView.builder(
                itemCount: newList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 48, // Adjust the width as needed
                        height: 48, // Adjust the height as needed
                        child: Image.network(
                          imagePath + newList[index]['backdrop_path'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(newList[index]['title']),
                      trailing: IconButton(
                        icon: Icon(Icons.play_circle_outline),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                image:
                                    imagePath + newList[index]['backdrop_path'],
                                title: newList[index]['title'],
                                details: newList[index]['overview'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
  }
}
