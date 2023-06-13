import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    void _home() {
      Navigator.pushNamed(context, 'nav');
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tumpukan foto dan Container Nama Toko
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/sbux.png"))),
                ),
                Positioned(
                    top: 16,
                    left: 16,
                    child: GestureDetector(
                      child: Container(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                      onTap: _home,
                    )
                ),
                Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      child: Icon(
                        Icons.assistant_direction,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )),
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Starbucks",
                        style: GoogleFonts.montserrat(
                            fontSize: 18, 
                            fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    height: height * .07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(163, 29, 123, 6),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))))
              ],
            ),
            // Row rating dan jam buka
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("4.6 (32 review)",
                          style: GoogleFonts.montserrat(fontSize: 12))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("10.00 - 21.00 wib",
                          style: GoogleFonts.montserrat(fontSize: 12))
                    ],
                  )
                ],
              ),
            ),

            // Card promo
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Card(
            //     color: Colors.amber[100],
            //     child: Padding(
            //       padding: const EdgeInsets.all(16),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Column(
            //             children: [
            //               Text(
            //                 "Ada promo untuk kamu",
            //                 style: GoogleFonts.montserrat(fontSize: 12),
            //               ),
            //               Text("Dapatkan diskon 100 ribu",
            //                   style: GoogleFonts.montserrat(fontSize: 11)),
            //             ],
            //           ),
            //           ElevatedButton(onPressed: () {}, child: Text("Tukar"))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            // Lokasi
            TitleDetail(
                title: "Lokasi",
                detail:
                    "TP 4 Lantai 1"),

            // Deskripsi
            TitleDetail(
                title: "Deskripsi",
                detail:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

            // Title Ulasan / Comment

            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Ulasan",
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),

            // Widget Ulasan / Comment
            Comment(),

            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: ElevatedButton(
            //     onPressed: () {  }, 
            //     child: Colors.tealAccent,

            //   )
            //   ),
          ],
        )),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/media/FrvAcmtaAAAVOCa?format=jpg&name=medium"
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Park Jisung",
                      style: GoogleFonts.montserrat(fontSize: 12)),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber)
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              style: GoogleFonts.montserrat(fontSize: 12),
              " is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ")
        ],
      ),
    );
  }
}

class TitleDetail extends StatelessWidget {
  final String title;
  final String detail;
  const TitleDetail({Key? key, required this.title, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(detail, style: GoogleFonts.montserrat(fontSize: 12))
        ],
      ),
    );
  }
}