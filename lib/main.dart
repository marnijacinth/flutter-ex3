import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class Place {
  String name;
  double ticket_price;
  int no_of_hours;
  Place({required this.name, required this.ticket_price, required this.no_of_hours});
}


class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<Place> placelist = [
    Place(name: "Taj Mahal", ticket_price: 400, no_of_hours: 15),
    Place(name: "Agra Fort", ticket_price: 500, no_of_hours: 12),
    Place(name: "Red Fort", ticket_price: 370, no_of_hours: 9),
    Place(name: "Qutub Minar", ticket_price: 450, no_of_hours: 15),
    Place(name: "Fatehpur Sikri", ticket_price: 200, no_of_hours: 8),
    Place(name: "India Gate", ticket_price: 20, no_of_hours: 24),
  ];






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dynamic ListView",
      home: Scaffold(
        appBar: AppBar(title: Text('Ministry Of Tourism'),backgroundColor: const Color.fromARGB(255, 12, 223, 167),),
        body: ListView.builder(
          itemCount: placelist.length,
          itemBuilder: (context, index) {
            final place = placelist[index];
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(place.name[0]),
                  ),
                  title: Text(place.name),
                  subtitle: Text(
                    "Ticket Price: Rs.${place.ticket_price}\nTime opened: ${place.no_of_hours} hrs"
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 7, 225, 222),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context)=> AlertDialog(
                          title: Text('Entry Log'),
                          content: Text("Your entry at ${place.name} is saved."),
                          actions: [
                            TextButton (
                            onPressed: ()=>Navigator.pop(context),
                            child: Text('OK'))
                          ],
                        )
                      );
                    },
                    child: Text('Record your Journey')),
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${place.name} is visited."),
                          duration: Duration(seconds: 1),
                          )
                      );
                    },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
