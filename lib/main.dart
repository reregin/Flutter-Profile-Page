import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final double coverHeight = 200;
final double profileHeight = 150;
final top = coverHeight - profileHeight / 2;
final bottom = profileHeight / 2;

class _HomePageState extends State<HomePage> {
  
  /*
 Future<Data> getUserData() async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users/2'),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Data userData = userModel.fromJson(body).data;
      return userData;
    } else {
      throw 'Error';
    }
  }

  late Future<Data> user;

  @override
  void initState() {
    super.initState();
    user = getUserData();
  }
  */
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
                    
          children: [
            
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
              // Header picture
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Container(
                    height: 225,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/header.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 75),

                // Profile picture with white strokes
                Positioned(
                  top: top,
                  child: CircleAvatar(
                      radius: profileHeight / 2,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                
              ],
            ),

            SizedBox(height: 20),            
            Padding(padding: EdgeInsets.only(top: bottom)),

            // Name and bio
            Text(
              'Regina George',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '220211060112',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSocialIcon(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/regina-george/'),
                    const SizedBox(height: 12),
                    buildSocialIcon(FontAwesomeIcons.github, 'https://github.com/reregin'),
                    const SizedBox(height: 12),
                    buildSocialIcon(FontAwesomeIcons.hackerrank, 'https://www.hackerrank.com/reginageo'),
                    const SizedBox(height: 12),
                  ],
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Starting career with love and passion in IT industry. Currently interested to learn more on Cloud Computing, Web Development, Mobile Development, and Game Development. Also love filmmaking and editing as a hobby.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialIcon(IconData icon, String url) => CircleAvatar(
      radius: 25,
      child: InkWell(
        onTap: () => launch(url),
        child: Center(child: Icon(icon, size: 32)),
      ),
  );
}
