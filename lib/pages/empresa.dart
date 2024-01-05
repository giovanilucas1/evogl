import 'package:flutter/material.dart';

class EmpresaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empresa'),
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
              Text(
                'Bem-vindo à Evolution IP!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'A EVOLUTION IP TELEFONIA E INFORMATICA LTDA – EPP é uma empresa de telecomunicações inscrita no CNPJ 08.094.360/0001-01 com licença SCM da Anatel.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              buildContactButton(
                onPressed: () {
                  _showContactInfo(context);
                },
                label: 'Ver Contato',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showContactInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          color: Color(0xFF3383CD),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CONTATO',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Rua Manoel Ramos Domingues, 42 - Bairro: Jd. Sara Regina - Cep: 09951-310',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '(11) 2149-2777',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'atendimento@evolutionip.com.br',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'vendas@evolutionip.com.br',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'suporte@evolutionip.com.br',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildContactButton({
    required VoidCallback onPressed,
    required String label,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Color(0xFF3383CD),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
