import 'package:flutter/material.dart';

class PlanosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planos'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PlanoContainer(
                nome: 'FTTH 50Mb - Consulte',
                descricao:
                    ' Dowload e Upload 100% \n Tecnologia fibra \n Consulte disponibilidade',
                icon: Icons.check_circle,
              ),
              SizedBox(height: 20),
              PlanoContainer(
                nome: 'FTTH 70Mb - Consulte',
                descricao:
                    ' Dowload e Upload 100% \n Tecnologia fibra \n Consulte disponibilidade',
                icon: Icons.check_circle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanoContainer extends StatelessWidget {
  final String nome;
  final String descricao;
  final IconData? icon;

  const PlanoContainer({
    required this.nome,
    required this.descricao,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3383CD),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  nome,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          SizedBox(height: icon != null ? 10 : 0),
          Text(
            descricao,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Color(0xFF3383CD),
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Contrate já',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
