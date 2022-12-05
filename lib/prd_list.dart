import 'package:flutter/material.dart';
import 'prd_details.dart';

import 'prd_details_strcu.dart';
import 'form.dart';

class PrdListScreen extends StatelessWidget {
  PrdListScreen({Key? key}) : super(key: key);

  final List<PrdDetailStruc> _prdList = [
    PrdDetailStruc(
        title: 'Ball',
        price: 10,
        image: "dash.png",
        desc: "Ball nothing great nothing great 1",
        condition: "good"),
    PrdDetailStruc(
        title: 'Chair',
        price: 20,
        image: "dash.png",
        desc: "nothing gret nothing great 2",
        condition: "good"),
    PrdDetailStruc(
        title: 'Bat',
        price: 30,
        image: "dash.png",
        desc: "nothing gret nothing great 3",
        condition: "good"),
    PrdDetailStruc(
        title: 'Ball',
        price: 40,
        image: "dash.png",
        desc: "Ball nothing great nothing great 4",
        condition: "good"),
    PrdDetailStruc(
        title: 'Chair',
        price: 50,
        image: "dash.png",
        desc: "nothing gret nothing great 5",
        condition: "good"),
    PrdDetailStruc(
        title: 'Ball',
        price: 60,
        image: "dash.png",
        desc: "Ball nothing great nothing great 6",
        condition: "good"),
    PrdDetailStruc(
        title: 'Chair',
        price: 70,
        image: "dash.png",
        desc: "nothing gret nothing great 7",
        condition: "good"),
    PrdDetailStruc(
        title: 'Ball',
        price: 80,
        image: "dash.png",
        desc: "Ball nothing great nothing great 8",
        condition: "good"),
    PrdDetailStruc(
        title: 'Chair',
        price: 90,
        image: "dash.png",
        desc: "nothing gret nothing great 9",
        condition: "good"),
    PrdDetailStruc(
        title: 'Ball',
        price: 10,
        image: "dash.png",
        desc: "Ball nothing great nothing great 10",
        condition: "good"),
    PrdDetailStruc(
        title: 'Chair',
        price: 20,
        image: "dash.png",
        desc: "nothing gret nothing great 11",
        condition: "good"),
    PrdDetailStruc(
        title: 'Ball',
        price: 10,
        image: "dash.png",
        desc: "Ball nothing great nothing great 12",
        condition: "good"),
    PrdDetailStruc(
        title: 'Chair',
        price: 20,
        image: "dash.png",
        desc: "nothing gret nothing great 13",
        condition: "good"),
    PrdDetailStruc(
        title: 'Ball',
        price: 10,
        image: "dash.png",
        desc: "Ball nothing great nothing great 14",
        condition: "good"),
    PrdDetailStruc(
        title: 'Chair',
        price: 20,
        image: "dash.png",
        desc: "nothing gret nothing great 15",
        condition: "good"),
    PrdDetailStruc(
        title: 'Ball',
        price: 10,
        image: "dash.png",
        desc: "Ball nothing great nothing great 16",
        condition: "good"),
    PrdDetailStruc(
        title: 'Chair',
        price: 20,
        image: "dash.png",
        desc: "nothing gret nothing great 17",
        condition: "good"),
    PrdDetailStruc(
        title: 'Ball',
        price: 10,
        image: "dash.png",
        desc: "Ball nothing great nothing great 18",
        condition: "good"),
    PrdDetailStruc(
        title: 'Chair',
        price: 20,
        image: "dash.png",
        desc: "nothing gret nothing great 19",
        condition: "good"),
    PrdDetailStruc(
        title: 'Ball',
        price: 10,
        image: "dash.png",
        desc: "Ball nothing great nothing great 20",
        condition: "bad"),
    PrdDetailStruc(
        title: 'Chair',
        price: 20,
        image: "dash.png",
        desc: "nothing gret nothing great 21",
        condition: "worse"),
  ];

  String dollar_symbol = "\$ ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Shop!!!!"),
      ),
      body: ListView.builder(
          itemCount: _prdList.length,
          itemBuilder: (context, index) {
            final note = _prdList[index];
            // ignore: unused_local_variable
            var itemPrice = dollar_symbol + _prdList[index].price.toString();
            return ListTile(
              minVerticalPadding: 24,
              leading: Hero(
                tag: note.image,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: Image.asset('assets/${note.image}').image,
                ),
              ),
              title: Text(
                _prdList[index].title,
              ),
              trailing: Text(itemPrice),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PrdDetailsScreen(prdDetail: _prdList[index]),
                  ),
                );
              },
              
            );
            // SizedBox(width: 50);// give it width

            

          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed  navigates to form screen(form.dart page)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
