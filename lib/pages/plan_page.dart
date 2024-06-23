import 'package:flutter/material.dart';
import 'package:inclusive_hue/components/my_button.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PLANES',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme
                .of(context)
                .colorScheme
                .primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme
          .of(context)
          .colorScheme
          .surface,
      ),
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .primary,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'GRATUITO',
                      style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$0',
                      style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                      ),
                    ),
                    SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: Theme
                              .of(context)
                              .colorScheme
                              .primary),
                          SizedBox(width: 7),
                          Text(
                            'Characteristic 1',
                            style: TextStyle(
                            fontSize: 16.0,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check, color: Theme
                            .of(context)
                            .colorScheme
                            .primary,),
                        SizedBox(width: 5),
                        Text(
                          'Characteristic 2',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: MyButton(
                        onTap: () {
                          // Acción a realizar cuando se presiona el botón
                        },
                        text: 'EMPIEZA',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Theme
                  .of(context)
                  .colorScheme
                  .secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'PREMIUM',
                          style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                          ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\$10',
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: Colors.blue[900]),
                          SizedBox(width: 10),
                          Text(
                            'Characteristic 1',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: Colors.blue[900]),
                          SizedBox(width: 10),
                          Text(
                            'Characteristic 2',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: Colors.blue[900]),
                          SizedBox(width: 10),
                          Text(
                            'Characteristic 3',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: Colors.blue[900]),
                          SizedBox(width: 10),
                          Text(
                            'Characteristic 4',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: MyButton(
                          onTap: () {

                          },
                          text: 'EMPIEZA',
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        )
      ),
    );
  }
}