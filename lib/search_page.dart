import 'package:flutter/material.dart';
import 'package:my_furniture_app/models/product.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        // The search area here
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
              // onChanged: searchBook;
            ),
          ),
        ),
      ),
      body: ElevatedCard(),
    );
  }
}

// ignore: must_be_immutable
class ElevatedCard extends StatelessWidget {
  ElevatedCard({Key? key}) : super(key: key);
  // List<Product> product1 = product;
  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return Padding(
    //   padding: const EdgeInsets.all(12.0),
    //   child: ListView.builder(
    //     itemCount: product.length,
    //     itemBuilder: (context, index) => Card(
    //       color: Colors.white,
    //       child: SizedBox(
    //         // height: MediaQuery.of(context).size.height / 3.2,
    //         child: Column(
    //           children: [
    //             Row(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(12.0),
    //                   child: SizedBox(
    //                     height: 50,
    //                     width: 50,
    //                     child: ClipRect(
    //                       child: Image.asset('assets/woodland_icon.png'),
    //                       // child: product[index].image,
    //                     ),
    //                   ),
    //                 ),
    //                 Column(
    //                   children: const [
    //                     Text(
    //                       'Woody Land',
    //                       style: TextStyle(
    //                           fontSize: 18, fontWeight: FontWeight.w500),
    //                     ),
    //                     Text(
    //                       'Just Now',
    //                       style: TextStyle(color: Colors.grey),
    //                     ),
    //                   ],
    //                 )
    //               ],
    //             ),
    //             const Text('We hope to surprise you!!'),
    //             SizedBox(
    //               height: 100,
    //               width: 150,
    //               child: product[index].image,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 children: const [
    //                   Text(
    //                     '    457 views',
    //                     style: TextStyle(color: Colors.grey),
    //                   ),
    //                   Expanded(
    //
    //                     child: Divider(
    //                       thickness: 1,
    //                       indent: 15,
    //                       endIndent: 15,
    //                       color: Colors.grey,
    //                     ),
    //                   ),
    //                   CircleAvatar(
    //                     radius: 18,
    //                     child: Icon(
    //                       Icons.favorite_border,
    //                       color: Colors.red,
    //                       size: 15,
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  // void searchBook(String query) {
  //   final suggestions = product1.where((product) {
  //     final productTitle = product.title.toLowerCase();
  //     final input = query.toLowerCase();
  //     return productTitle.contains(input);
  //   }).toList();
  //   setState() {
  //     product = suggestions;
  //   }
  // }
}
