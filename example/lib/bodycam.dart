import 'package:flutter/material.dart';
import 'package:flutter/services.dart';








//////////////////////////////////////////////


class MainCommunicationWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Communication Widgets"),
        ),
        body: ParentPage(),
      ),
    );
  }
}



/////////////////////////////////////////////
class ParentPage extends StatefulWidget
{
  @override
  ParentPageState createState() => ParentPageState();
}

class ParentProvider extends InheritedWidget
{
  final TabController? tabController;
  final Widget child;
  final String? title;

  ParentProvider({this.tabController, required this.child, this.title,}) : super(child: child);

  @override
  bool updateShouldNotify(ParentProvider oldWidget) {
    return true;
  }

  static ParentProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ParentProvider>();
}

class ParentPageState extends State<ParentPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  String myTitle = "My Parent Title";
  String? updateChild2Title;
  String? updateChild1Title;

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  updateChild2(String text) {
    setState(() {
      updateChild2Title = text;
    });
  }

  updateParent(String text) {
    setState(() {
      myTitle = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ParentProvider(
      tabController: _controller,
      title: updateChild2Title,
      child: Column(
        children: [
          ListTile(
            title: Text(
              myTitle,
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            //Update Child 1 from Parent
            child: Text("Action 1"),
            onPressed: () {
              setState(() {
                updateChild1Title = "Update from Parent";
              });
            },
          ),
          TabBar(
            controller: _controller,
            tabs: [
              Tab(
                text: "First",
                icon: Icon(Icons.check_circle),
              ),
              Tab(
                text: "Second",
                icon: Icon(Icons.crop_square),
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Child1Page(
                  title: updateChild1Title,
                  child2Action2: updateParent,
                  child2Action3: updateChild2,
                ),
                Child2Page(),
              ],
            ),
          )
        ],
      ),
    );
  }
}


////////////////////////////////////////////////////////////////////////////////

class Child1Page extends StatefulWidget {
  final String? title;
  final ValueChanged<String>? child2Action3;
  final ValueChanged<String>? child2Action2;
  final Function? onLoad;

  const Child1Page({
    Key? key,
    this.title,
    this.child2Action2,
    this.child2Action3,
    this.onLoad,
  }) : super(key: key);

  @override
  Child1PageState createState() => Child1PageState();
}

class Child1PageState extends State<Child1Page> {
  String value = "Page 1";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            widget.title ?? value,
            style: Theme.of(context).primaryTextTheme.headline5,
          ),
          ElevatedButton(
            //Update Parent from Child 1
            child: Text("Action 2"),
            onPressed: () {
              widget.child2Action2!("Update from Child 1");
            },
          ),
          ElevatedButton(
            //Update Child 2 from Child 1
            child: Text("Action 3"),
            onPressed: () {
              widget.child2Action3!("Update from Child 1");
            },
          ),
          ElevatedButton(
            //Change Tab from Child 1 to Child 2
            child: Text("Action 4"),
            onPressed: () {
              final controller = ParentProvider.of(context)!.tabController!;
              controller.index = 1;
            },
          )
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class Child2Page extends StatefulWidget {
  final String? title;

  const Child2Page({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Child2PageState createState() => Child2PageState();
}

class Child2PageState extends State<Child2Page> {
  String value = "Page 2";

  @override
  Widget build(BuildContext context) {
    final title = ParentProvider.of(context)!.title;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            title ?? value,
            style: Theme.of(context).primaryTextTheme.headline5,
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Samples"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            // MyMenuButton(
            //   title: "Fetch Data JSON",
            //   actionTap: () {
            //     onButtonTap(
            //       MainFetchData(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //     title: "Persistent Tab Bar",
            //     actionTap: () {
            //       onButtonTap(
            //         MainPersistentTabBar(),
            //       );
            //     }),
            // MyMenuButton(
            //   title: "Collapsing Toolbar",
            //   actionTap: () {
            //     onButtonTap(
            //       MainCollapsingToolbar(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Hero Animations",
            //   actionTap: () {
            //     onButtonTap(
            //       MainHeroAnimationsPage(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Size and Positions",
            //   actionTap: () {
            //     onButtonTap(
            //       MainSizeAndPosition(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "ScrollController and ScrollNotification",
            //   actionTap: () {
            //     onButtonTap(
            //       MainScrollController(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Apps Clone",
            //   actionTap: () {
            //     onButtonTap(
            //       MainAppsClone(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Animations",
            //   actionTap: () {
            //     onButtonTap(
            //       MainAnimations(),
            //     );
            //   },
            // ),
            MyMenuButton(
              title: "Communication Widgets",
              actionTap: () {
                onButtonTap(
                  MainCommunicationWidgets(),
                );
              },
            ),
            // MyMenuButton(
            //   title: "Split Image",
            //   actionTap: () {
            //     onButtonTap(MainSplitImage());
            //   },
            // ),
            // MyMenuButton(
            //   title: "Custom AppBar & SliverAppBar",
            //   actionTap: () {
            //     onButtonTap(MainAppBarSliverAppBar());
            //   },
            // ),
            // MyMenuButton(
            //   title: "Menu Navigations",
            //   actionTap: () {
            //     onButtonTap(MainMenuNavigations());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class MyMenuButton extends StatelessWidget {
  final String? title;
  final VoidCallback? actionTap;

  MyMenuButton({this.title, this.actionTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: new Text(title!),
        onPressed: actionTap,
      ),
    );
  }
}