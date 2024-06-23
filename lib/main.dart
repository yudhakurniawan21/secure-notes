import 'package:flutter/material.dart';
import 'models/note.dart';
import 'models/user.dart';
import 'screens/add_edit_note_screen.dart';
import 'screens/login_screen.dart';
import 'screens/note_detail_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/setting_screen.dart';
import 'screens/terms_of_service_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.brown.shade50,
          primaryColor: Color(0xFF6F4E37),
          secondaryHeaderColor: Color(0xFFA67B5B),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.brown, // Warna latar belakang AppBar
            foregroundColor: Colors.brown.shade50, // Warna teks judul AppBar
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
            ),
          ),
          cardTheme: CardTheme(
            color: Colors.brown, // Warna latar belakang Card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.brown,
            ),
          )),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) {
          final user = ModalRoute.of(context)!.settings.arguments as User;
          return MainScreen(user: user);
        },
        '/add_edit_note': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return AddEditNoteScreen(
            note: args['note'],
            userId: args['userId'],
          );
        },
        '/note_detail': (context) {
          final note = ModalRoute.of(context)!.settings.arguments as Note;
          return NoteDetailScreen(note: note);
        },
        '/terms_of_service': (context) => TermsOfServiceScreen(),
        '/privacy_policy': (context) => PrivacyPolicyScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  final User user;

  MainScreen({required this.user});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions(User user) => <Widget>[
        HomeScreen(user: user),
        ProfileScreen(user: user),
        SettingsScreen(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 3) {
        // Log out and navigate to login screen
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions(widget.user).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
