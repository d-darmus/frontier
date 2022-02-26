import 'package:flutter/material.dart';
// import 'package:frontier/basis/sample/sample_tab1.dart';
import 'package:frontier/basis/sample/sample_grid_layout.dart';
// import 'package:frontier/basis/sample/sample_list_layout.dart';
import 'package:frontier/test/test_page.dart';
import 'package:frontier/test/test_page2.dart';

class TabApp extends StatelessWidget {
  const TabApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabPage(title: 'Flutter Title'),
    );
  }
}

class TabPage extends StatefulWidget {
  const TabPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = [const Tab(text:'メイン'),const Tab(text:'サブ'),const Tab(text:'設定')];
  final List<Widget> _tabList = [const TestPage2Builder(),GridLayout.sample(),const TestPageBuilder()];
  late TabController _tabController;
  @override
  void initState(){
    _tabController = TabController(length:tabs.length,vsync:this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: TabBar(
          tabs:tabs,
          controller:_tabController,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller:_tabController,
        children:tabs.map(
          (tab){return _createTab(tab);}
        ).toList(),
      ),
    );
  }
  Widget _createTab(Tab tab){
    for(int i = 0; i < tabs.length; i++){
      if(tabs[i] == tab){
        return _tabList[i];
      }
    }
    return const Text('');
  }
}
