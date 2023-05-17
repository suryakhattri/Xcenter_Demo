import 'package:flutter/material.dart';
import 'package:xcenter_demo/ApiServices/api_service.dart';
import 'package:xcenter_demo/Model/news_model.dart';
import 'package:xcenter_demo/UI/News/news_details_pages.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool _messageSelected = true;

  void appBarChange() {
    setState(() {});
  }

  late Future<NewsModel> _newsData;

  @override
  void initState() {
    super.initState();
    _newsData = fetchNewsFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarMenu(context),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FutureBuilder<NewsModel>(
                future: _newsData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                       const NewsDetailsPage()));

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //          NewsDetailsPage(title: snapshot.data!.articles![index].title!)));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15.0, right: 15.0),
                                  child: Material(
                                    elevation: 5,
                                    color: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: SizedBox(
                                      height: 150,
                                      child: ListView(
                                        //itemExtent: 35,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: Text(
                                                        snapshot
                                                                .data!
                                                                .articles?[index]
                                                                .author ??
                                                            "",
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 10.0),
                                                      child: SizedBox(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                2.5,
                                                        child: Text(
                                                          snapshot
                                                                  .data!
                                                                  .articles?[index]
                                                                  .title ??
                                                              "",
                                                          maxLines: 2,
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight
                                                                  .normal),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    Text(
                                                        "Published At: ${snapshot.data!.articles?[index].publishedAt?.year}-${snapshot.data!.articles?[index].publishedAt?.month}-${snapshot.data!.articles?[index].publishedAt?.day} "),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                    top: 10.0,
                                                    bottom: 10,
                                                    right: 10,
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
                                                          height: 100.0,
                                                          width: 100.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                })));
  }
}

AppBarMenu(BuildContext context) {
  return AppBar(
    title: const Center(child: Text("News")),
    leading: Builder(builder: (BuildContext context) {
      return IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          });
    }),
    elevation: 0.1,
    backgroundColor: const Color.fromARGB(255, 65, 74, 109),
    automaticallyImplyLeading: false,
  );
}
