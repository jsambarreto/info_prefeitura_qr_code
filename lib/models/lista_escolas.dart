import 'package:flutter/material.dart';

import 'escola_model.dart';

class ListViewerEscola {
  ListView listViewFormat(List<Escola> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return tile(
            data[index].escolaResumido,
            data[index].bairro,
            //data[index].serie,
            //data[index].vagas,
          );
        });
  }

  ListTile tile(String title, String subtitle) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 20)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Serie',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      //leading: Icon(iconData),
      //trailing: Icon(Icons.arrow_right),
    );
  }
}
