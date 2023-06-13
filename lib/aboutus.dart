import 'package:flutter/material.dart';

class aboutus extends StatefulWidget {
  const aboutus({Key? key}) : super(key: key);
  @override
  State<aboutus> createState() => _aboutusState();
}

class _aboutusState extends State<aboutus>{
  int _selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [    
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('NavUs',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 25,
              ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ˌnav:əs',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(                
                child: Text(
                  '“NavUs” Merupakan singkatan dari Navigate dan Us dimana “Navigate” menunjukkan tujuan dibentuknya aplikasi, yakni untuk memberi arahan pengguna agar tidak tersesat. Sedangkan “Us”, menunjukkan Kerjasama antara aplikasi dan pengguna untuk menjadi lebih baik. Dibimbing oleh Bu Purbandini, kami berharap aplikasi yang kami bangun mampu membantu pengguna dalam menemukan destinasinya di Mall Tunjungan Plaza, Surabaya. \n\n Didirikan oleh : \n\n 082111633014 Aretha Seno Putri \n 082111633016 Adisha Putri Az Zahra \n 082111633062 M. Farid Fatchur Rohmad',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  '© NavUs v.0.0.2',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}