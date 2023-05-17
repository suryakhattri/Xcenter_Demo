import 'package:flutter/material.dart';
import 'package:xcenter_demo/UI/News/news_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:xcenter_demo/UI/NotificationService/local_notification_services.dart';
import 'package:xcenter_demo/UI/Notification/push_notification_page.dart';
import 'package:xcenter_demo/Ui/Books/book_list.dart';
import 'package:xcenter_demo/Ui/Sport/sport_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState(title: '', icon: Icons.abc);
}

class _HomeState extends State<Home> {
  final String title;
  final IconData icon;

  _HomeState({required this.title, required this.icon});


  // firebase Notification initialize
  @override
  void initState() {
    super.initState();
    // This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PushNotificationPage(
                  id: message.data['_id'],
                ),
              ),
            );
          }
        }
      },
    );

    // This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationServices.createanddisplaynotification(message);
        }
      },
    );

    // This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

    // Side menu data declaration
    final shareData = [
      'SPORTS',
      'NOTIFICATIONS',
      'NEWS',
      'BOOKS',
      'EDUCATIONS',
      'MY NOTES',
      'BLOGS',
      'COMPANY LIST',
      'FORUM',
      'MERO SHARE',
      'CALCULATOR',
      'EXCHANGE RATE',
      'GOLD/SILVER',
      'LINKS',
      'RENT VEHICLE',
    ];

    //Home page data declaration
    final homeDetailsCategory = [
      _HomeState(title: "Sports", icon: Icons.sports_basketball),
      _HomeState(title: 'Notifications', icon: Icons.notifications_on_outlined),
      _HomeState(title: 'News', icon: Icons.menu_book),
      _HomeState(title: 'Books', icon: Icons.book_rounded),
      _HomeState(title: 'Education', icon: Icons.cast_for_education),
      _HomeState(title: 'My Notes', icon: Icons.event_note_sharp),
      _HomeState(title: "Blogs", icon: Icons.web_asset_outlined),
      _HomeState(title: 'Company List', icon: Icons.apartment),
      _HomeState(title: 'Forum', icon: Icons.message_outlined),
      _HomeState(title: 'Mero Share', icon: Icons.book),
      _HomeState(title: 'Calculator', icon: Icons.calculate_sharp),
      _HomeState(title: 'Exchange Rate', icon: Icons.money),
      _HomeState(title: 'Gold/Silver', icon: Icons.gavel_outlined),
      _HomeState(title: 'Links', icon: Icons.list),
      _HomeState(title: 'Rent Vehicle', icon: Icons.car_rental_sharp),
    ];
    return Scaffold(
      primary: true,
      //Appbar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 74, 109),
        leading: IconButton(
          onPressed: () {
            _scaffoldState.currentState?.openEndDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Center(child: Text("Home")),
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        key: _scaffoldState,
        backgroundColor: const Color.fromARGB(255, 98, 134, 166),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                  child: Material(
                    elevation: 1,
                    color: Colors.green[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      height: 120,
                      child: ListView(
                        itemExtent: 35,
                        physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        children: [
                          const ListTile(
                            leading: Text(
                              "NEPAL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            trailing: Text(
                              "Kathmandu",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              width: 230,
                              child: const Row(
                                children: [
                                  Text(
                                    "Jan-01-2023",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "(Sat)",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Material(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  color: const Color.fromARGB(255, 65, 74, 109),
                                  elevation: 2.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //         new IndexChart()));
                                    },
                                    child: const Text(
                                      "Live News ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15.0),
                                    ),
                                  )),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              width: 250,
                              child: const Row(
                                children: [
                                  Text(
                                    "Today",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    " 3:00 pm",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                      //  height: MediaQuery.of(context).size.height + 100,
                      color: const Color.fromARGB(255, 98, 134, 166),
                      // height: MediaQuery.of(context).size.height + 100,
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        crossAxisCount: 3,
                        children: homeDetailsCategory.map((value) {
                          return InkWell(
                            onTap: () {
                              if (value.title == "Sports") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new Sport()));
                              } else if (value.title == 'Notifications') {
                                //Navigator to next Page
                              } else if (value.title == 'News') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => News()));
                              } else if (value.title == 'Books') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new BookList()));
                              } else if (value.title == 'Education') {
                                //Navigator to next Page
                              } else if (value.title == 'My Notes') {
                                //Navigator to next Page
                              } else if (value.title == 'Blogs') {
                                //Navigator to next Page
                              } else if (value.title == 'Company List') {
                                //Navigator to next Page
                              } else if (value.title == 'Forum') {
                                //Navigator to next Page
                              } else if (value.title == 'Mero Share') {
                                //Navigator to next Page
                              } else if (value.title == 'Calculator') {
                                //Navigator to next Page
                              } else if (value.title == 'Exchange Rate') {
                                //Navigator to next Page
                              } else if (value.title == 'Gold/Silver') {
                                //Navigator to next Page
                              } else if (value.title == "Links") {
                                //Navigator to next Page
                              } else if (value.title == 'Rent Vehicle') {
                                //Navigator to next Page
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      (value.icon),
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      value.title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                )
              ],
            ),
          ),
        ),

        //Sidemenu  creation
        drawer: Drawer(
          child: Container(
            color: const Color.fromARGB(255, 98, 134, 166),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.separated(
                itemCount: shareData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      if (index == 0) {
                        //Navigate to next page
                      } else if (index == 1) {
                        //Navigate to next page
                      } else if (index == 2) {
                        //Navigate to next page
                      } else if (index == 3) {
                        //Navigate to next page
                      } else if (index == 4) {
                        //Navigate to next page
                      } else if (index == 5) {
                        //Navigate to next page
                      } else if (index == 6) {
                        //Navigate to next page
                      } else if (index == 7) {
                        //Navigate to next page
                      } else if (index == 8) {
                        //Navigate to next page
                      } else if (index == 9) {
                        //Navigate to next page
                      } else if (index == 10) {
                        //Navigate to next page
                      } else if (index == 11) {
                        //Navigate to next page
                      } else if (index == 12) {
                        //Navigate to next page
                      } else if (index == 13) {
                        //Navigate to next page
                      } else if (index == 14) {
                        //Navigate to next page
                      } else if (index == 15) {
                        //Navigate to next page
                      }
                    },
                    leading: const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    title: Text(
                      shareData[index],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 0.2,
                    color: Colors.white,
                  );
                },
              ),
            ),
          ),
        ),

        //Creating End Drawer
        endDrawer: Drawer(
          child: Container(
            color: const Color.fromARGB(255, 98, 134, 166),
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => new UserProfile()));
                  },
                  leading: Container(
                    margin: const EdgeInsets.only(top: 0.0),
                    width: 70.0,
                    height: 70.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('Assets/Images/user.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  title: const Text(
                    'Jone Doooy',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  subtitle: const Text(
                    'test123@gmail.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                  // trailing: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
                  //   Navigator.pop(context);
                  // },),//           <-- subtitle
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: const Text(
                    "HOME",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: Text(
                    "THEME",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => new PrivacyPolicy()));
                  },
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: const Text(
                    "PRIVACY POLICY",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => new Notifications()));
                  },
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: const Text(
                    "NOTIFICATION",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: Text(
                    "SHARE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => new AboutApp()));
                  },
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: const Text(
                    "ABOUT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: Text(
                    "RATE US",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: Text(
                    "LIKE US",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => new TermsAndCondition()));
                  },
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: const Text(
                    "TERMS AND CONDITION",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => new FeedBack()));
                  },
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: const Text(
                    "WRITE US/FEEDBACK",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => new Credits()));
                  },
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: const Text(
                    "CREDITS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: Text(
                    "LOGOUT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      //Bottom Navbar
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 65, 74, 109),
        child: Row(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  _scaffoldState.currentState?.openDrawer();
                }),
            const Spacer(),
            IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Home()));
                }),
            const Spacer(),
            IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
