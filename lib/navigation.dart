import 'package:flutter/material.dart';

class Destination {
  const Destination(this.label, this.icon, this.selectedIcon,
      [this.enabled = true]);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final bool enabled;
}

const List<Destination> mainDestinations = <Destination>[
  Destination('首页', Icon(Icons.home_outlined), Icon(Icons.home)),
  Destination(
      '公告', Icon(Icons.announcement_outlined), Icon(Icons.announcement)),
  Destination('订阅内容', Icon(Icons.subscriptions_outlined),
      Icon(Icons.subscriptions), false),
];

const List<Destination> novelDestinations = <Destination>[
  Destination('全部小说', Icon(Icons.book_outlined), Icon(Icons.book)),
  Destination('近期排行', Icon(Icons.whatshot_outlined), Icon(Icons.whatshot)),
  Destination(
      '我的书架', Icon(Icons.library_books_outlined), Icon(Icons.library_books)),
];

const List<Destination> socialDestinations = <Destination>[
  Destination('社区', Icon(Icons.question_answer_outlined),
      Icon(Icons.question_answer), false),
  Destination('阅读历史', Icon(Icons.history_outlined), Icon(Icons.history)),
];

const List<Destination> settingDestinations = <Destination>[
  Destination('设置', Icon(Icons.settings_outlined), Icon(Icons.settings)),
  Destination('帮助', Icon(Icons.help_outline_outlined), Icon(Icons.help), false),
  Destination(
      '发送反馈', Icon(Icons.feedback_outlined), Icon(Icons.feedback), false),
  Destination('贡献列表', Icon(Icons.people_outlined), Icon(Icons.people)),
];

const List<Text> labels = <Text>[
  Text('首页'),
  Text('公告'),
  Text('订阅内容'),
  Text('全部小说'),
  Text('近期排行'),
  Text('我的书架'),
  Text('社区'),
  Text('阅读历史'),
  Text('设置'),
  Text('帮助'),
  Text('发送反馈'),
  Text('贡献列表'),
];

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Text screenLabel = labels[0];
  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenLabel = labels[selectedScreen];
      screenIndex = selectedScreen;
    });
    closeDrawer();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeEndDrawer();
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: screenLabel,
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Page Index =  $screenIndex'),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 12, 24, 24),
            child: Row (
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('U'),
                ),
                SizedBox(width: 16),
                Text('Username'),
              ],
            ),
          ),
          ...mainDestinations.map(
            (Destination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                // enabled: destination.enabled,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 4, 16, 2),
            child: Divider(),
          ),
          ...novelDestinations.map(
            (Destination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                // enabled: destination.enabled,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 4, 16, 2),
            child: Divider(),
          ),
          ...socialDestinations.map(
            (Destination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                // enabled: destination.enabled,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 4, 16, 2),
            child: Divider(),
          ),
          ...settingDestinations.map(
            (Destination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                // enabled: destination.enabled,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 450;
  }

  @override
  Widget build(BuildContext context) {
    // handleScreenChanged(0);
    return buildDrawerScaffold(context);
  }
}
