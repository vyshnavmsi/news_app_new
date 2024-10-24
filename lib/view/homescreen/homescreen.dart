import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_new/controller/homescreen_controller.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<HomescreenController>().getdata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watchprovider = context.watch<HomescreenController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('News Today'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: watchprovider.isloading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // CarouselSlider.builder(
                //   options: CarouselOptions(
                //       height: 230,
                //       autoPlay: true,
                //       autoPlayInterval: Duration(seconds: 3),
                //       autoPlayAnimationDuration: Duration(milliseconds: 800),
                //       autoPlayCurve: Curves.fastOutSlowIn,
                //       scrollDirection: Axis.horizontal,
                //       viewportFraction: 1),
                //   itemCount:news,
                //   itemBuilder:
                //       (BuildContext context, int itemIndex, int pageViewIndex) {
                //     final article =
                //         HomescreenController().newsarticle[itemIndex];
                //     return Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Container(
                //         height: double.infinity,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           boxShadow: const [
                //             BoxShadow(
                //               color: Colors.black26,
                //               blurRadius: 10,
                //               offset: Offset(0, 4),
                //             ),
                //           ],
                //         ),
                //         child: ClipRRect(
                //           borderRadius: BorderRadius.circular(20),
                //           child: Stack(
                //             children: [
                //               Image.network(article.urlToImage,
                //                   fit: BoxFit.cover,
                //                   width: double.infinity,
                //                   height: 2),
                //               Positioned(
                //                 child: Container(
                //                   height: 400,
                //                   color: Colors.black.withOpacity(0.5),
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(10),
                //                     child: SizedBox(
                //                       height: 120,
                //                       child: Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.end,
                //                         children: [
                //                           Text(
                //                             article.author ?? "Unknown Author",
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.w500,
                //                               color: Colors.white,
                //                               fontSize: 18,
                //                             ),
                //                           ),
                //                           const SizedBox(height: 15),
                //                           Text(
                //                             article.title ?? "No Title",
                //                             maxLines: 3,
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.w700,
                //                               color: Colors.white,
                //                               fontSize: 20,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: watchprovider.newsarticle.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                watchprovider.newsarticle[index].title
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                watchprovider.newsarticle[index].author
                                    .toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                watchprovider.newsarticle[index].content
                                    .toString(),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                watchprovider.newsarticle[index].description
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
