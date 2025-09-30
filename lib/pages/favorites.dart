import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:placeme/Provider/favorite_provider.dart';
// import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final favoriteItems = provider.favorites;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Favorites",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              favoriteItems.isEmpty
                  ? Text(
                      "No Favorites yet, Add now!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: GridView.builder(
                        itemCount: favoriteItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          String favorite = favoriteItems[index];
                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection("myAppCpollection")
                                .doc(favorite)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (!snapshot.hasData || snapshot.data == null) {
                                return Center(child: Text("Error Loading"));
                              }
                              var favoriteItems = snapshot.data!;


                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            favoriteItems['image'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF20B2AA),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          favoriteItems['title'],
                                          style: TextStyle(
                                            color: Color(0xFFF5F5DC),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          'Owner: ${favoriteItems['vendor']}',
                                          style: TextStyle(
                                            color: Color(0xFFF5F5DC),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                              // return Stack(
                              //   children: [
                              //     Container(
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(15),
                              //         image: DecorationImage(
                              //           fit: BoxFit.cover,
                              //           image: NetworkImage(
                              //             favoriteItems['image'],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     // const Positioned(
                              //     //   top: 8,
                              //     //   right: 8,
                              //     //   child: Icon(
                              //     //     Icons.favorite,
                              //     //     color: Colors.red,
                              //     //   ),
                              //     // ),
                              //     Positioned(
                              //       bottom: 8,
                              //       left: 8,
                              //       right: 8,
                              //       child: Container(
                              //         color: Color(0xFF20B2AA),
                              //         padding: EdgeInsets.all(4),
                              //         child: Text(
                              //           favoriteItems['title'],
                              //           style: TextStyle(
                              //             color: Color(0xFFF5F5DC),
                              //             fontWeight: FontWeight.bold,
                              //           ),
                              //           overflow: TextOverflow.ellipsis,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // );
                            },
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
