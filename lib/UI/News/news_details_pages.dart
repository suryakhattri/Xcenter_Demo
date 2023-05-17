import 'package:flutter/material.dart';
import 'package:xcenter_demo/ApiServices/api_service.dart';
import 'package:xcenter_demo/Model/news_model.dart';


class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({Key? key}) : super(key: key);

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {

  //Api declaration
  late Future<NewsModel> _newsDetailsData;

  @override
  void initState() {
    super.initState();
    _newsDetailsData = fetchNewsFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarMenu(context),
        body: FutureBuilder<NewsModel>(
            future: _newsDetailsData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 10,
                              right: 10,
                              left: 10.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Text(snapshot.data!
                                  .articles?[index].author ?? "",
                                style: const TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),


                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 10,
                              right: 10,
                              left: 10.0,
                            ),
                            child: Expanded(
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(
                                    8.0),
                                child: Image.network(
                                    snapshot
                                        .data
                                        ?.articles?[
                                    index]
                                        .urlToImage ??
                                        "",
                                    fit: BoxFit.fill,
                                    height: 200,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 10,
                              right: 10,
                              left: 10.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Text(snapshot.data!
                                  .articles?[index].title ?? "",
                                style: const TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),


                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 10,
                              right: 10,
                              left: 10.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Text(snapshot.data!
                                  .articles?[index].description ?? "",
                                style: const TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            }));
  }
}
AppBarMenu(BuildContext context) {
  return AppBar(
    title: const Center(child: Text("News Details")),
    leading: Builder(builder: (BuildContext context) {
      return IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          });
    }),
    elevation: 0.1,
    backgroundColor: const Color.fromARGB(255, 65, 74, 109),
    automaticallyImplyLeading: false,
  );
}

