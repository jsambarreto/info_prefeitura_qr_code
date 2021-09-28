import 'package:flutter/material.dart';
import 'package:info_prefeitura_qr_code/models/saude_model.dart';
import 'package:info_prefeitura_qr_code/utils/api_arq.dart';

import 'package:info_prefeitura_qr_code/widgets/app_logo.dart';
import 'package:info_prefeitura_qr_code/widgets/series_widget.dart';
import 'package:info_prefeitura_qr_code/widgets/servicos_wiget.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.dsSecretaria == 'escolas')
            FutureBuilder<Escola>(
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
                            margin: EdgeInsets.only(bottom: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
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
                            const SizedBox(width: 10),
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
                            const SizedBox(width: 10),
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
                            const SizedBox(width: 10),
                            Text(
                              snapshot.data!.email,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SeriesWidget(servicos: snapshot.data!.series),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("Texto da api ${snapshot.error}");
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          if (widget.dsSecretaria == 'saude')
            FutureBuilder<UnidadeSaude>(
              future: carregaUnidade(
                id: widget.id,
                dsSecretaria: widget.dsSecretaria,
              ),
              //loadUnidadeSaude(
              //  dsSecretar: widget.dsSecretaria as String,
              // id: widget.id as String,
              //),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Card(
                              margin: EdgeInsets.only(bottom: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: const Color(0xFFF8992D),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Diretor(a): ',
                                          style: TextStyle(
                                            fontSize: 12,
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
                              const SizedBox(width: 10),
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
                              const SizedBox(width: 10),
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
                              const SizedBox(width: 10),
                              Text(
                                snapshot.data!.email,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          ServicosWidget(servicos: snapshot.data!.servicos),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("Texto da api  ${snapshot.error}");
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
        ],
      ),
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
