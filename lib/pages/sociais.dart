import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SociaisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redes Sociais'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildSocialButton(
                onPressed: () => _openUrl('https://www.facebook.com/internetevolutionip'),
                label: 'Facebook',
                icon: Icons.facebook,
              ),
              SizedBox(height: 10),
              buildSocialButton(
                onPressed: () => _openUrl('https://www.instagram.com/evo_internet'),
                label: 'Instagram',
                icon: Icons.camera_alt,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir a URL $url';
    }
  }

  Widget buildSocialButton({
    required VoidCallback onPressed,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.blue, // Text color
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
