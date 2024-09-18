import 'package:flutter/material.dart';
import 'package:atvd_paises/model/paisModel.dart';
import 'package:atvd_paises/services/paisServices.dart';
import 'package:url_launcher/url_launcher.dart';


class AppPage extends StatefulWidget {
  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final PaisServices _paisServices = PaisServices();

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text('Países de Língua Portuguesa para Visitar'),
      ),
      body: FutureBuilder(
          future: _paisServices.fetchPaisInformation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao acessar API!'),
              );
             } else if (snapshot.hasData) {
               final paises = snapshot.data as List<PaisModel>;
               return ListView.builder(
                 itemCount: paises.length,
                 itemBuilder: (context, index) {
                   final pais = paises[index];
                   return ListTile(
                     leading: Image.network(
                       pais.paisImage as String,
                       height: 50,
                     ),
                     title: Text(pais.nome),
                    subtitle: Text('Nome do país: ${pais.nome}'),
                  
                  );
                },
              );
            } else {
              return Center(child: Text('Nenhum dado disponível'));
            }
          }),
    );
  }
}