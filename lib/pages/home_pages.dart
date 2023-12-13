import 'package:ecommerce_app/model/categoriesList.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/products_model.dart';
import 'package:ecommerce_app/services/product_serv.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: ProductServ().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                dynamic temp = snapshot.data;

                List<dynamic> myProducts = temp;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Hello',
                        style: TextStyle(
                          color: Color(0xFF1D1E20),
                          fontSize: 28,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.04,
                        ),
                      ),
                    ),
                    const Text(
                      'Welcome to Laza.',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF5F6FA),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),

                    // const Text(
                    //   'Choose Brand',
                    //   style: TextStyle(
                    //     color: Color(0xFF1D1E20),
                    //     fontSize: 17,
                    //     fontFamily: 'Inter',
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 115,
                              height: 50,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF5F6FA),
                                // color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: const TextStyle(
                                    color: Color(0xFF1D1E20),
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'New Arraival',
                        style: TextStyle(
                          color: Color(0xFF1D1E20),
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 253,
                          crossAxisSpacing: 20,
                          childAspectRatio: 4 / 2,
                          mainAxisSpacing: 40,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              children: [
                                const SizedBox(
                                  width: 117,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Nike Sportswear Club Fleece',
                                      style: TextStyle(
                                        color: Color(0xFF1D1E20),
                                        fontSize: 11,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  '\$99',
                                  style: TextStyle(
                                    color: Color(0xFF1D1E20),
                                    fontSize: 13,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: Text("error"),
                );
              }
            }),
      ),
    );
  }
}
