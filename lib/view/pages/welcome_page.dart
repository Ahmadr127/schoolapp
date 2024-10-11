import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'info_page.dart';
import 'agenda_page.dart';
import 'gallery_page.dart';
import '../theme/theme_provider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    InfoScreen(),
    AgendaScreen(),
    GaleryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Student App',
          style: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.5),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.message,
              color: Colors.white,
            ),
            onPressed: () {
              // Tambahkan aksi yang diinginkan ketika ikon pesan ditekan
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Ahmad Rifai',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text('email@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('asset/images/profile.png'),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[900]
                : Colors.blue,
                image: DecorationImage(
                  image: AssetImage('asset/images/background.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,  color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.blue,),
              title: Text('Beranda'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.blue,),
              title: Text('Informasi'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.blue,),
              title: const Text('Agenda'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.blue,),
              title: Text('Galeri'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey),
              title: Text('Pengaturan Tema'),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              ),
              onTap: () {
                themeProvider.toggleTheme();
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text('Keluar', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Tambahkan aksi untuk logout
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Galery',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
        onTap: _onItemTapped,
      ),
    );
  }
}
