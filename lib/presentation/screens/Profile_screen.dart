import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Image(image: AssetImage("assets/images/profile.png")),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Ahmed Elfeky",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Times",
          ),
        ),
        SizedBox(height: 50),
        Text(
          "Profile Info",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,fontFamily: "Poppins"),
        ),
        ListTile(
          onTap: () {
          },
          leading: Icon(Icons.person),
          title: Text("User Details",style: TextStyle(fontFamily: "Poppins"),),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          leading: Icon(Icons.dark_mode_sharp),
          title: Text("Dark Mode",style: TextStyle(fontFamily: "Poppins"),),
          trailing: Switch(value: true, onChanged: (value){}),
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app_sharp),
          title: Text("Log Out", style: TextStyle(fontSize: 16,fontFamily: "Poppins")),
          trailing: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
