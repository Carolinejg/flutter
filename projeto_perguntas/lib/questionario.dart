import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;

  Questionario({ //@required diz que os parâmetos são obrigatórios
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quantoResponder
  });

  bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,Object>> respostas= temPerguntaSelecionada
    ? perguntas[perguntaSelecionada]['respostas'] 
    :null;
    
    return Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]['texto']),
             ...respostas
             .map((resp){
               return Resposta(
                 resp['texto'],
                 () =>quantoResponder(resp['pontuacao']),
                 );
              }).toList(),//operador spread, pega todos os elementos da lista resposta e coloca dentro da lista de Column
          ],
        ); 
  }
}