import 'package:flutter/material.dart';
import '../HomePage.dart';

class MedicineList extends StatefulWidget {
  const MedicineList({super.key});

  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  TextEditingController _textEditingController = TextEditingController();

static List<MedicinesList> mainMedicinesList = [
    MedicinesList("Starbucks", "TP 6 Lantai 4", 5.0, "images/sbux.png"),
    MedicinesList("Carnaby", "TP 6 Lantai 3", 5.0, "images/sbux.png"),
    MedicinesList("Excelso", "TP 6 Lantai 4", 5.0, "images/sbux.png"),
    MedicinesList("Zenbu", "TP 6 Lantai 5", 5.0, "images/sbux.png"),
    MedicinesList("Pasar Rame", "TP 6 Lantai 5", 5.0, "images/sbux.png"),
    MedicinesList("Tong Tji", "TP 2 Lantai 3", 5.0, "images/sbux.png"),
    MedicinesList("Marugame Udon", "TP 3 Lantai 5", 5.0, "images/sbux.png"),
    MedicinesList("Yoshinoya", "TP 3 Lantai 5", 5.0, "images/sbux.png"),
    MedicinesList("Fore", "TP 3 Lantai 3", 5.0, "images/sbux.png"),
    MedicinesList("JCO", "TP 1 Lantai 2", 5.0, "images/sbux.png"),
  ];

  List<MedicinesList> displayMedicineList = List.from(mainMedicinesList);

  void updateList(String value) {
    setState(() {
      displayMedicineList = mainMedicinesList.where((element) => 
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
              child: displayMedicineList.length == 0
              ? Center(
                child: Text(
                  "No Result Found",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
              : ListView.builder(
                itemCount: displayMedicineList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(displayMedicineList[index].medicineName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    subtitle: Text(displayMedicineList[index].medicineLoc ?? ""),
                    trailing: Text(
                        "${displayMedicineList[index].medicineRate ?? ""} / 5.0"),
                    leading: Image.asset(displayMedicineList[index].medicineImage ?? ""),
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

class MedicinesList{
  String? medicineName;
  String? medicineLoc;
  double? medicineRate;
  String? medicineImage;

  MedicinesList(this.medicineName, this.medicineLoc, this.medicineRate, this.medicineImage);
}