import 'package:data_trend/home.dart';
import 'package:data_trend/tell_with_us.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'contacts.dart';

class ProductWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Product(),
      theme: ThemeData(primarySwatch: Colors.blueGrey)
    );
  }
}

class Product extends StatefulWidget{
  @override
  State<Product> createState() {
    return ProductState();
  }
}

class ProductState extends State<Product>{
  int _currentIndex=0;

  List cardList=[
    Item1(),
    Item2(),
    Item3(),
    Item4()
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Data Trend Consultoria'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                    child: const Text('Sobre'),
                    onTap: () => _sobre(context),
                  ),
                ];
              })
          ],
      ),
      body: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 695.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: cardList.map((card){
                return Builder(
                  builder:(BuildContext context){
                    return Container(
                      height: MediaQuery.of(context).size.height*0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.blueAccent,
                        child: card,
                      ),
                    );
                  }
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text('DATA TREND\n\nA parceria que você precisa!'),
            ),
            ListTile(
              title: const Text('Página inicial'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeWidget()),
                );
              },
            ),
            ListTile(
              title: const Text('Produtos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Mensagens Recebidas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactsWidget()),
                );
              },
            ),
            ListTile(
              title: const Text('Fale conosco'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TellWithUsWidget()),
                );
              },
            ),
          ],
        ),
      ),
    );
  } 

    Future<void> _sobre(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text(
            'Desenvolvido por:\n'
            'Hebert Alves, professor de Desenvolvimento '
            'Mobile da turma de 2023-1\n\n'
            'Nesta tela você entende um pouco sobre os '
            'produtos oferecidos pela empresa Data Trend.'
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}

class Item1 extends StatelessWidget {
  // const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/data-science.jpg'
          ),
          Text(
            "\nANÁLISE E EXPLORAÇÃO DOS DADOS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "\nSeus dados podem esconder informações valiosas se forem analisados da maneira correta, através de modelos matematicos e estatísticos podemos lhe dizer o que eles estão ocultando para que possa utilizá-los a seu favor",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  // const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Color(0xff5f2c82), Color(0xff49a09d)]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/integracao.png'
          ),
          Text(
            "\nINTEGRAÇÃO DE DADOS ENTRE SISTEMAS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "\nIntegramos seus sistemas por meio de ferramentas apropriadas para que toda a comunicação entre eles ocorra de forma confiável, rápida e sem nenhuma intervenção humana",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  // const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/external-data.png'
          ),
          Text(
            "\nAGREGAÇÃO DE DADOS EXTERNOS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "\nPor meio de ferramentas de captura de dados podemos reunir informações do mundo externo ao seu negócio para que seus dados tenham mais valor, o comportamento do seu cliente nem sempre pode ser descrito somente com os dados que você conhece sobre ele",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  // const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/flutter-logo.png'
          ),
          Text(
            "\nDESENVOLVIMENTO MOBILE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "\nPrecisa de um novo App para encantar seus clientes? Podemos te ajudar com toda a consultoria do design e usabilidade até a criação e publicação",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}