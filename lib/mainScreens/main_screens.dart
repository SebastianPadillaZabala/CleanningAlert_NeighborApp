import 'package:cleanning_alert_neighbor/authentication/login_screen.dart';
import 'package:cleanning_alert_neighbor/tabPages/ubicacion_tab.dart';
import 'package:cleanning_alert_neighbor/tabPages/home_tab.dart';
import 'package:cleanning_alert_neighbor/tabPages/profile_tab.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;
  bool flag = true;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
      if (index == 1) {
        flag = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color.fromARGB(255, 5, 125, 113),
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              if (flag == true) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              } else {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MainScreen()));
                flag = true;
              }
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_alert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [HomeTabPage(), UbicacionTabPage(), ProfileTabPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'ubicación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_sharp),
            label: 'Profiles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Color.fromARGB(255, 81, 200, 127),
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
