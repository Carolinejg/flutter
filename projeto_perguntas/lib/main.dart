import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatelessWidget{

  void responder(){
    print('Pergunta respondida!');
  }
  void Function() funcaoQueRetornaUmaOutraFuncao() {
    return () {
      print('Pergunta respondida #02!');
    };
  }
  Widget build(BuildContext context){
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual o seu animal favorito?'
    ];
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas.elementAt(0)),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder, //passar um refencia para uma função ja criada
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: (){
                print('Resposta 2 foi selecionada!'); //criando a função
              }
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: funcaoQueRetornaUmaOutraFuncao(),//Invocando função como parâmetro
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: () => print('Resposta 3!!!'),
            )
            
          ],
        ),
      ),

    );
  }
}