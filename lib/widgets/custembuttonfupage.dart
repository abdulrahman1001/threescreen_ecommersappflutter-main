import 'package:flutter/material.dart';
import 'package:rakaya_challange/widgets/matriyalbuttonfirstpage.dart';
// Ensure this import points to the correct file

class MaterialButtonFirstPage extends StatelessWidget {
  const MaterialButtonFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      MaterialButton(color: Colors.orange[900],onPressed: (){
         _showDrawer(context,'price sort','A-Z sort');
      },child: Text('Sort')),
        Spacer(
          flex: 1,
        ),
      
        Spacer(
          flex: 1,
        ),
        IconButton(
            iconSize: 30,
            color: Colors.black,
            onPressed: () {
              _showDrawer(context,'kitchen','room');
            },
            icon: (Icon(Icons.menu))),
      ],
    );
  }
}

void _showDrawer(BuildContext context,String name,name2) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Adjust the height as needed
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text(name),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text(name2),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      });
}
