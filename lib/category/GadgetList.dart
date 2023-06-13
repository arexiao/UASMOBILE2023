import 'package:flutter/material.dart';
import '../HomePage.dart';

class GadgetList extends StatefulWidget {
  const GadgetList({super.key});

  @override
  State<GadgetList> createState() => _GadgetListState();
}

class _GadgetListState extends State<GadgetList> {
  TextEditingController _textEditingController = TextEditingController();

static List<GadgetsList> mainGadgetsList = [
    GadgetsList("Starbucks", "TP 6 Lantai 4", 5.0, "images/sbux.png"),
    GadgetsList("Carnaby", "TP 6 Lantai 3", 5.0, "images/sbux.png"),
    GadgetsList("Excelso", "TP 6 Lantai 4", 5.0, "images/sbux.png"),
    GadgetsList("Zenbu", "TP 6 Lantai 5", 5.0, "images/sbux.png"),
    GadgetsList("Pasar Rame", "TP 6 Lantai 5", 5.0, "images/sbux.png"),
    GadgetsList("Tong Tji", "TP 2 Lantai 3", 5.0, "images/sbux.png"),
    GadgetsList("Marugame Udon", "TP 3 Lantai 5", 5.0, "images/sbux.png"),
    GadgetsList("Yoshinoya", "TP 3 Lantai 5", 5.0, "images/sbux.png"),
    GadgetsList("Fore", "TP 3 Lantai 3", 5.0, "images/sbux.png"),
    GadgetsList("JCO", "TP 1 Lantai 2", 5.0, "images/sbux.png"),
  ];

  List<GadgetsList> displayGadgetList = List.from(mainGadgetsList);

  void updateList(String value) {
    setState(() {
      displayGadgetList = mainGadgetsList.where((element) => 
      element.medicineName!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context,
                      MaterialPageRoute(
                        builder: (context) => HomePage()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        onChanged: (value) => updateList(value),
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Search Here',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: displayGadgetList.length == 0
              ? Center(
                child: Text(
                  "No Result Found",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
              : ListView.builder(
                itemCount: displayGadgetList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(displayGadgetList[index].medicineName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    subtitle: Text(displayGadgetList[index].medicineLoc ?? ""),
                    trailing: Text(
                        "${displayGadgetList[index].medicineRate ?? ""} / 5.0"),
                    leading: Image.asset(displayGadgetList[index].medicineImage ?? ""),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GadgetsList{
  String? medicineName;
  String? medicineLoc;
  double? medicineRate;
  String? medicineImage;

  GadgetsList(this.medicineName, this.medicineLoc, this.medicineRate, this.medicineImage);
}