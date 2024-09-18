import 'package:dio/dio.dart';
import 'package:flutter/material.dart'; 
import 'package:atvd_paises/model/apiModel.dart';  

class PaisServices {
  final Dio dio = Dio();

  Future<ApiModel> getToDos() async {
    try {
      final response = await dio.get('https://restcountries.com/v3.1/all');
      if (response.statusCode == 200) {
        List<ApiModel> api1 = (response.data as List)
            .map((item) => ApiModel.fromJson(item))
            .toList();
        return api1; 
      } else {
        throw Exception('Falha na solicitação: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar dados: $e');
    }
  }

  Future<void> addPost(BuildContext context, String nome, String descricao, bool localizacao) async {
    ApiModel post = ApiModel(nome: nome, descricao: descricao, localizacao: localizacao);
    try {
      final response = await dio.post(
        'https://restcountries.com/v3.1/lang/portuguese',
        data: post.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      print('Resposta do Servidor: ${response.data}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Executado com sucesso!')),
      );
    } catch (e) {
      print('Erro ao adicionar o post: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao executar a ação: $e')),
      );
    }
  }
}

