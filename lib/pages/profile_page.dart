import 'package:flutter/material.dart';
import 'package:inclusive_hue/components/my_list_tile.dart';
import 'package:inclusive_hue/pages/change_colorblindtype_page.dart';
import 'package:inclusive_hue/pages/plan_page.dart';
import 'package:inclusive_hue/pages/theme_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(15),
                  //shadow
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                      radius: 50,
                      backgroundImage: AssetImage('lib/images/default/profile.webp'), // Reemplaza con la ruta de tu imagen
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: const Icon(
                                  Icons.edit, color: Colors.white, size: 20
                              ),
                          ),
                          onTap: (){},
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Nombre de Usuario',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'user_example@gmail.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    ],
                  ),
              ),
              ),
            SizedBox(height: 20),
            MyListTile(
                icon_leading: Icons.edit,
                title: 'Editar Perfil',
                onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder:(context)=> ThemePage(),));
                },
                iconColor: Theme.of(context).colorScheme.primary,
            ),
            MyListTile(
                icon_leading: Icons.colorize,
                title: 'Cambiar Daltonismo',
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> ChangeColorblindtypePage(),));
                },
                iconColor: Theme.of(context).colorScheme.primary,
            ),
            MyListTile(
                icon_leading: Icons.palette,
                title: 'Temas',
                onTap: ()=> Navigator.push(context,MaterialPageRoute(builder:(context)=> ThemePage(),)),
                iconColor: Theme.of(context).colorScheme.primary,
            ),
            MyListTile(
                icon_leading: Icons.subscriptions,
                title: 'Planes',
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> PlanPage(),));
                },
                iconColor: Theme.of(context).colorScheme.primary,
            ),
            MyListTile(
                icon_leading: Icons.logout,
                title: 'Cerrar Sesión',
                onTap: (){
                  //por ahora solo cierra la página
                  Navigator.pop(context);
                },
                iconColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}