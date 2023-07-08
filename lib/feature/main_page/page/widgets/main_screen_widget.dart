import 'package:c_space/feature/main_page/page/widgets/customn_buttom.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {

  MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  String? value;

  late bool isSelected;

  List<String> locationsList = [
    "Maksim Gorkiy",
    "Labzak",
    "Yunusabad",
    "Elbek"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 170,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Image.asset('assets/images/c_space.png'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Добро пожаловать', style: TextStyle(
                fontSize: 32
            ),),
            const SizedBox(
              height: 130,
            ),
            const Text('Выберите свою локацыю', style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    iconSize: 36,
                    borderRadius: BorderRadius.circular(16),
                    underline: const SizedBox(),
                    isExpanded: true,
                    value: value,
                    items: locationsList.map(buildItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                      if(locationsList.contains(value)){
                        setState(() {
                          isSelected = true;
                        });
                      }
                      else{
                        isSelected = false;
                      }
                      print(value);
                    }),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
         value: value),
      ),
    );;
  }
}

DropdownMenuItem<String> buildItem(String item) => DropdownMenuItem(
  value: item,
  child: Center(child: Text(item)),
);
