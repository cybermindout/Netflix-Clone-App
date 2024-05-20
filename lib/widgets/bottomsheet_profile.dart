
 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void profileswitch(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          // To enable dismissable
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 200,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Switch Profiles",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        'https://wallpapers.com/images/hd/netflix-profile-pictures-5yup5hd2i60x7ew3.jpg',
                        height: 45,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',
                          height: 50,
                        ),
                      ),
                      Image.network(
                        'https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-dyrp6bw6adbulg5b.jpg',
                        height: 45,
                      ),
                      Image.network(
                        'https://www.askdavetaylor.com/wp-content/uploads/2023/08/netflix-create-new-profile-fp.png',
                        height: 45,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Manage Profile"),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}