import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'planos.dart';
import 'velocidade.dart';
import 'sociais.dart';
import 'empresa.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _openSite() async {
    const url = 'https://evolutionip.com.br';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o site $url';
    }
  }

  void _goToSociaisPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SociaisPage()));
  }

  void _goToVelocidadePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VelocidadePage()));
  }

  void _goToPlanosPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PlanosPage()));
  }

  void _goToClienteArea() async {
    const url = 'https://170.231.232.54/central_assinante_web/login';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir a Área do Cliente $url';
    }
  }

  void _goToEmpresaPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EmpresaPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "12:34 PM",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "100%",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 0),
                  Container(
                    width: double.infinity,
                    height: 265,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/evo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildIconButton(Icons.web, "Site", _openSite),
                      buildIconButton(Icons.align_horizontal_left, "Planos",
                          () {
                        _goToPlanosPage(context);
                      }),
                      buildIconButton(Icons.account_circle, "Área do \nCliente",
                          _goToClienteArea),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildIconButton(Icons.cell_tower, "Teste de\nVelocidade",
                          () {
                        _goToVelocidadePage(context);
                      }),
                      buildIconButton(Icons.phone, "Atendimento", () {
                      }),
                      buildIconButton(Icons.add_location_outlined, "Empresa",
                          () {
                        _goToEmpresaPage(context);
                      }),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildIconButton(Icons.contactless, "Rede Sociais", () {
                        _goToSociaisPage(context);
                      }),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      buildContactInfo("(11) 2149-2777", Icons.phone),
                      SizedBox(height: 8),
                      buildContactInfo(
                          "atendimento@evolutionip.com.br", Icons.mail),
                      SizedBox(height: 8),
                      buildContactInfo(
                          "www.evolutionip.com.br", Icons.language),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 40),
          onPressed: onPressed,
          color: Colors.white,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget buildContactInfo(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: Colors.white),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
