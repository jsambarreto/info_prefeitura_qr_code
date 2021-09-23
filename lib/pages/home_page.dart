import 'package:flutter/material.dart';

import 'package:info_prefeitura_qr_code/widgets/app_logo.dart';

import '/models/escola_model.dart';
import '/utils/api.dart';

class HomePage extends StatefulWidget {
  final String? id;
  final String? dsSecretaria;
  const HomePage({
    Key? key,
    required this.id,
    required this.dsSecretaria,
  }) : super(key: key);

  //const HomePage();
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget futureWidget() {
    return FutureBuilder<Escola>(
      future: loadEscola(
        dsSecretar: widget.dsSecretaria as String,
        id: widget.id as String,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Card(
                    //shape: ShapeBorder.,
                    color: const Color(0xFF2C2F4D),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data!.escolaResumido,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Diretor(a): ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                snapshot.data?.diretor ?? ' ',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.phone_iphone_outlined,
                    ),
                    Text(
                      snapshot.data!.telefone,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                    ),
                    Text(
                      snapshot.data!.endereco,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                    ),
                    Text(
                      snapshot.data!.email,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'VAGAS DISPONÍVEIS: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...snapshot.data!.series.map(
                      (s) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(s.serie),
                          const Text(
                            'VAGAS',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(s.vagas),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: appLogo),
        ),
        body: futureWidget(),
      ),
    );
  }
}
