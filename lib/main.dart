// primeiro devemos criar a função main, e a primeira a ser executada no codigo dart

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //retirar a etiqueca da debug vermelah no app
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// Exemplo :1
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // incluir cor
//       color: const Color.fromARGB(255, 0, 0, 0),
//       // alinhar o texto abaixo no centro do container
//       alignment: Alignment.center,
//       // incluir texto filho e (child)
//       child: const Text('Olá mundo1!!!'),
//     );
//   }
// }

// Exemplo :2
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Olá mundo'),
//       ),
//       // criar um menu lateral o chamado sanduiche
//       drawer: Drawer(),

//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                   declarar das variaveis inicio 
   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$*/

  int count = 0;

  // iniciando as funções da HomePage
  /*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                   declarar as funções inicio 
   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$*/

  void decrement() {
    // este setState e par ainformar que ouve mudança e a tela atualizar assim que tievr etsas mudanças, refazendo a tela
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  // Criando vericação para o valor não ficar negativo e nem muito positivo

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  /*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                   declarar as funções fim
   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$*/

  @override
  Widget build(BuildContext context) {
    print('Build');
    print(isFull);
    return Scaffold(
      // mudar a cor do fundo da tela
      backgroundColor: Colors.red,
      // especificar um corpo para tela, corpo = body
      // Row organiza os filhos na horizontal
      // Column organiza os filhos na vertical
      body: Column(
        // alinhamento no eixo principal da coluna que é o verticalcentralizar os filhos no espaço da
        //coluna inicio d apagina =start, rodape da pagina = end , centro da pagina = center
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // obs sFull e uma variavel que criamos esta na parte de cima do codigo
            isFull ? 'Lotado' : 'Pode entrar!',
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 250, 247, 248),
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            // receebendo o conteudo da variavel,  pode ser feito de 2 formas primeira '$count', segunda count.toString()
            // '0',
            '$count',
            style: TextStyle(
              fontSize: 100,
              color: Color.fromARGB(255, 250, 247, 248),
            ),
          ),
          // criar um Widget linha = row, par areceber os buttom
          // Row organiza os filhos na horizontal
          // Column organiza os filhos na vertical
          // espaço na vertical
          const SizedBox(height: 32),
          Row(
            // alinhar os botõe sno eixo principal da row
            mainAxisAlignment: MainAxisAlignment.center,
            // criando os filhos da row => children: [],
            children: [
              // iniciando a criação do Button o primeirono inicio da progamação o onPressed: onPressed pode ficar onPressed: null, ate definir o click
              TextButton(
                // obs isEmpty e uma variavel que criamos esta na parte de cima do codigo
                onPressed: isEmpty ? null : decrement,
                // Personaliza ro botam com bordas                
                style: TextButton.styleFrom(
                  // se a variavel isEmpty retornar true modificar a cor do botão
                  backgroundColor: isEmpty? Colors.white.withOpacity(0.2): Colors.white,
                  // proximo parametro abaixo nad amais é que o espaçamento do texto padding:
                  // padding: const EdgeInsets.all(32),
                  // podemos trocar o padding por fixedSize
                  fixedSize: const Size(100, 100),
                  // mudar a cor do buttom no click, por padrão e meio azulado
                  // primary: Colors.black, descontinuado não utilizar mais
                  foregroundColor: const Color.fromARGB(255, 138, 1, 131),
                  // definindo o botão quadrado sem bordas aredondadas
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Saiu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              // colocando distancia entre os botões
              const SizedBox(width: 32),
              TextButton(
                onPressed: isFull? null : increment,
                // Personaliza ro botam com bordas
                style: TextButton.styleFrom(
                  // se a variavel isEmpty retornar true modificar a cor do botão
                  backgroundColor: isFull? Colors.white.withOpacity(0.2): Colors.white,
                  // proximo parametro abaixo nad amais é que o espaçamento do texto padding:
                  // padding: const EdgeInsets.all(32),
                  // podemos trocar o padding por fixedSize
                  fixedSize: const Size(100, 100),
                  // mudar a cor do buttom no click, por padrão e meio azulado
                  // primary: Colors.black, descontinuado não utilizar mais
                  foregroundColor: const Color.fromARGB(255, 138, 1, 131),
                  // definindo o botão quadrado sem bordas aredondadas
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    // incluir uma borda no bottão, o width define a lagura da bora
                    side: const BorderSide(
                      color: Color.fromARGB(255, 138, 1, 131),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  'Entrou',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*$&&&&&&&&&&&&&&&&&&&&&&##########################################*/
