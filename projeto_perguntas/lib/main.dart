import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main(){
  runApp(new PerguntaApp());
}
//classe privada
class _PerguntaAppState extends State<PerguntaApp>{// o tipo de componente Stateful (PerguntaApp) ligado a esse componente state 
//contém o estado e as funçôes que depende do mesmo 
  var _perguntasSelecionadas=0; 
  var _pontuacaoTotal=0;
  final List<Map<String, Object>> _perguntas = const [//É DO TIPO MAP
      {
        'texto':'Qual é a sua cor favorita?',
        'respostas': [
          {'texto': 'Preto','pontuacao': 10},
          {'texto':'Vermelho','pontuacao': 5},
          {'texto':'Verde', 'pontuacao': 3},
          {'texto':'Branco','pontuacao': 1}
        ],
        
      },
      {
        'texto':'Qual o seu animal favorito?',
        'respostas': [
          {'texto': 'Coelho','pontuacao': 10},
          {'texto':'Cobra','pontuacao': 5},
          {'texto':'Elefante','pontuacao': 3},
          {'texto':'Leão','pontuacao': 1},
        ],
      },
      {
        'texto':'Qual o seu instrutor favorito?',
        'respostas': [ 
          {'texto':'Maria','pontuacao': 10},
          {'texto':'João','pontuacao': 5},
          {'texto':'Leo','pontuacao': 3}, 
          {'texto':'Pedro','pontuacao': 1},
        ],
      },
    ];
    
  void _responder(int pontuacao){// o método responder depende de estado 
    if(temPerguntaSelecionada){
      setState(() {
      _perguntasSelecionadas++;
      _pontuacaoTotal+=pontuacao;
    });
    }
    print(_pontuacaoTotal);
  }

  
  bool get temPerguntaSelecionada{
    return _perguntasSelecionadas < _perguntas.length;
  }
  
//a aárvore de componentes também depende do estado
  Widget build(BuildContext context){
    
    
 
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada 
        ? Questionario(
          perguntas: _perguntas, 
          perguntaSelecionada: _perguntasSelecionadas,
          quantoResponder: _responder
          )
        : Resultado(_pontuacaoTotal),
      ), 
    );
  }
}
class PerguntaApp extends StatefulWidget{//componente que está na árvore de componentes 
  
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
  
  
}