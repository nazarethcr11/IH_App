import 'package:flutter/material.dart';
import 'package:inclusive_hue/components/my_slider.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:provider/provider.dart';
import '../components/my_toggle_button.dart';
import '../main.dart';

class HomePageInside extends StatefulWidget {
  const HomePageInside({Key? key}) : super(key: key);

  @override
  State<HomePageInside> createState() => _HomePageInsideState();
}

class _HomePageInsideState extends State<HomePageInside> {
  @override
  Widget build(BuildContext context) {
    final colorFilterProvider = Provider.of<ColorFilterProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyToggleButton(
              leftLabel: 'Apagado',
              rightLabel: 'Encendido',
              isToggled: colorFilterProvider.isToggled,
              onChanged: (value) async {
                colorFilterProvider.updateColorFilter(
                  toggled: value,
                  adjustment: colorFilterProvider.colorAdjustment,
                  severityValue: colorFilterProvider.severity,
                  type: colorFilterProvider.colorType,
                );
                if (value) {
                  if (!await FlutterOverlayWindow.isPermissionGranted()) {
                    await FlutterOverlayWindow.requestPermission();
                  }
                  FlutterOverlayWindow.showOverlay(
                    alignment: OverlayAlignment.center,
                    height: 300,
                    width: 300,
                    overlayContent: 'ColorFilter:${colorFilterProvider
                        .colorType}:${colorFilterProvider.severity}',
                  );
                } else {
                  FlutterOverlayWindow.closeOverlay();
                }
              },
            ),
            SizedBox(height: 20),
            MySlider(
              initialValue: colorFilterProvider.colorAdjustment,
              title: 'Ajuste de color',
              onChanged: (value) {
                colorFilterProvider.updateColorFilter(
                  toggled: colorFilterProvider.isToggled,
                  adjustment: value,
                  severityValue: colorFilterProvider.severity,
                  type: colorFilterProvider.colorType,
                );
              },
            ),
            SizedBox(height: 20),
            MySlider(
              initialValue: colorFilterProvider.severity,
              title: 'Intensidad',
              onChanged: (value) {
                colorFilterProvider.updateColorFilter(
                  toggled: colorFilterProvider.isToggled,
                  adjustment: colorFilterProvider.colorAdjustment,
                  severityValue: value,
                  type: colorFilterProvider.colorType,
                );
              },
            ),
            SizedBox(height: 20),
            // Dropdown to select color type
            DropdownButton<String>(
              value: colorFilterProvider.colorType,
              onChanged: (String? newValue) {
                colorFilterProvider.updateColorFilter(
                  toggled: colorFilterProvider.isToggled,
                  adjustment: colorFilterProvider.colorAdjustment,
                  severityValue: colorFilterProvider.severity,
                  type: newValue!,
                );
              },
              items: <String>['PROTANOMALY', 'DEUTERANOMALY', 'TRITANOMALY', 'MONOCHROMACY']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Preview image with color adjustment
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('lib/images/default/preview.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_red_eye_outlined, color: Theme
                    .of(context)
                    .colorScheme
                    .primary),
                SizedBox(width: 5),
                Text('Vista previa'),
              ],
            ),
          ],
        ),
      ),
    );
  }

}