import 'package:flutter/material.dart';

class AddDropForProffessorAdvisor extends StatefulWidget {
  @override
  _AddDropForProffessorAdvisorState createState() => _AddDropForProffessorAdvisorState();
}

class _AddDropForProffessorAdvisorState extends State<AddDropForProffessorAdvisor> {
  List<Proffessor> _Proffessor = [
    Proffessor(
      name: 'Ahmed husseiny',
      email: 'ahmedh@gmail.com',
    ),
    Proffessor(
      name: ' Gasser Tamer',
      email: 'Gassert@gmail.com',
    ),
    Proffessor(
      name: 'Zeyad Mohamed',
      email: 'Zeyadm@gmail.com',
    ),
    Proffessor(name: 'Ahmed Zake', email: 'AhmedZ@gmail.com', ),
    Proffessor(name: 'Amr Youssef', email: 'AmrY@gmail.com', ),
    Proffessor(name: 'Zeyad Zien', email: 'Zeyadz@gmail.com', ),
    Proffessor(name: 'Farah', email: 'Farah@gmail.com'),
    Proffessor(name: 'Hadeer', email: 'Hadeer@gmail.com'),
    Proffessor(name: 'Amr Ahmed', email: 'Amra@gmail.com', ),
  ];

  List<Proffessor> _cart = [];

  void _addToCart( Proffessor proffessor ) {
    setState(() {
      _cart.add(proffessor);
    });
  }

  void _removeFromCart(Proffessor proffessor) {
    setState(() {
      _cart.remove(proffessor);
    });
  }

  bool _isInCart(Proffessor proffessor) {
    return _cart.contains(proffessor);
  }

  Widget _buildRowCourses(Proffessor proffessor) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2.0,
                end: 2.0,
              ),
              child: IconButton(
                icon: Icon(Icons.add),

                onPressed: () {
                  _addToCart(proffessor);
                },
              ),
            )
          ],
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                proffessor.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                proffessor.email,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBox() {
    return SizedBox(
      height: 15.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Proffessors"),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.person),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '${_cart.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ProffessorShoppingCart(
                    proffessor : _cart,
                    onRemoveFromCart: _removeFromCart,
                    onSave: () {  },



                  );
                },
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: _Proffessor
                .map((proffessor) => Column(
              children: [
                _buildRowCourses(proffessor),
                _buildBox(),
              ],
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class Proffessor {
  final String name;
  final String email;

  Proffessor({
    required this.name,
    required this.email,

  });
}
class ProffessorShoppingCart extends StatelessWidget {

  final List<Proffessor> proffessor;
  final Function(Proffessor) onRemoveFromCart;
  final VoidCallback onSave;

  ProffessorShoppingCart({
    required this.proffessor,
    required this.onRemoveFromCart,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Professors',
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: onSave,
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            if (proffessor.isEmpty)
              Text('No Professors added to cart.')
            else
              Column(
                children: proffessor
                    .map((proffessor) => ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      onRemoveFromCart(proffessor);
                    },
                  ),
                  title: Text(proffessor.name),
                  subtitle: Text(proffessor.email),

                ))
                    .toList(),
              ),


            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
