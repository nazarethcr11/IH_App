import 'package:flutter/material.dart';
import 'package:inclusive_hue/components/my_button.dart';
import 'package:inclusive_hue/components/my_dropdown_button.dart';

class ChangeColorblindtypePage extends StatefulWidget {
  const ChangeColorblindtypePage({Key? key}) : super(key: key);

  @override
  State<ChangeColorblindtypePage> createState() => _ChangeColorblindtypePageState();
}

class _ChangeColorblindtypePageState extends State<ChangeColorblindtypePage> {
  String valueChoose = 'Acromatopsia';
  String? subValueChoose;
  final List<String> listItem = [
    'Acromatopsia',
    'Dicromatopsia',
    'Tricromatopsia Anómala',
  ];
  final List<String> listItemDicromacy = [
    'Protanopia',
    'Deuteranopia',
    'Tritanopia',
  ];
  final List<String> listItemAnomalousTrichromacy = [
    'Protanomalia',
    'Deuteranomalia',
    'Tritanomalia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar Tipo de Daltonismo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  MyDropdownButton(
                    hintText: 'Seleccionar Tipo de Daltonismo',
                    items: listItem,
                    selectedValue: valueChoose,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueChoose = newValue!;
                        subValueChoose = null; // Reinicia el submenú cuando se selecciona una nueva opción principal
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  if (valueChoose == 'Dicromatopsia')
                    MyDropdownButton(
                      hintText: 'Seleccionar Tipo de Dicromatopsia',
                      items: listItemDicromacy,
                      selectedValue: subValueChoose,
                      onChanged: (String? newValue) {
                        setState(() {
                          subValueChoose = newValue!;
                        });
                      },
                    ),
                  if (valueChoose == 'Tricromatopsia Anómala')
                    MyDropdownButton(
                      hintText: 'Seleccionar Tipo de Tricromatopsia',
                      items: listItemAnomalousTrichromacy,
                      selectedValue: subValueChoose,
                      onChanged: (String? newValue) {
                        setState(() {
                          subValueChoose = newValue!;
                        });
                      },
                    ),
                ],
              ),
            ),
            Column(
              children: [
                MyButton(
                  text: 'Guardar',
                  onTap: () {
                    // Código para guardar la selección
                  },
                ),
                SizedBox(height: 10),
                MyButton(
                  text: 'Cancelar',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}