import 'package:flutter/material.dart';


class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 98, 134, 166),
      appBar: AppBarMenu(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0,),
                child: Container(
                  color: Color.fromARGB(255, 98, 134, 166),
                  child: GridView.builder(
                      physics: ScrollPhysics(),
                      itemCount: 7,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.70,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) => BookItem()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> new BookList()));
        },

        child: Material(
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //  SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 160,
                  width: 300,
                  decoration: BoxDecoration(
                    // color: Colors.deepPurple
                  ),
                  child: Image.asset(
                    'Assets/Images/justice.png', fit: BoxFit.fill,),

                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 20.0),
                child: Container(
                  width: 220,
                  child: Text("The Kings Of Drugs", style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),),
                ),
                //child: Text("The bibal is a catholic book",  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, left: 20.0),
                child: Text("Robbie Williams",
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),),
              ),
            ],
          ),
        ),
      ),

    );
  }
}


//App bar 
AppBarMenu(BuildContext context) {
  return AppBar(
    title: const Center(child: Text("Books")),
    leading: Builder(builder: (BuildContext context) {
      return IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          });
    }),
    elevation: 10,
    backgroundColor: const Color.fromARGB(255, 65, 74, 109),
    automaticallyImplyLeading: false,
  );
}