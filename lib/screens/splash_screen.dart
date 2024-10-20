// lib/splash_screen.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Tambahkan delay jika diperlukan
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'), // Logo kustom
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: Center(child: Text('Selamat datang di halaman utama!')),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selamat datang di halaman utama lur!'),
            SizedBox(height: 20), // Spasi antara teks dan tombol
            ElevatedButton(
              onPressed: () {
                // Logika untuk logout
                // Misalnya, menghapus token atau status pengguna
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
